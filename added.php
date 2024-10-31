<?php 
# DISPLAY SHOPPING CART ADDITIONS PAGE.

# Access session.
session_start();

# Redirect if not logged in.
if (!isset($_SESSION['user_id'])) { 
    require('login_tools.php'); 
    load(); 
}

# Set page title and display header section.
$page_title = 'Cart Addition';
include('includes/header.html');

# Get passed product id and assign it to a variable.
if (isset($_GET['id'])) $id = $_GET['id']; 

# Open database connection.
require('connect_db.php');

# Retrieve selective item data from 'shop' database table. 
$q = "SELECT * FROM shop WHERE item_id = $id";
$r = mysqli_query($dbc, $q);

if (mysqli_num_rows($r) == 1) {
    $row = mysqli_fetch_array($r, MYSQLI_ASSOC);

    echo '<div class="container mt-5 text-center">';
    echo '  <div class="card shadow-sm p-4 mx-auto" style="max-width: 500px;">';
    echo '      <div class="card-body">';
    
    # Check if cart already contains one of this product id.
    if (isset($_SESSION['cart'][$id])) { 
        # Add one more of this product.
        $_SESSION['cart'][$id]['quantity']++; 
        echo '<h2 class="card-title text-success">Item Added!</h2>';
        echo '<p class="card-text">Another <strong>' . htmlspecialchars($row["item_name"]) . '</strong> has been added to your cart.</p>';
    } else {
        # Or add one of this product to the cart.
        $_SESSION['cart'][$id] = array('quantity' => 1, 'price' => $row['item_price']);
        echo '<h2 class="card-title text-success">Item Added!</h2>';
        echo '<p class="card-text">A <strong>' . htmlspecialchars($row["item_name"]) . '</strong> has been added to your cart.</p>';
    }

    echo '      </div>';
    echo '      <div class="card-footer">';
    echo '          <a href="shop.php" class="btn btn-primary me-2">Back to Shop</a>';
    echo '          <a href="cart.php" class="btn btn-outline-secondary">View Cart</a>';
    echo '      </div>';
    echo '  </div>';
    echo '</div>';
}

# Close database connection.
mysqli_close($dbc);

# Display footer section.
include('includes/footer.html');
?>
