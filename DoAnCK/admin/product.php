
<?php
    session_start();
    
    $variable = null;
    if ($_SERVER['REQUEST_METHOD']==='GET')
    {
        if (array_key_exists('variable', $_GET))
        {
            $variable = $_GET['variable'];
            $_SESSION['vr'] = $_GET['variable'];
        }
        else
        {
            $variable = $_SESSION['vr'];
        }
    }
    else
    {
        $variable = $_SESSION['vr'];
    }
        $conn = mysqli_connect('localhost', 'root', '', 'website_ivydemo');
            if(! $conn)
            {
                echo 'Connection error: ' . mysqli_connect_error();
            }
            
            $sql = "SELECT * FROM tbl_product WHERE product_id = $variable";
            $sqll = "SELECT * FROM tbl_product_img_desc WHERE product_id = $variable";
            $sqk = "SELECT * FROM tbl_product_size WHERE product_id = $variable ORDER BY product_size ASC" ;
            $result = mysqli_query($conn, $sql);
            $rs = mysqli_query($conn, $sqll);
            $index = mysqli_fetch_all($result, MYSQLI_ASSOC);
            $ind = mysqli_fetch_all($rs, MYSQLI_ASSOC);
            mysqli_free_result($result);
            mysqli_free_result($rs);
            $brid = $index[0]['brand_id'];
            $sq = "SELECT * FROM tbl_product WHERE brand_id = $brid AND product_id != $variable";
            $rsk = mysqli_query($conn, $sq);
            $indx = mysqli_fetch_all($rsk, MYSQLI_ASSOC);
            $rss = mysqli_query($conn, $sqk);
            $insize = mysqli_fetch_all($rss,MYSQLI_ASSOC);
            mysqli_free_result($rss);
            mysqli_free_result($rsk);
            mysqli_close($conn);

?>
<?php
include "class/cart_class.php";

$Size = 0;

$account_phone = $_SESSION['phone'];

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
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="Website Icon" type="png" href="image/logoweb.png">
    <script src="https://kit.fontawesome.com/1147679ae7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="style copy.css">
    <title>Sản phẩm | CayKheShoes</title>
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
        <li><a class="fa-solid fa-screwdriver-wrench" style="color: #202124;" <?php if($_SESSION['customer_own'] == 1 ) echo "href = cartegoryadd.php";?>></a></li>
    </div>
