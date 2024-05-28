

<?php
	include "header.php";
	include "slider.php";
	include "class/cart_class.php";
?>

<?php
	$cart = new cart;
	if($_SERVER['REQUEST_METHOD']==='POST')
    {
        if(isset($_POST['add']))
        {	$account_phone = $_POST['account_phone'];
            $product_id = $_POST['product_id'];
            $product_size = $_POST['product_size'];
            $cart_number = $_POST['cart_number'];
            $insert_cart = $cart -> insert_cart( $account_phone,$product_id,$product_size,$cart_number );
        }
        if(isset($_POST['edit']))
        {
            $account_phone = $_POST['account_phone'];
            $product_id = $_POST['product_id'];
            $product_size = $_POST['product_size'];
            $cart_number = $_POST['cart_number'];
            $insert_cart = $cart -> update_cart( $account_phone,$product_id,$product_size,$cart_number,$cart_tick);
        }
        if(isset($_POST['delete']))
        {
            $account_phone = $_POST['account_phone'];
            $product_id = $_POST['product_id'];
            $product_size = $_POST['product_size'];
            $insert_cart = $cart -> delete_cart( $account_phone,$product_id,$product_size );
        }
    }
?>

<div class= "admin-content-right">
  <div class= "admin-content-right-cartegory_add">
           <h1>Size sản phẩm</h1>
            <form action ="" method="post">
			<input name = "account_phone" type="text" placeholder="Nhập account_phone sản phẩm">
			<input name = "product_id" type="text" placeholder="Nhập product_id sản phẩm">
			<input name = "product_size" type="text" placeholder="Nhập product_size sản phẩm">
			<input name = "cart_number" type="text" placeholder="Nhập cart_number sản phẩm">
             <button name = "add" type="submit">Thêm</button>
             <button name ="edit" type="submit">Sửa</button>
             <button name ="delete" type="submit">Xóa</button>
            </form>
        </div>
    </div>
</section>
</body>
</html>