
<?php
	include "header.php";
	//include "slider.php";
    include "database.php";
	include "class/cart_class.php";
?>

<?php
	$cart = new cart;
    $account_phone = $_POST['account_phone'];
    $product_id = $_POST['product_id'];
    $product_size = $_POST['product_size'];
    $insert_cart = $cart -> delete_cart( $account_phone,$product_id,$product_size );
    header("Location: cart.php");
    exit;
?>