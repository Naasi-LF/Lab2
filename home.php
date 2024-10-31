<?php 
# DISPLAY COMPLETE LOGGED IN PAGE.

# Access session.
session_start(); 

# Redirect if not logged in.
if (!isset($_SESSION['user_id'])) { 
    require('login_tools.php'); 
    load(); 
}

# Set page title and display header section.
$page_title = 'Home';
include('includes/header.html');
?>

<div class="container mt-5 position-relative">
    <!-- Display user's name with an icon, pinned to the top-left corner -->
    <div class="position-absolute top-0 start-0 d-flex align-items-center ms-3 mt-3">
        <i class="bi bi-person-circle text-primary display-6 me-2"></i>
        <h4 class="mb-0 text-primary">
            <?php echo "{$_SESSION['last_name']} {$_SESSION['first_name']}"; ?>
        </h4>
    </div>

    <!-- Modern grid-style navigation layout -->
    <div class="row text-center mt-5 pt-4">
        <div class="col-md-3 mb-4">
            <a href="forum.php" class="card shadow-sm text-decoration-none" style="border-radius: 15px;">
                <div class="card-body">
                    <i class="bi bi-chat-square-text-fill display-4 text-primary"></i>
                    <h5 class="mt-3 text-dark">Forum</h5>
                    <p class="text-muted">Join discussions with others</p>
                </div>
            </a>
        </div>
        <div class="col-md-3 mb-4">
            <a href="shop.php" class="card shadow-sm text-decoration-none" style="border-radius: 15px;">
                <div class="card-body">
                    <i class="bi bi-cart-fill display-4 text-primary"></i>
                    <h5 class="mt-3 text-dark">Shop</h5>
                    <p class="text-muted">Explore and order from our menu</p>
                </div>
            </a>
        </div>
        <div class="col-md-3 mb-4">
            <a href="orders_received.php" class="card shadow-sm text-decoration-none" style="border-radius: 15px;">
                <div class="card-body">
                    <i class="bi bi-receipt-cutoff display-4 text-primary"></i>
                    <h5 class="mt-3 text-dark">My Orders</h5>
                    <p class="text-muted">View your order history</p>
                </div>
            </a>
        </div>
        <div class="col-md-3 mb-4">
            <a href="goodbye.php" class="card shadow-sm text-decoration-none" style="border-radius: 15px;">
                <div class="card-body">
                    <i class="bi bi-box-arrow-right display-4 text-danger"></i>
                    <h5 class="mt-3 text-dark">Logout</h5>
                    <p class="text-muted">Sign out of your account safely</p>
                </div>
            </a>
        </div>
    </div>
</div>

<?php 
# Display footer section.
include('includes/footer.html'); 
?>
