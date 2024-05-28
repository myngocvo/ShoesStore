<?php
	include "header.php";
	include "class/account_class2.php";
?>
<?php
    $account = new account2;
    $account_phone = $_POST['account_phone'];
    $account_pass = $_POST['account_pass'];
    
    $insert_account = $account -> update_account3( $account_phone,$account_pass);
    header("Location: profile.php");
    exit;
?>