<?php
   //include "database.php";
?>

<?php
    class bill
    {
        private $db;

        public function __construct()
        {
            $this -> db = new Database();
        }

        public function insert_bill($account_phone, $bill_money)
        {
            $query = "INSERT INTO tbl_bill (account_phone,bill_money) 
            VALUES ('$account_phone',$bill_money)";
            $result = $this ->db->insert($query);
            return $result;
        }
        public function complete_bill($bill_code)
        {
            $query = "UPDATE tbl_bill SET bill_flag = 1 WHERE bill_code = $bill_code";
		    $result = $this -> db -> update($query);
		    //header('Location:cartlist.php');
		    return $result;
        }
        
        public function show_bill()
        {
            $query = "SELECT * FROM tbl_bill ORDER BY account_phone DESC";
            $result = $this -> db -> select($query);
            return $result;
        }

        public function delete_bill($bill_code)
        {
            $query = "DELETE FROM tbl_bill WHERE bill_code = '$bill_code'";
            $result = $this -> db -> delete($query);
            header('Location:bill_list.php');
            return $result;
        }
    }
?>