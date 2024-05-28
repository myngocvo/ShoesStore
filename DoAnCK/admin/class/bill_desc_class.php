<?php
   // include "database.php";
?>

<?php
    class bill_desc
    {
        private $db;

        public function __construct()
        {
            $this -> db = new Database();
        }

        public function insert_bill_desc($bill_code, $product_id, $bill_desc_number, $bill_desc_money, $bill_desc_sale,$bill_desc_size)
        {
            $query = "INSERT INTO tbl_bill_desc (bill_code,product_id,bill_desc_number,bill_desc_money,bill_desc_sale,bill_desc_size) 
            VALUES ('$bill_code','$product_id','$bill_desc_number','$bill_desc_money','$bill_desc_sale',$bill_desc_size)";
            $result = $this ->db->insert($query);
            return $result;
        }
        public function delete_bill($bill_code)
        {
            $query = "DELETE FROM tbl_bill_desc WHERE bill_code = $bill_code";
            $result = $this -> db -> delete($query);
            //header('Location:bill_list.php');
            return $result;
        }
        
    }
?>