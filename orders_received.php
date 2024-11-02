<?php 
# DISPLAY USER'S RECEIVED ORDERS.

# Access session.
session_start();

# Redirect if not logged in.
if (!isset($_SESSION['user_id'])) { 
    require('login_tools.php'); 
    load(); 
}

# Set page title and display header section.
$page_title = 'My Orders';
include('includes/header.html');

# Open database connection.
require('connect_db.php');

# Handle sort order (default to DESC)
$order_by = isset($_GET['order_by']) && $_GET['order_by'] === 'asc' ? 'ASC' : 'DESC';

# Retrieve user's orders based on selected sort order
$user_id = $_SESSION['user_id'];
$q = "SELECT orders.order_id, orders.total, orders.order_date 
      FROM orders 
      WHERE orders.user_id = $user_id 
      ORDER BY orders.order_date $order_by";
$r = mysqli_query($dbc, $q);

# Display navigation bar
?>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container">
        <a class="navbar-brand" href="home.php">My Orders</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="shop.php">Shop</a></li>
                <li class="nav-item"><a class="nav-link" href="cart.php">View Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="forum.php">Forum</a></li>
                <li class="nav-item"><a class="nav-link" href="home.php">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="goodbye.php">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<?php
echo '<div class="container mt-5">';
echo '  <h1 class="text-center display-4 text-primary mb-4">My Orders</h1>';

# Sorting buttons
echo '<div class="text-center mb-4">';
echo '  <a href="orders_received.php?order_by=asc" class="btn btn-outline-primary me-2">Sort by Date Ascending</a>';
echo '  <a href="orders_received.php?order_by=desc" class="btn btn-outline-primary">Sort by Date Descending</a>';
echo '</div>';

# Check if there are any orders
if (mysqli_num_rows($r) > 0) {
    while ($order = mysqli_fetch_array($r, MYSQLI_ASSOC)) {
        echo '<div class="card mb-4 shadow border-0 rounded" style="border-radius: 10px;">';
        echo '  <div class="card-body">';
        echo '      <div class="d-flex justify-content-between align-items-center mb-3">';
        echo '          <h5 class="card-title mb-0 text-primary">Order #'.$order['order_id'].'</h5>';
        echo '          <span class="text-muted">Date: '.date("M d, Y", strtotime($order['order_date'])).'</span>';
        echo '      </div>';
        echo '      <h6 class="text-success mb-3">Total: ¥'.number_format($order['total'], 2).'</h6>';

        # Retrieve all items in the current order
        $order_id = $order['order_id'];
        $q_items = "SELECT shop.item_name, order_contents.quantity, order_contents.price 
                    FROM order_contents 
                    INNER JOIN shop ON order_contents.item_id = shop.item_id 
                    WHERE order_contents.order_id = $order_id";
        $r_items = mysqli_query($dbc, $q_items);

        # Display order items in a neat, concise layout
        echo '<ul class="list-group list-group-flush">';
        while ($item = mysqli_fetch_array($r_items, MYSQLI_ASSOC)) {
            $subtotal = $item['quantity'] * $item['price'];
            echo '<li class="list-group-item d-flex justify-content-between align-items-center">';
            echo '  <div>';
            echo '    <strong>'.$item['item_name'].'</strong>';
            echo '    <p class="mb-0 text-muted">Qty: '.$item['quantity'].' | ¥'.number_format($item['price'], 2).'</p>';
            echo '  </div>';
            echo '  <span class="text-muted">Subtotal: ¥'.number_format($subtotal, 2).'</span>';
            echo '</li>';
        }
        echo '</ul>';

        echo '  </div>';  # Close card body
        echo '</div>';    # Close card
    }
} else {
    echo '<p class="text-center">You have no orders yet.</p>';
}

echo '</div>';

# Close database connection
mysqli_close($dbc);

# Display footer section
include('includes/footer.html');
?>
