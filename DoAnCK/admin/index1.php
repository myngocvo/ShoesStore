<?php
session_start();
    if(!array_key_exists('customer_own',$_SESSION))
    {
        $_SESSION['customer_own'] = null;
    }
if(!array_key_exists('phone',$_SESSION))
{
    $_SESSION['vr'] = null;
    $_SESSION['phone'] = null;
    $_SESSION['id'] = null;
}
$tam = null;
if(array_key_exists('phone', $_SESSION))
{
    $tam = $_SESSION['phone'];
}
$_SESSION['phone'] = $tam;
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
<?php
$phone = $_SESSION ['phone'];
if($_SERVER['REQUEST_METHOD']==='POST')
{
    $conn = mysqli_connect('localhost', 'root', '', 'website_ivydemo');
    if(! $conn)
    {
        echo 'Connection error: ' . mysqli_connect_error();
    }
    
    $sql = "SELECT * FROM tbl_product WHERE brand_id = 13";
    $result = mysqli_query($conn, $sql);

    $index = mysqli_fetch_all($result, MYSQLI_ASSOC);
    mysqli_free_result($result);
    mysqli_close($conn);
    //print_r($index);
    
    //foreach($index as $roww)
    //{
     //   print_r ($roww['product_img']);
   //     echo "<br>";
   // }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="Website Icon" type="png" href="image/logoweb.png">
    <script src="https://kit.fontawesome.com/1147679ae7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="style copy.css">
    <title>Trang chủ | CayKheShoes</title>
    
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
        <li><a class="fa fa-user" 
        <?php if($_SESSION['phone'] != null ) 
                echo "href=\"profile.php\"";
              else
                echo "href=\"account_add.php\"";
         ?>></a></li>
        <li><a class="fa fa-shopping-cart" <?php if($_SESSION['phone'] != null ) echo "href=\"cart.php\"" ?>></a></li>
        <li><a class="fa-solid fa-screwdriver-wrench" style="color: #202124;" <?php if($_SESSION['customer_own'] == 1 ) echo "href = \"cartegoryadd.php\"";?>></a></li>
    </div>
</header>

<section id="Slider">
    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide"><img src="image/slide1.png" alt=""></div>
          <div class="swiper-slide"><img src="image/slide2.png" alt=""></div>
          <div class="swiper-slide"><img src="image/slide3.png" alt=""></div>
          <div class="swiper-slide"><img src="image/slide4.png" alt=""></div>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>
    
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
            </div>

            <div class="chat-input" >
                <input type="text" name="" id="" placeholder="Soạn tin nhắn">
                <button class="send-btn"><i class="fa-solid fa-paper-plane"></i></button>
            </div>
        </div>
        <div class="chat-btn" >
            <img src="image/chat.png" alt="">
        </div>

</section>



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

</body>
<script>
// const header =document.querySelector("header")
// window.addEventListener("scroll",function(){
//   x= window.pageYOffset
//   if(x>0){
//     header.classList.add("sticky")
//   }else{
//     header.classList.remove("sticky")
//   }
// })
    var swiper = new Swiper(".mySwiper", {
      spaceBetween: 30,
      centeredSlides: true,
      autoplay: {
        delay: 2500,
        disableOnInteraction: false,
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
</script>
</html>