</header>
<!-- ------------product ----------->
<section class="product">
    <div class="container">
        <div class="product-top row">
            <p>Trang chủ</p><span>&#10230; </span> <p>Nữ</p> <span>&#10230;</span><p>Giày thể thao </p><span>&#10230;</span><p>Giày Nike Air Max SYSTM Nữ - Trắng Xanh</p>
        </div>
        <div class="product-content row">
            <div class="product-content-left row">
                <?php ?>
                    <div class="product-content-left-big-img">
                        <img src= "uploads/<?php echo ( $index[0]['product_img']) ?>" alt="">
                    </div>
                <?php ?>

                <div class="product-content-left-small-img">
                    <img src="uploads/<?php echo ( $ind[0]['product_img_desc']) ?>" alt="">
                    <img src="uploads/<?php echo ( $ind[1]['product_img_desc']) ?>" alt="">
                    <img src="uploads/<?php echo ( $ind[2]['product_img_desc']) ?>" alt="">
                    <img src="uploads/<?php echo ( $ind[3]['product_img_desc']) ?>" alt="">
                </div>
            </div>
            <div class="product-content-right">
                <div class="product-content-right-name">
                    <h1><?php echo $index[0]['product_name'];?></h1>
                </div>
                
                <div class="product-content-right-price">
                    <p><?php 
                    $s = $index[0]['product_price']* ( 100 - $index[0]['product_price_new'])/100;
                    $ss = $index[0]['product_price_new'];
                    //echo "$ss ";
                    $num = array();
                    $i = 0;
                    while ($s > 0)
                    {
                        $num[$i] = $s%10;
                        
                        $s = intval($s/10);
                    
                        $i++;
                    }
                    
                    while($i > 0 )
                    {
                        $i--;
                        echo $num[$i];
                        if($i !=0 and $i%3 == 0)
                            echo ".";
                    }
                    ?><sup>đ</sup>
                
                </p><p> 
                <?php
                $ss = $index[0]['product_price_new'];
                    if($ss > 0)
                    {
                        $s = $index[0]['product_price'];
                                    
                        $num = array();
                        $i = 0;
                        while ($s > 0)
                        {
                            $num[$i] = $s%10;
                                        
                            $s = intval($s/10);
                                    
                            $i++;
                        }
                                    
                        while($i > 0 )
                        {
                            $i--;
                            echo $num[$i];
                            if($i !=0 and $i%3 == 0)
                            echo ".";
                        }
                    }
                                
                ?>
                <sup>
                <?php
                if($ss > 0)
                {
                    echo "đ";
                }
                ?>
                </sup>
                </p> 
                
                </div>

                <div class="product-content-right-color">
                    <p><span style="font-weight: bold;">Màu sắc</span>: Trắng Xanh <span style="color: red"></span></p>
                </div>

                <div class="product-content-right-size">
                    <p style="font-weight: bold;">Size</p>
                    <div class="size">
                        <?php foreach($insize as $Size) { ?>
                            <?php if($Size['product_size_number'] > 0) { ?>
                            <span id = "z<?php echo $Size['product_size']?>"  onclick="Size(this.id)"><?php echo $Size['product_size']?></span >
                            <?php } ?>
                        <?php } ?>
                    </div>
                </div>

                <div class="quantity">
                    <p style="font-weight: bold;">Số lượng</p>
                    <input type="number" min="0" value="1" onclick="Soluong(this.value)" id = "soluong">
                    <p style="color: red;" id = "vui" >Vui lòng chọn size*</p>
                </div>
                <div class="product-content-right-button">
                    <button id = "them"  onclick="Giohang()"><i class="fas fa-shopping-cart"></i><p>THÊM VÀO GIỎ HÀNG</p></button>
                    <button id = "mua" onclick="MuaNgay()"><p>MUA NGAY</p></button>
                    <input type = "hidden" id = "idd" value = "<?php echo $variable;?>"/>
                    <input type = "hidden" id = "phone" value = "<?php echo $account_phone;?>"/>
                </div>

                <div class="product-content-right-icon">
                    <div class="product-content-right-icon-item">
                        <i class="fas fa-phone-alt"></i><p>Hotline</p>
                    </div>
                    <div class="product-content-right-icon-item">
                        <i class="far fa-comments"></i><p>Chat</p>
                    </div>
                    <div class="product-content-right-icon-item">
                        <i class="far fa-envelope"></i><p>Mail</p>
                    </div>
                </div>

                <div class="product-content-right-bottom">
                    <div class="product-content-right-bottom-top">
                        &#8744;
                    </div>
                    <div class="product-content-right-bottom-content-big">
                        <div class="product-content-right-bottom-content-title row">
                            <div class="product-content-right-bottom-content-title-item chitiet">
                                <p>Chi tiết</p>
                            </div>
                            <div class="product-content-right-bottom-content-title-item baoquan">
                                <p>Bảo quản</p>
                            </div>
                            <div class="product-content-right-bottom-content-title-item thamkhaosize">
                                <p>Tham khảo size</p>
                            </div>
                        </div>
                        <div class="product-content-right-bottom-content">
                            <div class="product-content-right-bottom-content-chitiet">
                                <?php echo $index[0]['product_desc'];?>
                            </div>
                            <div class="product-content-right-bottom-content-baoquan">
                                    - Sử dụng hộp đựng giày: sẽ tránh bám bụi bẩn và khiến khu vực để giày dép của bạn ngăn nắp và dễ quan sát hơn.<br><br>
                                    - Đặt giày ở nơi khô ráo, thoáng mát: sẽ giúp bảo vệ giày khỏi bị ẩm mốc.
                                    Tuy nhiên bạn cũng cần chú ý, nơi khô thoáng để đặt giày thể thao nữ, nam cần tránh sự tiếp xúc trực tiếp của ánh sáng mặt trời. <br><br>
                                    - Bảo quản form giày bằng giấy báo: Sử dụng giấy báo nhét vào trong giày là một cách bảo quản tiết kiệm chi phí và hiệu quả thay cho các dụng cụ giữ form giày khác.  <br><br>
                                    - Chống thấm nước bằng bình xịt Nano: Sau khi xịt sản phẩm lên bề mặt giày, một lớp phủ bảo vệ trong suốt sẽ được tạo ra. Lớp phủ này có tác dụng chống thấm nước và chống bẩn hiệu quả. <br><br> 
                                    - Khử mùi giày bằng baking soda: loại bỏ mùi hôi đồng thời diệt khuẩn vô cùng đơn giản và nhanh chóng.
                                
                            </div>
                            <div class="product-content-right-bottom-content-tkhaosize">
                                <img src="image/thamkhaosize.jpg" alt="###" >
                            </div>
                        </div>

                    </div>
                    
                </div>

            </div>
        </div>
    </div>
</section>

<!-- --product-related-- -->
<section class="product-related container">
    <div class="product-related-title">
        <p>SẢN PHẨM LIÊN QUAN</p>
    </div>
    <div class="row product-content sanphamlienquan">
        <?php foreach ($indx as $roww) {?>
        <div class="product-related-item">
            <img src="uploads/<?php echo ( $roww['product_img']) ?>" alt="" onclick = "Call(<?php echo ( $roww['product_id']) ?>)">
            <h1><?php echo htmlspecialchars( $roww['product_name']) ?> </h1>
            <p><p><?php 
                    $s = $index[0]['product_price']* ( 100 - $index[0]['product_price_new'])/100;
                    $ss = $index[0]['product_price_new'];
                    //echo "$ss ";
                    $num = array();
                    $i = 0;
                    while ($s > 0)
                    {
                        $num[$i] = $s%10;
                        
                        $s = intval($s/10);
                    
                        $i++;
                    }
                    
                    while($i > 0 )
                    {
                        $i--;
                        echo $num[$i];
                        if($i !=0 and $i%3 == 0)
                            echo ".";
                    }
                    ?><sup>đ</sup>
                
                </p><br><p> 
                <?php
                $ss = $index[0]['product_price_new'];
                    if($ss > 0)
                    {
                        $s = $index[0]['product_price'];
                                    
                        $num = array();
                        $i = 0;
                        while ($s > 0)
                        {
                            $num[$i] = $s%10;
                                        
                            $s = intval($s/10);
                                    
                            $i++;
                        }
                                    
                        while($i > 0 )
                        {
                            $i--;
                            echo $num[$i];
                            if($i !=0 and $i%3 == 0)
                            echo ".";
                        }
                    }
                                
                ?>
                <sup>
                    <?php
                    if($ss > 0)
                        echo "đ";
                    ?>
                </sup>
                </p>
        </div>
        <?php }?>
    
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
<script src="script.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>

</html>