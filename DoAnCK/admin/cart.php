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
$sl = 0;
$phone = null;
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
    <title>Giỏ hàng | CayKheShoes</title>
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
        <li><a class="fa fa-shopping-cart" href="cart.php"></a></li>
        <li><a class="fa-solid fa-screwdriver-wrench" style="color: #202124;" <?php if($_SESSION['customer_own'] == 1 ) echo "href = cartegoryadd.php";?>></a></li>
    </div>
</header>
<!-- cart -->
<section class="cart">
    <div class="container">
        <div class="cart-top-swap">
            <div class="cart-top-text row">
                <p>Giỏ hàng</p>
                <p>Địa chỉ giao hàng</p>
                <p>Thanh toán</p>
            </div>
            <div class="cart-top">
                <div class="cart-top-cart cart-top-item">   
                    <i class="fas fa-shopping-cart "></i>
                </div>
                <div class="cart-top-adress cart-top-item">    
                    <i class="fas fa-map-marker-alt"></i>
                </div>
                <div class="cart-top-pay cart-top-item">   
                    <i class="fas fa-money-check-alt"></i>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="cart-content row">
            <div class="cart-content-left">
                <table>
                    <tr>
                        <th>Chọn sản phẩm</th>
                        <th>Sản phẩm</th>
                        <th>Tên sản phẩm</th>
                        
                        <th>Size</th>
                        <th>Số lượng</th>
                        <th>Thành tiền</th>
                        <th>Xóa</th>
                    </tr>
                    <?php  foreach($index as $Row) { ?>
                    
                        <tr>
                            <?php  if ($Row['cart_tick'] == 1) {  ?>
                                
                            <td><input type="checkbox" style="width: 100%;" id ="<?php echo ($Row['product_id']); echo " "; echo $Row['product_size']; echo " "; echo $phone; echo " "; echo "tick";?>" onclick= "SuaCart(this.id)" checked></td>
                            <?php } else { ?>
                            <td><input type="checkbox" style="width: 100%;" id = "<?php echo ($Row['product_id']); echo " "; echo $Row['product_size']; echo " "; echo $phone; echo " "; echo "tick";?>" onclick = "SuaCart(this.id)"></td>
                            <?php }?>
                            <td><img src= "uploads/<?php echo ( $Row['product_img']) ?>" alt="" onclick = "Call(<?php echo ( $Row['product_id']) ?>)"></td>
                            <td><p><?php echo ( $Row['product_name']) ?></p></td>
                            
                            <td><p><?php echo ( $Row['product_size']) ?></p></td>
                            <td><input type="number" value="<?php echo ( $Row['cart_number']) ?>" min="1" id = "<?php echo ($Row['product_id']); echo " "; echo $Row['product_size']; echo " "; echo $phone; echo " "; echo "number";?>" onclick="SuaCart(this.id)"></td>
                            <td><p>
                            <?php
                                
                                $gg = $Row['product_price_new'];
                                
                                $s = $Row['product_price']*$Row['cart_number'];
                                $s *= (100-$gg)/100;
                                if($Row['cart_tick'] == 1)
                                {
                                    $tong += $s;
                                    $sl += $Row['cart_number'];
                                }
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
                                //echo htmlspecialchars( $roww['product_price'])
                                ?>
                            <sup>đ</sup></p></td>
                            <td><span id = "<?php echo ($Row['product_id']) ?>" data-value="<?php echo ($Row['product_size']); echo " "; echo $phone; ?>" onclick="Xoacart(this.id)"><i class="far fa-trash-alt"></i></span></td>
                        </tr>
                    <?php  }?> 
                </table>
            </div>

            <div class="cart-content-right">
                <table>
                    <tr>
                        <th colspan="2">TỔNG TIỀN GIỎ HÀNG</th>
                    </tr>
                    <tr>
                        <td>TỔNG SẢN PHẨM: </td>
                        <td>
                            <?php
                            echo $sl;
                            ?>
                        </td>
                    </tr>
                    <tr>
                        <td>TỔNG TIỀN HÀNG: </td>
                        <td><p>
                            <?php
                            if($tong > 0)
                            {
                                $s = $tong;
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
                            else
                            {
                                echo 0;
                            }
                            ?>
                        <sup>đ</sup></p></td>
                    </tr>
                    <tr>
                        <td>TẠM TÍNH: </td>
                        <td><p style="color: black; font-weight: bold;"><?php
                        if ($tong > 0)
                        {
                             $s = $tong;
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
                        else
                        {
                            echo 0;
                        }
                            ?><sup>đ</sup></p></td>
                    </tr>

                </table>
                <div class="cart-content-right-text">
                    <p>Bạn sẽ được miễn phí giao hàng khi đơn hàng của bạn có tổng giá trị trên 3.500.000<sup>đ</sup></p>
                    <?php
                    if($tong < 3500000) {?>
                    <p style="color: red; font-weight: bold;">Mua thêm <span style="font-size: 18px; font-weight: bolder;">
                    <?php
                    $s= 3500000 - $tong;
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
                    ?><sup>đ</sup></span> để miễn phí giao hàng</p>
                    <?php } else {?>
                        <p style="color: red; font-weight: bold;"> Bạn đã được miễn phí giao hàng</p>
                    <?php } ?>
                </div>
                <div class="cart-content-right-button">
                    <button onclick = "TTMS()">TIẾP TỤC MUA SẮM</button>
                    <button onclick = "CartTT()">THANH TOÁN</button>
                </div>
                
            </div>

        </div>
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
                <div class="my-chat">Hi!</div>
                <div class="client-chat">Chào bạn</div>
                <div class="client-chat">Tôi có thể giúp gì cho bạn?</div>
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
</body>

</html>