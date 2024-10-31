<?php 
# DISPLAY POST MESSAGE FORM.

# Access session.
session_start();

# Redirect if not logged in.
if (!isset($_SESSION['user_id'])) { 
    require('login_tools.php'); 
    load(); 
}

# Set page title and display header section.
$page_title = 'Post Message';
include('includes/header.html');
?>

<!-- Navigation bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container">
        <a class="navbar-brand" href="#">Post Message</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="forum.php">Forum</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="shop.php">Shop</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="home.php">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="goodbye.php">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Display form with Markdown preview -->
<div class="container mt-5 mb-5">
    <h1 class="text-center display-4 text-uppercase fw-light border-bottom pb-3 mb-4">Post a Message</h1>
    <form action="post_action.php" method="post" class="mx-auto" style="max-width: 800px;">
        <div class="mb-4">
            <label for="subject" class="form-label fs-5">Subject:</label>
            <input name="subject" type="text" class="form-control form-control-lg" maxlength="100" required>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="message" class="form-label fs-5">Message</label>
                <textarea name="message" id="message" rows="10" class="form-control form-control-lg" placeholder="Enter your message here... (Markdown Supported):" required></textarea>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label fs-5">Live Preview:</label>
                <div id="preview" class="border p-3 bg-light" style="height: 90%; overflow-y: auto; min-height: 250px;"></div>
            </div>
        </div>
        <button name="submit" type="submit" class="btn btn-primary w-100 btn-lg mt-4 mb-4">Submit</button>

    </form>
</div>

<!-- Load marked library and handle markdown preview -->
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script>
    document.getElementById("message").addEventListener("input", function() {
        const messageContent = document.getElementById("message").value;
        document.getElementById("preview").innerHTML = marked.parse(messageContent);
    });
</script>

<?php 
# Display footer section.
include('includes/footer.html');
?>
