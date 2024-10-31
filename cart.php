<?php
# Access session.
session_start();

# Redirect if not logged in.
if (!isset($_SESSION['user_id'])) { require('login_tools.php'); load(); }

# Set page title and display header section.
$page_title = 'Cart';
include('includes/header.html');

# Display navigation links using Bootstrap Navbar.
?>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="home.php">View Cart</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="shop.php">Shop</a></li>
                <li class="nav-item"><a class="nav-link" href="home.php">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="forum.php">Forum</a></li>
                <li class="nav-item">
                    <a class="nav-link" href="orders_received.php">orders</a>
                </li>
                <li class="nav-item"><a class="nav-link" href="goodbye.php">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<?php
# Check if form has been submitted for update.
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    foreach ($_POST['qty'] as $item_id => $item_qty) {
        $id = (int) $item_id;
        $qty = (int) $item_qty;
        if ($qty == 0) { unset($_SESSION['cart'][$id]); }
        elseif ($qty > 0) { $_SESSION['cart'][$id]['quantity'] = $qty; }
    }
}

# Initialize grand total variable.
$total = 0;

# Display the cart if not empty.
if (!empty($_SESSION['cart'])) {
    require('connect_db.php');
    
    # Retrieve all items in the cart from the 'shop' database table.
    $q = "SELECT * FROM shop WHERE item_id IN (";
    foreach ($_SESSION['cart'] as $id => $value) { $q .= $id . ','; }
    $q = substr($q, 0, -1) . ') ORDER BY item_id ASC';
    $r = mysqli_query($dbc, $q);

    # Display body section with a form and Bootstrap table.
    echo '
    <div class="container mt-5">
        <h1 class="text-center mb-4">Shopping Cart</h1>
        <form action="cart.php" method="post">
            <table class="table table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Item</th>
                        <th>Description</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>';
    
    while ($row = mysqli_fetch_array($r, MYSQLI_ASSOC)) {
        $subtotal = $_SESSION['cart'][$row['item_id']]['quantity'] * $row['item_price'];
        $total += $subtotal;
        
        echo "
            <tr>
                <td>{$row['item_name']}</td>
                <td>{$row['item_desc']}</td>
                <td>
                    <input type='number' class='form-control form-control-sm' name='qty[{$row['item_id']}]' value='{$_SESSION['cart'][$row['item_id']]['quantity']}' min='0'>
                </td>
                <td>¥" . number_format($row['item_price'], 2) . "</td>
                <td>¥" . number_format($subtotal, 2) . "</td>
            </tr>";
    }
    
    mysqli_close($dbc);

    echo "
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan='4' class='text-end fw-bold'>Total</td>
                        <td>¥" . number_format($total, 2) . "</td>
                    </tr>
                </tfoot>
            </table>
            <div class='d-flex justify-content-between'>
                <button type='submit' class='btn btn-outline-primary'>Update Cart</button>
                <a href='checkout.php?total={$total}' class='btn btn-success'>Checkout</a>
            </div>
        </form>
    </div>";
} else {
    echo "<div class='container mt-5'><p class='alert alert-warning text-center'>Your cart is currently empty.</p></div>";
}

include('includes/footer.html');
?>
