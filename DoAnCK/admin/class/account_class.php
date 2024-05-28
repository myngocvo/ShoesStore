<?php
    include "database.php";
?>

<?php
    class account
    {
        private $db;

        public function __construct()
        {
            $this -> db = new Database();
        }

        public function insert_account($account_name, $account_phone, $account_pass)
        {
            $query = "INSERT INTO tbl_account (account_name,account_phone,account_pass) VALUES ('$account_name','$account_phone','$account_pass')";
            $result = $this ->db->insert($query);
            return $result;
        }

        
    }
?>