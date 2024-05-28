<?php
    include "header.php";
    //include "slider.php";
    include "class/account_class2.php";
?>

<?php
    session_start();
    $account = new account2;
    if($_SERVER['REQUEST_METHOD']==='POST')
    {
        //echo "THHHHHHHHHHHHHHHHHHH";
        $phone = $_SESSION['phone'];
        $insert_account = $account -> update_ava_account($phone,$_FILE);
    }
    //header("Location: profile.php");
   // exit;
?>

