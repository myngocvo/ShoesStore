<?php
session_start();
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
    $tong = 0;
    $thue = 0;
    $paynow = "1";
    if ($_SERVER['REQUEST_METHOD']==='GET')
    {

       $_SESSION['account_phone'] = $_GET['account_phone'];
       $_SESSION['customer_name'] = $_GET['customer_name'];
       $_SESSION['customer_province'] = $_GET['customer_province'];
       $_SESSION['customer_district'] = $_GET['customer_district'];
       $_SESSION['customer_address'] = $_GET['customer_address'];
       
        if($_SESSION['phone'] == null)
        {
            //echo $_SESSION['id'];
            $conn = mysqli_connect('localhost', 'root', '', 'website_ivydemo');
            if(! $conn)
            {
                echo 'Connection error: ' . mysqli_connect_error();
            }
            $id = $_SESSION['vr'];
            $sl = $_SESSION['product_number'];
            $sql = "SELECT * FROM tbl_product WHERE product_id = $id";
            $result = mysqli_query($conn, $sql);
            $index = mysqli_fetch_all($result, MYSQLI_ASSOC);
            mysqli_free_result($result);
            mysqli_close($conn);

        }
        else
        {
            if(array_key_exists('MuaNgay',$_GET))
            {
                $conn = mysqli_connect('localhost', 'root', '', 'website_ivydemo');
                if(! $conn)
                {
                    echo 'Connection error: ' . mysqli_connect_error();
                }
                $id = $_SESSION['vr'];
                $sl = $_SESSION['product_number'];
                $sql = "SELECT * FROM tbl_product WHERE product_id = $id";
                $result = mysqli_query($conn, $sql);
                $index = mysqli_fetch_all($result, MYSQLI_ASSOC);
                mysqli_free_result($result);
                mysqli_close($conn);
            }
            else
            {
                $paynow = "0";
                $conn = mysqli_connect('localhost', 'root', '', 'website_ivydemo');
                if(! $conn)
                {
                    echo 'Connection error: ' . mysqli_connect_error();
                }
                $phone = $_SESSION['phone'];
                $sql = "SELECT * FROM tbl_cart INNER JOIN tbl_product ON tbl_cart.product_id = tbl_product.product_id and account_phone = $phone";
                $result = mysqli_query($conn, $sql);
                $index = mysqli_fetch_all($result, MYSQLI_ASSOC);
                mysqli_free_result($result);
                mysqli_close($conn);
            }
        }
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
    <title>Thanh toán | CayKheShoes</title>
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
        <li><a class="fa fa-shopping-cart" <?php if($_SESSION['phone'] != null) echo "href=\"cart.php\"" ?>></a></li>
    </div>
</header>

<!-- -----payment----->
<section class="payment">
    <div class="container">
        <div class="payment-top-swap">
            <div class="payment-top-text row">
                <p>Giỏ hàng</p>
                <p>Địa chỉ giao hàng</p>
                <p>Thanh toán</p>
            </div>
            <div class="payment-top">
                <div class="payment-top-cart payment-top-item">   
                    <i class="fas fa-shopping-cart "></i>
                </div>
                <div class="payment-top-adress payment-top-item">    
                    <i class="fas fa-map-marker-alt"></i>
                </div>
                <div class="payment-top-pay payment-top-item">   
                    <i class="fas fa-money-check-alt"></i>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="payment-content row">
            <div class="payment-content-left">
                <div class="payment-content-left-method-delivery">
                    <p style="font-weight: bold;">Phương thức giao hàng</p>
                </div>
                <div class="payment-content-left-method-delivery-item">
                    <input  name="loaivanchuyen" type="radio"><label>Giao hàng chuyển phát nhanh</label>
                    <input name="loaivanchuyen" type="radio"><label>Giao hàng tiết kiệm</label>   
                </div>
                <div class="payment-content-left-method-payment">
                    <p style="font-weight: bold;">Phương thức thanh toán</p>
                    <p>Mọi giao dịch đều được bảo mật và mã hóa. Thông tin thẻ tín dụng sẽ không bao giờ được lưu lại</p>
                    <div class="payment-content-left-method-payment-item">
                        <input name="method-payment" type="radio">
                        <label for="">Thanh toán bằng thẻ tín dụng</label>
                    </div>
                    <div class="payment-content-left-method-payment-item-img">
                        <img src="image/thethanhtoanvisa.png" alt="" style="width: 70px;">
                    </div>
                    <!-- ------ --><br>
                    <div class="payment-content-left-method-payment-item">
                        <input name="method-payment" type="radio">
                        <label for="">Thanh toán bằng thẻ ATM</label>
                    </div>
                    <div class="payment-content-left-method-payment-item-img">
                        <img src="image/viettin.jpg" alt="" style="width: 70px;">
                        <img src="image/vietcom.jpg" alt="" style="width: 70px;">
                        <img src="image/MB.png" alt="" style="width: 70px;">
                        <img src="image/techcom.png" alt="" style="width: 70px;">
                    <!-- ------ --><br><br>
                    </div>
                    <div class="payment-content-left-method-payment-item">
                        <input name="method-payment" type="radio">
                        <label for="">Thanh toán MOMO</label>
                    </div>
                    <div class="payment-content-left-method-payment-item-img">
                        <img src="image/momo.png" alt="" style="width: 40px;">
                    </div>
                    <!-- ------ --><br>
                    <div class="payment-content-left-method-payment-item">
                        <input name="method-payment" type="radio">
                        <label for="">Thanh toán khi nhận hàng</label>
                    </div>
                </div>
            </div>
            <div class="payment-content-right">
                <div class="payment-content-right-top">
                    <table>
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Giảm giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
    
                        </tr>
                        <?php foreach($index as $roww) { if ($paynow =="1" || $roww['cart_tick'] == 1) { ?>
                        <tr>
                            <td><?php echo $roww['product_name'];?></td>
                            <td>
                                <?php if($roww['product_price_new'] > 0)
                                {
                                    echo "-";
                                    echo $roww['product_price_new'];
                                    echo "%";
                                }
                                else
                                {
                                    echo "0";
                                }
                                    ?>
                            
                            </td>
                            <td><?php 
                            if($_SESSION['phone'] == null) echo $sl; 
                            else
                            {
                                if(array_key_exists('MuaNgay',$_GET))
                                {
                                    echo $sl;
                                }
                                else echo $roww['cart_number'];
                            } ?></td>
                            <td><p>
                            <?php 
                                 $s = $roww['product_price']* ( 100 - $roww['product_price_new'])/100;
                                 if($_SESSION['phone'] == null)
                                    $s *= $sl;
                                 else
                                 {
                                    if(array_key_exists('MuaNgay',$_GET))
                                    {
                                        $s *= $sl;
                                    }
                                    else
                                        $s *= $roww['cart_number'];
                                 }
                                 $ss = $roww['product_price_new'];
                                 $tong += $s;
                                 $thue += $s*($roww['product_tax']/100);
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
                            ?>
                            <sup>đ</sup></p></td>
                        </tr>
                        <?php } }?>
                        
                        <tr>
                            <td style="font-weight: bold;" colspan="3">Tổng</td>
                            <td style="font-weight: bold;"><p>
                            <?php 
                                 
                                 $s = $tong;
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
                            ?>
                            <sup>đ</sup></p></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;" colspan="3">Thuế VAT</td>
                            <td style="font-weight: bold;"><p>
                            <?php 
                                 
                                 $s = $thue;
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
                            ?>
                            <sup>đ</sup></p></td>
                        </tr>
                            <td style="font-weight: bold;" colspan="3">Tổng tiền hàng</td>
                            <td style="font-weight: bold;"><p>
                            <?php 
                                 
                                 $s = $tong + $thue;
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
                            ?>
                            <sup>đ</sup></p></td>
                    </table>
                </div>
                <div class="payment-content-right-payment">
                    <button id = "<?php echo $paynow?>" onclick ="ThanhToan(this.id)">TIẾP TỤC THANH TOÁN</button>
                </div>
                <input type = "hidden" id = "tong" value = "<?php echo $tong + $thue; ?>">
            </div>
            
        </div>
    </div>
    <!-- <div class="main-chats">
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
    </div> -->
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
</body>

</html>