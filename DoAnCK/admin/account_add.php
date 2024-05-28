
<?php
   // include "header.php";
    //include "slider.php";
    include "class/account_class.php";
?>

<?php
session_start();
if(!array_key_exists('customer_own',$_SESSION))
{
    $_SESSION['customer_own'] = null;
}
if(!array_key_exists('phone',$_SESSION))
{
    $_SESSION['phone'] = null;
}
$DNGH = null;

if ($_SERVER['REQUEST_METHOD']==='GET')
{
    if(array_key_exists('GH',$_GET))
        $_SESSION['DNGH'] = 1;
    if(array_key_exists('DX',$_GET))
    {
        $_SESSION['vr'] = null;
        $_SESSION['phone'] = null;
        $_SESSION['id'] = null;
    }
}
if(array_key_exists('DNGH',$_SESSION))
{
    $DNGH = $_SESSION['DNGH'];
}

if ($_SERVER['REQUEST_METHOD']==='POST')
{
    
    $idd = "0";
    if(isset($_POST['13']))
    {
        $idd = "13";
    }
    if(isset($_POST['14']))
    {
        $idd = "14";
    }
    if(isset($_POST['15']))
    {
        $idd = "15";
    }
    if(isset($_POST['16']))
    {
        $idd = "16";
    }
    if(isset($_POST['17']))
    {
        $idd = "17";
    }
    if(isset($_POST['18']))
    {
        $idd = "18";
    }
    if(isset($_POST['19']))
    {
        $idd = "19";
    }
    if(isset($_POST['20']))
    {
        $idd = "20";
    }
    if(isset($_POST['21']))
    {
        $idd = "21";
    }
    if(isset($_POST['23']))
    {
        $idd = "23";
    }
    if(isset($_POST['24']))
    {
        $idd = "24";
    }
    if(isset($_POST['25']))
    {
        $idd = "25";
    }
    if(isset($_POST['27']))
    {
        $idd = "27";
    }
    if(array_key_exists('26',$_POST))
    {
        $keyy = $_POST['26'];
        $sql = "SELECT * FROM tbl_product WHERE product_name LIKE '%$keyy%'";
    }

   
    if($idd != "0")
    {
        $_SESSION['id'] = $idd;
        $file_php = 'cartegory.php';
        header("Location: $file_php");
        exit;
    }
}
?>

<head>
    <link rel="Website Icon" type="png" href="image/logoweb.png">
    <script src="https://kit.fontawesome.com/1147679ae7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="style copy.css">
    <title>CayKheShoes</title>
    
</head>
<body>
<header>
    <div class="logo">
        <img src="image/logo.png" alt="">
    </div>

    <form action ="" method = "post">
        <div class="menu_responsive"><i class="fas fa-bars"></i></div>
        <div class="menu" >
            <li><a href="index1.php" >TRANG CHỦ</a></li>
            <li><button name = "24" type = "submit">NỮ</button>
              <ul class="sub-menu"> 
                    <button name = "13" type = "submit">GIÀY THỂ THAO</button>
                    <button name = "14" type = "submit">GIÀY CAO GÓT</button>
                    <button name = "15" type = "submit">GIÀY SANDAL</button>
                    <button name = "16" type = "submit">GIÀY BÚP BÊ</button>
                    <button name = "17" type = "submit">DÉP NỮ</button> 
                </ul>      
            </li>

            <li><button name = "25" type = "submit">NAM</button>
                <ul class="sub-menu"> 
                    <button name = "18" type = "submit">GIÀY THỂ THAO</button>
                    <button name = "19" type = "submit">GIÀY TÂY</button>
                    <button name = "20" type = "submit">GIÀY SANDAL</button>
                    <button name = "21" type = "submit">DÉP NAM</button>  
                </ul> 
            </li>
            <li><button name = "23" type = "submit">SALE</button></li> 
            <li><button name = "27" type = "submit">HÀNG BÁN CHẠY</button></li> 
            <li><button><a href = "member.php">THÔNG TIN</a></button></li>
        </div>
    </form>

    <div class="others">
    <li><input id = "26" placeholder="Tìm kiếm" type="text"> <i onclick = "TimKiem1()" class="fas fa-search" ></i></li>
        <li><a class="fa fa-user" <?php if($_SESSION['phone'] != null ) 
                echo "href=\"profile.php\"";
              else
                echo "href=\"account_add.php\"";
         ?>></a></li>
        <li><a class="fa fa-shopping-cart" <?php if($_SESSION['phone'] != null ) echo "href=\"cart.php\"" ?>></a></li>
        <li><a class="fa-solid fa-screwdriver-wrench" style="color: #202124;" <?php if($_SESSION['customer_own'] == 1 ) echo "href = \"cartegoryadd.php\"";?>></a></li>
    </div>
</header>

