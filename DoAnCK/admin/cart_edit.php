
<?php
	include "header.php";
    include "database.php";
	include "class/cart_class.php";
?>
<?php
    $cart = new cart;
    $account_phone = $_POST['account_phone'];
    $product_id = $_POST['product_id'];
    $product_size = $_POST['product_size'];
    $cart_number = $_POST['cart_number'];
    $cart_tick = $_POST['cart_tick'];
    $insert_cart = $cart -> update_cart( $account_phone,$product_id,$product_size,$cart_number,$cart_tick);
    header("Location: cart.php");
    exit;
?>