<?php //include "database.php";?>
 <?php class cart
 {
	private $db;
	public function __construct()
	{
		$this -> db = new Database();
	}
	public function insert_cart ($account_phone,$product_id,$product_size,$cart_number)
	{
		$query = "INSERT INTO tbl_cart (account_phone,product_id,product_size,cart_number) VALUES ($account_phone,$product_id,$product_size,$cart_number)";
		$result = $this ->db->insert($query);
		return $result;
	}
	public function update_cart($account_phone,$product_id,$product_size,$cart_number,$cart_tick)
	{
		$query = "UPDATE tbl_cart SET cart_number = $cart_number , cart_tick = $cart_tick WHERE account_phone = $account_phone and product_id = $product_id and product_size = $product_size";
		$result = $this -> db -> update($query);
		//header('Location:cartlist.php');
		return $result;
	}

	public function delete_cart($account_phone,$product_id,$product_size)
	{
		$query = "DELETE FROM tbl_cart WHERE account_phone = $account_phone and product_id = $product_id and product_size = $product_size";
		$result = $this -> db -> delete($query);
		//header('Location:cartlist.php');
		return $result;
	}
	public function show_cart()
	{
		$query = "SELECT tbl_cart.*, tbl_product.product_id FROM tbl_cart INNER JOIN tbl_product ON tbl_cart.product_id = tbl_cart.product_id";
		$result = $this -> db -> select($query);
		return $result;
	}
}
?>