<!-- -----account----->
<form class="account" >
    <div class="container">
        <div class="account-contcent row">
            <div class="account-content-left">
                <div class="account-content-left-content">
                    <div class="account-content-left-top">
                        <h1>ĐĂNG NHẬP</h1>
                        <div>
                            <div class="account-content-left-input-top-item">
                                <label for="">Tên đăng nhập<span style="color:red">*</span></label>
                                <input type="text" id = "taikhoan">
                            </div>
                            <div class="account-content-left-input-top-item">
                                <label for="">Mật khẩu<span style="color:red">*</span></label>
                                <input type="password" id = "matkhau">
                            </div>
                        </div>
                        <div class="account-content-left-input-top-button">
                            <button onclick="DangNhap()">ĐĂNG NHẬP</button>
                        </div>
                    </div>
                    <div class="account-content-left-bottom">
                        <p>Hoặc</p>
                        <div class="account-content-left-bottom-button">
                            <button><img src="image/Facebook_Logo.png" alt="" style="width: 20px;"> Facebook</button>
                            <button><img src="image/Google_Logo.png" alt="" style="width: 20px;"> Google</button>
                        </div>
                        
                    </div>
                </div>
            </div>
            <div class="account-content-right" >
                <div class="account-content-right-content">
                    <h1>ĐĂNG KÝ</h1>
                    <div class="account-content-right-input">
                        <div class="account-content-right-input-item">
                            <label for="">Tên đăng nhập<span style="color:red">*</span></label>
                            <input id = "account_name" type="text">
                        </div>
                        <div class="account-content-right-input-item">
                            <label for="">Số điện thoại<span style="color:red">*</span></label>
                            <input id = "account_phone" type="text">
                        </div>
                        <div class="account-content-right-input-item">
                            <label for="">Mật khẩu<span style="color:red">*</span></label>
                            <input id = "account_pass" type="password">
                        </div>
                        <div class="account-content-right-input-item">
                            <label for="">Nhắc lại mật khẩu<span style="color:red">*</span></label>
                            <input id = "account_repass" type="password">
                        </div>
                    </div>
                    
                    <div class="account-content-right-button">
                        <button onclick = "DangKy()" >ĐĂNG KÝ</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-chats">
        <div class="chat-box" >
            <div class="client">
                <img src="image/logoweb.png" alt="" >
                <div class="client-info">
                    <h2>CayKheShoes</h2>
                    <p>online</p>
                </div>
            </div>
            <div class="chats">
                <div class="my-chat">Hi!</div>
                <div class="client-chat">Chào bạn</div>
                <div class="client-chat">Tôi có thể giúp gì cho bạn?</div>
                <div class="my-chat">Tôi muốn biết về các loại mã giảm giá</div>
                <div class="my-chat">Tôi muốn biết về các loại mã giảm giá</div>
                <div class="my-chat">Tôi muốn biết về các loại mã giảm giá</div>
                <div class="my-chat">Tôi muốn biết về các loại mã giảm giá</div>
                <div class="my-chat">Tôi muốn biết về các loại mã giảm giá</div>
                <div class="my-chat">Tôi muốn biết về các loại mã giảm giá</div>
                <div class="my-chat">Hi!</div>
                <div class="client-chat">Chào bạn</div>
                <div class="client-chat">Tôi có thể giúp gì cho bạn?</div>
                <div class="my-chat">Tôi muốn biết về các loại mã giảm giá</div>
                <div class="my-chat">Tôi muốn biết về các loại mã giảm giá</div>
                <div class="my-chat">Tôi muốn biết về các loại mã giảm giá</div>
                <div class="my-chat">Tôi muốn biết về các loại mã giảm giá</div>
                <div class="my-chat">Tôi muốn biết về các loại mã giảm giá</div>
                <div class="my-chat">Tôi muốn biết về các loại mã giảm giá</div>
            </div>

            <div class="chat-input" >
                <input type="text" name="" id="" placeholder="Soạn tin nhắn">
                <button class="send-btn"><i class="fa-solid fa-paper-plane"></i></button>
            </div>
        </div>
        <div class="chat-btn" >
            <img src="image/chat.png" alt="">
        </div>
    </div>
</form>


<!-- ````````footer`````` -->
<section class="mail-container">
    <img src="image/logo.png" alt="" ><br>
    <p>Nhận bản tin từ CAYKHE Shoes Store</p>
    <input type="text" placeholder="Nhập mail của bạn..." >
</section>

<div class="footer-top">
  <li>Liên hệ</li>
  <li>Tuyển dụng</li>
  <li>Giới thiệu</li>
  <li>
    <a href="" class="fab fa-facebook"></a>
    <a href="" class="fab fa-twitter"></a>
    <a href="" class="fab fa-youtube"></a>
  </li>
</div>
<script src="script.js"></script>
</body>

</html>