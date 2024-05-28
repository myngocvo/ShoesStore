<?php
	include "header.php";
	include "slider.php";
	include "class/product_size_class.php";
?>

<?php
	$product_size = new product_size;
	if($_SERVER['REQUEST_METHOD']==='POST')
    {
        if(isset($_POST['add']))
        {	$product_id = intval($_POST['product_id']);
            $product_size1 = intval($_POST['product_size']);
            $product_size_number = intval($_POST['product_size_number']);
            $insert_product_size = $product_size -> insert_product_size( $product_id,$product_size1,$product_size_number );
        }
        if(isset($_POST['edit']))
        {
            $product_id = intval($_POST['product_id']);
            $product_size1 = intval($_POST['product_size']);
            $product_size_number = intval($_POST['product_size_number']);
            $insert_product_size = $product_size -> update_product_size( $product_id,$product_size1,$product_size_number );
        }
        if(isset($_POST['delete']))
        {
            $product_id = intval($_POST['product_id']);
            $product_size1 = intval($_POST['product_size']);
            $insert_product_size = $product_size -> delete_product_size( $product_id,$product_size1 );
        }

    }
?>

 <div class="admin-content-right">
 <div class="admin-content-right-cartegory_add">
           <h1>Size sản phẩm</h1>
            <form action="" method="post">
			<input name = "product_id" type="text" placeholder="Nhập product_id sản phẩm">
			<input name = "product_size" type="text" placeholder="Nhập product_size sản phẩm">
			<input name = "product_size_number" type="text" placeholder="Nhập product_size_number sản phẩm">
             <button name = "add" type="submit">Thêm</button>
             <button name ="edit" type="submit">Sửa</button>
             <button name ="delete" type="submit">Xóa</button>
            </form>
        </div>
    </div>
</section>
</body>
</html>


