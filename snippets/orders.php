<?php
require_once '../connect_db.php';
$sql =
    "SELECT order_contents.item_id, order_contents.order_id, order_contents.quantity, order_contents.price, 
            orders.user_id,orders.order_id, orders.total, orders.order_date, 
            users.first_name, users.last_name, 
            shop.item_name, shop.item_img 
FROM
orders,order_contents,users,shop
WHERE 
users.user_id=orders.user_id
AND
orders.order_id=order_contents.order_id
AND
order_contents.content_id=shop.item_id";
echo get_results_string($sql);


