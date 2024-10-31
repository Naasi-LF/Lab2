<?php 
# DISPLAY COMPLETE LOGGED OUT PAGE.

# Access session.
session_start();

# Redirect if not logged in.
if (!isset($_SESSION['user_id'])) { 
    require('login_tools.php'); 
    load(); 
}

# Set page title and display header section.
$page_title = 'Goodbye';
include('includes/header.html');

# Clear existing variables.
$_SESSION = array();

# Destroy the session.
session_destroy();
?>

<div class="container mt-5 text-center">
    <div class="card mx-auto shadow" style="max-width: 500px;">
        <div class="card-body">
            <h1 class="display-4 text-danger">Goodbye!</h1>
            <p class="lead">You are now logged out.</p>
            <a href="login.php" class="btn btn-primary mt-3">Login Again</a>
        </div>
    </div>
</div>

<?php
# Display footer section.
include('includes/footer.html');
?>
