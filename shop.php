<?php 
# Access session.
session_start();

# Redirect if not logged in.
if (!isset($_SESSION['user_id'])) { require('login_tools.php'); load(); }

# Set page title and display header section.
$page_title = 'Shop';
include('includes/header.html');

# Open database connection.
require('connect_db.php');

# Get filter values
$search_query = isset($_GET['search']) ? mysqli_real_escape_string($dbc, $_GET['search']) : '';
$vegetarian = isset($_GET['vegetarian']) ? 1 : 0;
$hasMeat = isset($_GET['hasMeat']) ? 1 : 0;
$hasFish = isset($_GET['hasFish']) ? 1 : 0;
$price_min = isset($_GET['price_min']) ? (int)$_GET['price_min'] : 0;
$price_max = isset($_GET['price_max']) ? (int)$_GET['price_max'] : 100;
$spiciness_min = isset($_GET['spiciness_min']) ? (int)$_GET['spiciness_min'] : 0;
$spiciness_max = isset($_GET['spiciness_max']) ? (int)$_GET['spiciness_max'] : 5;
$restaurant = isset($_GET['restaurant']) ? mysqli_real_escape_string($dbc, $_GET['restaurant']) : '';
$sort_by = isset($_GET['sort_by']) ? mysqli_real_escape_string($dbc, $_GET['sort_by']) : 'name_asc';

# Define sorting conditions based on selected sort option
$sort_query = '';
switch ($sort_by) {
    case 'name_asc':
        $sort_query = 'ORDER BY item_name ASC';
        break;
    case 'name_desc':
        $sort_query = 'ORDER BY item_name DESC';
        break;
    case 'price_asc':
        $sort_query = 'ORDER BY item_price ASC';
        break;
    case 'price_desc':
        $sort_query = 'ORDER BY item_price DESC';
        break;
}

# Query with filters and sorting
$q = "SELECT * FROM shop WHERE item_name LIKE '%$search_query%'";
if ($vegetarian) { $q .= " AND vegetarian=1"; }
if ($hasMeat) { $q .= " AND hasMeat=1"; }
if ($hasFish) { $q .= " AND hasFish=1"; }
$q .= " AND item_price BETWEEN $price_min AND $price_max";
$q .= " AND spiciness BETWEEN $spiciness_min AND $spiciness_max";
if ($restaurant) { $q .= " AND restaurant='$restaurant'"; }
$q .= " $sort_query";

$r = mysqli_query($dbc, $q);

# Get list of unique restaurants for the dropdown
$restaurants_result = mysqli_query($dbc, "SELECT DISTINCT restaurant FROM shop");

