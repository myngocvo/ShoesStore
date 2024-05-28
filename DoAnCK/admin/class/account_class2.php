<?php include "database.php";?>
 <?php class account2
 {
	private $db;
    public function __construct()
    {
        $this -> db = new Database();
    }
    public function insert_account ($account_phone,$account_name,$account_pass,$customer_name,$customer_province,$customer_district,$customer_ward,$customer_address,$sex,$customer_date)
    {
        $query = "INSERT INTO tbl_account (account_phone,account_name,account_pass,customer_name,customer_province,customer_district,customer_ward,customer_address,sex,customer_date) VALUES ('$account_phone','$account_name','$account_pass','$customer_name','$customer_province','$customer_district','$customer_ward','$customer_address',$sex,'$customer_date')";
        $result = $this ->db->insert($query);
        return $result;
    }
    
    public function update_account($account_phone,$account_name,$account_pass,$customer_name,$customer_province,$customer_district,$customer_ward,$customer_address,$sex,$customer_date)
    {
        $query = "UPDATE tbl_account SET account_name = '$account_name', account_pass = '$account_pass', customer_name = '$customer_name', customer_province = '$customer_province', customer_district = '$customer_district' , customer_ward = '$customer_ward' , customer_address = '$customer_address' , sex = $sex  , customer_date = '$customer_date' WHERE account_phone = '$account_phone'";
        $result = $this -> db -> update($query);
       // header('Location:accountlist.php');
        return $result;
    }
    public function update_ava_account($account_phone)
    {
        $product_img = $_FILES['product_img']['name'];
        echo $product_img;
        $filetarget = basename($_FILES['product_img']['name']);
        $filesize = $_FILES['product_img']['size'];

        if(file_exists("uploads/$filetarget"))
        {
            $alert = "File đã tồn tại";
            return $alert;
        }
        if($filesize > 1000000)
        {
            $alert = "File không được lớn hơn 1MB";
            return $alert;
        }
        move_uploaded_file( $_FILES['product_img']['tmp_name'],"uploads/".$filetarget);
        $query = "UPDATE tbl_account SET customer_ava = '$product_img' WHERE account_phone = '$account_phone'";
        $result = $this -> db -> update($query);
       // header('Location:accountlist.php');
        return $result;
    }
    public function update_account2($account_phone,$account_name,$customer_name,$customer_province,$customer_district,$customer_ward,$customer_address,$sex,$customer_date)
    {
        $query = "UPDATE tbl_account SET account_name = '$account_name', customer_name = '$customer_name', customer_province = '$customer_province', customer_district = '$customer_district', customer_ward = '$customer_ward' , customer_address = '$customer_address' , sex = $sex , customer_date = '$customer_date' WHERE account_phone = '$account_phone'";
        $result = $this -> db -> update($query);
       // header('Location:accountlist.php');
        return $result;
    }
    public function update_account3($account_phone,$account_pass)
    {
        $query = "UPDATE tbl_account SET account_pass = $account_pass  WHERE account_phone = '$account_phone'";
        $result = $this -> db -> update($query);
       // header('Location:accountlist.php');
        return $result;
    }

    public function delete_account($account_phone)
    {
        $query = "DELETE FROM tbl_account WHERE account_phone = '$account_phone'";
        $result = $this -> db -> delete($query);
        //header('Location:accountlist.php');
        return $result;
    }
}
?>

