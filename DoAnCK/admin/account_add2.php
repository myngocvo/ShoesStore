
<?php
	include "header.php";
	include "slider.php";
	include "class/account_class2.php";
?>

<?php
	$account = new account2;
	if($_SERVER['REQUEST_METHOD']==='POST')
    {
        if(isset($_POST['add']))
        {	$account_phone = $_POST['account_phone'];
            $account_name = $_POST['account_name'];
            $account_pass = $_POST['account_pass'];
            $customer_name = $_POST['customer_name'];
            $customer_date = $_POST['customer_date'];
            $customer_province = $_POST['customer_province'];
            $customer_district = $_POST['customer_district'];
            $customer_ward = $_POST['customer_ward'];
            $customer_address = $_POST['customer_address'];
            $sex = $_POST['sex'];
            $insert_account = $account -> insert_account( $account_phone,$account_name,$account_pass,$customer_name,$customer_province,$customer_district,$customer_ward,$customer_address,$sex,$customer_date );
        }
        if(isset($_POST['edit']))
        {
            $account_phone = $_POST['account_phone'];
            $account_name = $_POST['account_name'];
            $account_pass = $_POST['account_pass'];
            $customer_name = $_POST['customer_name'];
            $customer_date = $_POST['customer_date'];
            $customer_province = $_POST['customer_province'];
            $customer_district = $_POST['customer_district'];
            $customer_ward = $_POST['customer_ward'];
            $customer_address = $_POST['customer_address'];
            $sex = $_POST['sex'];
            $insert_account = $account -> update_account( $account_phone,$account_name,$account_pass,$customer_name,$customer_province,$customer_district,$customer_ward,$customer_address,$sex,$customer_date );
        }
        if(isset($_POST['delete']))
        {
            $account_phone = $_POST['account_phone'];
            $insert_account = $account -> delete_account( $account_phone );
        }

    }
?>

<div class= "admin-content-right">
  <div class= "admin-content-right-cartegory_add">
           <h1>Size sản phẩm</h1>
            <form action ="" method="post">
			<input name = "account_phone" type="text" placeholder="Nhập account_phone sản phẩm">
			<input name = "account_name" type="text" placeholder="Nhập account_name sản phẩm">
			<input name = "account_pass" type="text" placeholder="Nhập account_pass sản phẩm">
			<input name = "customer_name" type="text" placeholder="Nhập customer_name sản phẩm">
			<input name = "customer_date" type="text" placeholder="Nhập customer_date sản phẩm">
			<input name = "customer_province" type="text" placeholder="Nhập customer_province sản phẩm">
			<input name = "customer_district" type="text" placeholder="Nhập customer_district sản phẩm">
			<input name = "customer_ward" type="text" placeholder="Nhập customer_ward sản phẩm">
			<input name = "customer_address" type="text" placeholder="Nhập customer_address sản phẩm">
			<input name = "sex" type="text" placeholder="Nhập sex sản phẩm">
             <button name = "add" type="submit">Thêm</button>
             <button name ="edit" type="submit">Sửa</button>
             <button name ="delete" type="submit">Xóa</button>
            </form>
        </div>
    </div>
</section>
</body>
</html>