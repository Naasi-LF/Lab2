<?php 
# DISPLAY COMPLETE FORUM PAGE.

# Access session.
session_start();

# Redirect if not logged in.
if (!isset($_SESSION['user_id'])) { 
    require('login_tools.php'); 
    load(); 
}

# Set page title and display header section.
$page_title = 'Forum';
include('includes/header.html');

# Open database connection.
require('connect_db.php');

# Get search and sort parameters
$search = isset($_GET['search']) ? mysqli_real_escape_string($dbc, $_GET['search']) : '';
$order = isset($_GET['order']) ? $_GET['order'] : 'DESC';
?>

<!-- Navigation bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container">
        <a class="navbar-brand" href="#">Forum</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="post.php">Post Message</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="shop.php">Shop</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="home.php">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="orders_received.php">Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="goodbye.php">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <!-- Search and Sort Form -->
    <form method="get" action="forum.php" class="mb-4">
        <div class="row g-3 align-items-center">
            <div class="col-md-8">
                <input type="text" name="search" class="form-control" placeholder="Search by subject, message, or user name..." value="<?php echo htmlspecialchars($search); ?>">
            </div>
            <div class="col-md-2">
                <select name="order" class="form-select">
                    <option value="DESC" <?php if ($order == 'DESC') echo 'selected'; ?>>Newest First</option>
                    <option value="ASC" <?php if ($order == 'ASC') echo 'selected'; ?>>Oldest First</option>
                </select>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary w-100">Search</button>
            </div>
        </div>
    </form>

    <!-- Display forum messages -->
    <?php
    # Build query with search and order
    $q = "SELECT * FROM forum";
    if (!empty($search)) {
        $q .= " WHERE subject LIKE '%$search%' OR message LIKE '%$search%' OR first_name LIKE '%$search%' OR last_name LIKE '%$search%' OR CONCAT(first_name, ' ', last_name) LIKE '%$search%'";
    }
    $q .= " ORDER BY post_date $order";
    $r = mysqli_query($dbc, $q);

    # Check if there are results
    if (mysqli_num_rows($r) > 0) {
        echo '<table class="table table-striped table-hover table-bordered">';
        echo '<thead class="table-dark"><tr><th>Posted By</th><th>Subject</th><th>Message</th><th>Post Date</th></tr></thead><tbody>';
        while ($row = mysqli_fetch_array($r, MYSQLI_ASSOC)) {
            echo '<tr>';
            echo '<td>' . htmlspecialchars($row['first_name']) . ' ' . htmlspecialchars($row['last_name']) . '</td>';
            echo '<td>' . htmlspecialchars($row['subject']) . '</td>';
            echo '<td>' . htmlspecialchars($row['message']) . '</td>';
            echo '<td>' . htmlspecialchars($row['post_date']) . '</td>';
            echo '</tr>';
        }
        echo '</tbody></table>';
    } else {
        echo '<p class="text-center">No messages found matching your criteria.</p>';
    }

    # Close database connection.
    mysqli_close($dbc);
    ?>
</div>

<?php 
# Display footer section.
include('includes/footer.html');
?>
