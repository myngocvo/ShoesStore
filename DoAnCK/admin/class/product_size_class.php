<?php
    //include "database.php";
?>

<?php
    class product_size
    {
        private $db;

        public function __construct()
        {
            $this -> db = new Database();
        }

        public function insert_product_size($product_id, $product_size, $product_size_number)
        {
            $query = "INSERT INTO tbl_product_size (product_id,product_size,product_size_number) VALUES ($product_id,$product_size,$product_size_number)";
            $result = $this ->db->insert($query);
            return $result;
        }

        public function show_product_size()
        {
            $query = "SELECT tbl_product_size.*, tbl_product.product_id
            FROM tbl_product_size INNER JOIN tbl_product ON tbl_product_size.product_id = tbl_product.product_id";
            $result = $this -> db -> select($query);
            return $result;
        }
        

        public function show_product_size1()
        {
            $query = "SELECT tbl_product_size.*, tbl_product.product_id 
            FROM tbl_product_size INNER JOIN tbl_product ON tbl_product_size.product_id = tbl_product_size.product_id";
            $result = $this -> db -> select($query);	return $result;
        }

        public function update_product_size($product_id,$product_size,$product_size_number)
        {
            $query = "UPDATE tbl_product_size SET product_size_number = product_size_number + $product_size_number WHERE product_id = $product_id and product_size = $product_size";
            $result = $this -> db -> update($query);
           // header('Location:product_sizelist.php');
            return $result;
        }

        public function delete_product_size($product_id,$product_size)
        {
            $id = intval($product_id);
            $size = intval($product_size);
            $query = "DELETE FROM tbl_product_size WHERE product_id = $id and product_size = $size";
            $result = $this -> db -> delete($query);
            header('Location:product_sizelist.php');
            return $result;
        }
    }
?>

