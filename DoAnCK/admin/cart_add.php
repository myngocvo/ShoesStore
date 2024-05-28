

<?php
	include "header.php";
    include "database.php";
	include "class/cart_class.php";
?>

<?php
	$cart = new cart;
	if($_SERVER['REQUEST_METHOD']==='POST')
    {
        	$account_phone = $_POST['account_phone'];
            $product_id = $_POST['product_id'];
            $product_size = $_POST['product_size'];
            $cart_number = $_POST['cart_number'];
            
            $insert_cart = $cart -> insert_cart( $account_phone,$product_id,$product_size,$cart_number );

            header("Location: cart.php");
            exit;
    }
?>

