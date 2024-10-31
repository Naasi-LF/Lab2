<?php # DISPLAY COMPLETE LOGIN PAGE.

$page_title = 'Login';
include('./includes/header.html');

# Display any error messages if present.
if (isset($errors) && !empty($errors)) {
    echo '<p id="err_msg">Oops! There was a problem:<br>';
    foreach ($errors as $msg) {
        echo " - $msg<br>";
    }
    echo 'Please try again or <a href="register.php">Register</a></p>';
}
?>

<!-- Display body section with Bootstrap styling -->
<div class="container mt-5">
    <h1 class="text-center display-4 text-uppercase fw-light border-bottom pb-3 mb-4 ">Login</h1>

    <form action="login_action.php" method="post" class="mx-auto" style="max-width: 400px;">
        <div class="mb-4">
            <label for="email" class="form-label fs-5">Email Address:</label>
            <input type="text" name="email" id="email" class="form-control form-control-lg" required>
        </div>
        <div class="mb-4">
            <label for="pass" class="form-label fs-5">Password:</label>
            <div class="input-group">
                <input type="password" name="pass" id="pass" class="form-control form-control-lg" required>
                <button class="btn btn-outline-secondary" type="button" onclick="togglePasswordVisibility()" style="border-top-right-radius: 0; border-bottom-right-radius: 0;">
                    <i class="bi bi-eye-slash" id="toggleIcon"></i>
                </button>
            </div>
        </div>
        <button type="submit" class="btn btn-primary w-100 btn-lg">Login</button>
        <p class="text-center mt-4 fs-5">
        Don’t have an account? 
        <a href="register.php" class="text-decoration-none text-primary fw-bold">
            Register here
        </a>
        </p>

    </form>
</div>

<script>
    function togglePasswordVisibility() {
        const passField = document.getElementById("pass");
        const toggleIcon = document.getElementById("toggleIcon");
        if (passField.type === "password") {
            passField.type = "text";
            toggleIcon.classList.replace("bi-eye-slash", "bi-eye");
        } else {
            passField.type = "password";
            toggleIcon.classList.replace("bi-eye", "bi-eye-slash");
        }
    }
</script>

<?php 
include('includes/footer.html');
?>
