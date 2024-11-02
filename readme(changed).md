## Lab 2
### Group: 1
### Members: Naasi, Cathy, Slowly, Kavin
### Content
1. We used a substantial amount of Bootstrap framework for styling, making the web pages clearer and more visually appealing.
2. Our shop page includes various filtering options such as fuzzy search, restaurant or dish classification, spiciness and price range selection, and sorting by price in descending order, meeting most of the requirements for the Just Eat platform.
3. A unique feature of our message posting is the ability to preview Markdown in real-time while editing the text, adding a cool touch to the design.
4. When viewing all messages, we support fuzzy search and time-based sorting.
5. Our newly added `orders_received.php` page displays only the current logged-in user's order information and supports time-based sorting, making it more practical and user-friendly.
6. One of our standout features is the ability to toggle between light mode and dark mode for the interface from the top-right corner.
7. We added a strong password logic to the registration page that provides real-time feedback on whether the password meets the requirements. To prevent SQL injection, we revised the login and registration pages to use prepared statements, ensuring that no variables are directly concatenated into SQL queries.
   For example:
   ```php
   $stmt = $dbc->prepare("INSERT INTO users (first_name, last_name, email, pass, reg_date) VALUES (?, ?, ?, SHA1(?), NOW())");
   $stmt->bind_param('ssss', $fn, $ln, $e, $p);
   $stmt->execute();
   ```

### Details
1. The `connect_db.php` file connects to the database with the user `root` and an empty password. If the root account has a password, you can modify it to `root/"passwd"` for database connection.
2. Some images had incorrect paths, so we replaced them to ensure proper display.
3. Some JS and CSS files use CDN sources, requiring an internet connection for proper rendering.