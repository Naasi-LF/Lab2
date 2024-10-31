<?php # DISPLAY COMPLETE REGISTRATION PAGE.

$page_title = 'Register';
include('includes/header.html');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    require('connect_db.php');
    $errors = array();

    if (empty($_POST['first_name'])) {
        $errors[] = 'Enter your first name.';
    } else {
        $fn = mysqli_real_escape_string($dbc, trim($_POST['first_name']));
    }

    if (empty($_POST['last_name'])) {
        $errors[] = 'Enter your last name.';
    } else {
        $ln = mysqli_real_escape_string($dbc, trim($_POST['last_name']));
    }

    if (empty($_POST['email'])) {
        $errors[] = 'Enter your email address.';
    } else {
        $e = mysqli_real_escape_string($dbc, trim($_POST['email']));
    }

    if (!empty($_POST['pass1'])) {
        if ($_POST['pass1'] != $_POST['pass2']) {
            $errors[] = 'Passwords do not match.';
        } else {
            $p = mysqli_real_escape_string($dbc, trim($_POST['pass1']));
        }
    } else {
        $errors[] = 'Enter your password.';
    }

    if (empty($errors)) {
        $q = "SELECT user_id FROM users WHERE email='$e'";
        $r = @mysqli_query($dbc, $q);
        if (mysqli_num_rows($r) != 0) $errors[] = 'Email address already registered. <a href="login.php">Login</a>';
    }

    if (empty($errors)) {
        $q = "INSERT INTO users (first_name, last_name, email, pass, reg_date) VALUES ('$fn', '$ln', '$e', SHA1('$p'), NOW() )";
        $r = @mysqli_query($dbc, $q);
        if ($r) {
            echo '<h1 class="text-success text-center my-4">Registered!</h1><p class="text-center">You are now registered.</p><p class="text-center"><a href="login.php">Login</a></p>';
            mysqli_close($dbc);
            include('includes/footer.html');
            exit();
        }
    } else {
        echo '<h1 class="text-danger text-center my-4">Error!</h1><p class="text-center" id="err_msg">The following error(s) occurred:<br>';
        foreach ($errors as $msg) {
            echo " - $msg<br>";
        }
        echo '</p><p class="text-center">Please try again.</p>';
        mysqli_close($dbc);
    }
}
?>

<div class="container mt-5">
    
    <h1 class="text-center display-3 text-uppercase fw-light border-bottom pb-3 mb-4">Register</h1>
    <form action="register.php" method="post" class="mx-auto" style="max-width: 500px;">
        <div class="row mb-4">
            <div class="col">
                <label for="first_name" class="form-label fs-5">First Name:</label>
                <input type="text" name="first_name" id="first_name" class="form-control form-control-lg" value="<?php if (isset($_POST['first_name'])) echo $_POST['first_name']; ?>" required>
            </div>
            <div class="col">
                <label for="last_name" class="form-label fs-5">Last Name:</label>
                <input type="text" name="last_name" id="last_name" class="form-control form-control-lg" value="<?php if (isset($_POST['last_name'])) echo $_POST['last_name']; ?>" required>
            </div>
        </div>
        <div class="mb-4">
            <label for="email" class="form-label fs-5">Email Address:</label>
            <input type="email" name="email" id="email" class="form-control form-control-lg" value="<?php if (isset($_POST['email'])) echo $_POST['email']; ?>" required>
        </div>
        <div class="mb-4 position-relative">
            <label for="pass1" class="form-label fs-5">Password:</label>
            <input type="password" name="pass1" id="pass1" class="form-control form-control-lg" required>
        </div>
        <div class="mb-4 position-relative">
            <label for="pass2" class="form-label fs-5">Confirm Password:</label>
            <input type="password" name="pass2" id="pass2" class="form-control form-control-lg" required>
        </div>
        <button type="submit" class="btn btn-success w-100 btn-lg">Register</button>
        <p class="text-center mt-4 fs-5 ">
          Already have an account?
          <a href="login.php" class="text-decoration-none text-primary fw-bold">
              login here
          </a>
        </p>
        
        </form>
</div>


<?php 
include('includes/footer.html');
?>