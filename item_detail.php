<?php
# Access session.
session_start();

# Redirect if not logged in.
if (!isset($_SESSION['user_id'])) { require('login_tools.php'); load(); }

# Get item ID
$item_id = $_GET['id'];

# Set page title and display header section.
$page_title = 'Item Details';
include('includes/header.html');

# Open database connection.
require('connect_db.php');

# Retrieve item from database
$q = "SELECT * FROM shop WHERE item_id = $item_id";
$r = mysqli_query($dbc, $q);
$item = mysqli_fetch_array($r, MYSQLI_ASSOC);

# Calculate spiciness display
$spiciness_icons = str_repeat('🌶️', $item['spiciness']);

# Display body section, item details.
echo '<div class="container mt-5">';
echo '  <a href="shop.php" class="btn btn-outline-secondary mb-4">&laquo; Back to Shop</a>';
echo '  <div class="row">';
echo '      <div class="col-md-6">';
echo '          <img src="' . $item['restaurant'] . '/' . $item['item_img'] . '" class="img-fluid rounded" alt="' . htmlspecialchars($item['item_name']) . '" style="width:100%; height:400px; object-fit:cover;">';
echo '      </div>';
echo '      <div class="col-md-6">';
echo '          <h2 class="display-4">' . htmlspecialchars($item['item_name']) . '</h2>';
echo '          <p class="lead">' . htmlspecialchars($item['description_zh']) . '</p>';
echo '          <p >Price: ¥' . number_format($item['item_price'], 2) . '</p>';
echo '          <p >Restaurant: ' . htmlspecialchars($item['restaurant']) . '</p>';
echo '          <p>Spiciness: ' . $spiciness_icons . '</p>';
echo '          <a href="added.php?id=' . $item['item_id'] . '" class="btn btn-success btn-lg mt-4">Add to Cart</a>';
echo '      </div>';
echo '  </div>';
echo '</div>';

# Close database connection.
mysqli_close($dbc);

# Display footer section.
include('includes/footer.html');
?>
