<?php 
# DISPLAY CHECKOUT PAGE.

# Access session.
session_start();

# Redirect if not logged in.
if (!isset($_SESSION['user_id'])) { 
    require('login_tools.php'); 
    load(); 
}

# Set page title and display header section.
$page_title = 'Checkout';
include('includes/header.html');

echo '<div class="container mt-5 text-center">';

# Check for passed total and cart.
if (isset($_GET['total']) && ($_GET['total'] > 0) && (!empty($_SESSION['cart']))) {
    # Open database connection.
    require('connect_db.php');
  
    # Store buyer and order total in 'orders' database table.
    $q = "INSERT INTO orders (user_id, total, order_date) VALUES (". $_SESSION['user_id'] . "," . $_GET['total'] . ", NOW())";
    $r = mysqli_query($dbc, $q);

    # Retrieve current order number.
    $order_id = mysqli_insert_id($dbc);

    # Retrieve cart items from 'shop' database table.
    $q = "SELECT * FROM shop WHERE item_id IN (" . implode(',', array_keys($_SESSION['cart'])) . ") ORDER BY item_id ASC";
    $r = mysqli_query($dbc, $q);

    # Store order contents in 'order_contents' database table.
    while ($row = mysqli_fetch_array($r, MYSQLI_ASSOC)) {
        $query = "INSERT INTO order_contents (order_id, item_id, quantity, price) VALUES ($order_id, " . $row['item_id'] . "," . $_SESSION['cart'][$row['item_id']]['quantity'] . "," . $_SESSION['cart'][$row['item_id']]['price'] . ")";
        $result = mysqli_query($dbc, $query);
    }

    # Close database connection.
    mysqli_close($dbc);

    # Display order confirmation.
    echo '<div class="card shadow-sm p-5 mx-auto" style="max-width: 600px;">';
    echo '  <div class="card-body">';
    echo '      <h2 class="card-title text-success">Thank You!</h2>';
    echo '      <p class="card-text fs-5">Your order has been placed successfully.</p>';
    echo '      <p class="card-text fs-4">Order Number: <strong>#' . $order_id . '</strong></p>';
    echo '  </div>';
    echo '</div>';

    # Clear cart items.
    $_SESSION['cart'] = NULL;
} else {
    # Display message if cart is empty.
    echo '<div class="alert alert-warning" role="alert">There are no items in your cart.</div>';
}

echo '</div>';

# Display footer section with navigation.
echo '<div class="container text-center mt-5">';
echo '  <a href="shop.php" class="btn btn-primary me-2">Back to Shop</a>';
echo '  <a href="forum.php" class="btn btn-outline-secondary me-2">Forum</a>';
echo '  <a href="home.php" class="btn btn-outline-secondary">Home</a>';
echo '</div>';

include('includes/footer.html');
?>