# Display filters and search bar
?>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="home.php">Shop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="cart.php">View Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="forum.php">Forum</a></li>
                <li class="nav-item"><a class="nav-link" href="home.php">Home</a></li>
                <li class="nav-item">
                    <a class="nav-link" href="orders_received.php">orders</a>
                </li>
                <li class="nav-item"><a class="nav-link" href="goodbye.php">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h1 class="text-center display-4 fw-light text-uppercase mb-4">Shop</h1>
    
    <!-- Filter and Search Form -->
    <form method="get" action="shop.php" class="mb-5">
        <div class="row g-3 align-items-center">
            <div class="col-md-6">
                <input type="text" name="search" class="form-control form-control-lg" placeholder="Search for dishes..." value="<?php echo htmlspecialchars($search_query); ?>">
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary btn-lg w-100">Search</button>
            </div>
        </div>

        <div class="row g-3 mt-4">
            <!-- Price and Spiciness Filters -->
            <div class="col-md-4">
                <label for="price-range" class="form-label">Price Range</label>
                <input type="range" class="form-range" min="0" max="100" name="price_min" value="<?php echo $price_min; ?>">
                <input type="range" class="form-range" min="0" max="100" name="price_max" value="<?php echo $price_max; ?>">
            </div>
            <div class="col-md-4">
                <label for="spiciness_min" class="form-label">Spiciness Range</label>
                <input type="range" class="form-range" min="0" max="5" name="spiciness_min" value="<?php echo $spiciness_min; ?>">
                <input type="range" class="form-range mt-2" min="0" max="5" name="spiciness_max" value="<?php echo $spiciness_max; ?>">
            </div>

            <!-- Dietary Preferences -->
            <div class="col-md-4">
                <label class="form-label">Dietary Preferences</label><br>
                <div class="btn-group" role="group">
                    <input type="checkbox" class="btn-check" id="vegetarian" name="vegetarian" <?php if ($vegetarian) echo 'checked'; ?>>
                    <label class="btn btn-outline-success" for="vegetarian">Vegetarian</label>
                    <input type="checkbox" class="btn-check" id="hasMeat" name="hasMeat" <?php if ($hasMeat) echo 'checked'; ?>>
                    <label class="btn btn-outline-danger" for="hasMeat">Meat</label>
                    <input type="checkbox" class="btn-check" id="hasFish" name="hasFish" <?php if ($hasFish) echo 'checked'; ?>>
                    <label class="btn btn-outline-primary" for="hasFish">Fish</label>
                </div>
            </div>

            <!-- Restaurant and Sort Filter -->
            <div class="col-md-4">
                <label for="restaurant" class="form-label">Select Restaurant</label>
                <select class="form-select" id="restaurant" name="restaurant">
                    <option value="">All Restaurants</option>
                    <?php while ($row = mysqli_fetch_array($restaurants_result, MYSQLI_ASSOC)) : ?>
                        <option value="<?php echo $row['restaurant']; ?>" <?php if ($restaurant == $row['restaurant']) echo 'selected'; ?>>
                            <?php echo $row['restaurant']; ?>
                        </option>
                    <?php endwhile; ?>
                </select>
            </div>

            <div class="col-md-4">
                <label for="sort_by" class="form-label">Sort By</label>
                <select class="form-select" id="sort_by" name="sort_by">
                    <option value="name_asc" <?php if ($sort_by == 'name_asc') echo 'selected'; ?>>Name (A-Z)</option>
                    <option value="name_desc" <?php if ($sort_by == 'name_desc') echo 'selected'; ?>>Name (Z-A)</option>
                    <option value="price_asc" <?php if ($sort_by == 'price_asc') echo 'selected'; ?>>Price (Low to High)</option>
                    <option value="price_desc" <?php if ($sort_by == 'price_desc') echo 'selected'; ?>>Price (High to Low)</option>
                </select>
            </div>
        </div>
    </form>
</div>

<div class="container">
    <div class="row">
        <?php
        if (mysqli_num_rows($r) > 0) {
            while ($row = mysqli_fetch_array($r, MYSQLI_ASSOC)) {
                echo '<div class="col-md-4 mb-4">';
                echo '  <div class="card shadow-sm h-100">';
                echo '      <img src="' . $row['restaurant'] . '/' . $row['item_img'] . '" class="card-img-top" alt="' . htmlspecialchars($row['item_name']) . '" style="object-fit: cover; width: 100%; height: 200px;">';
                echo '      <div class="card-body text-center">';
                echo '          <h5 class="card-title">' . htmlspecialchars($row['item_name']) . '</h5>';
                echo '          <p class="card-text text-muted">¥' . number_format($row['item_price'], 2) . '</p>';
                echo '          <a href="item_detail.php?id=' . $row['item_id'] . '" class="btn btn-outline-primary">View Details</a>';
                echo '      </div>';
                echo '  </div>';
                echo '</div>';
            }
        } else {
            echo '<p class="text-center">No items found matching your criteria.</p>';
        }
        ?>
    </div>
</div>

<?php
# Close database connection.
mysqli_close($dbc);

# Display footer section.
include('includes/footer.html');
?>
