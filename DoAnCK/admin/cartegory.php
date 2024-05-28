<?php
session_start();
$_SESSION['vr'] = null;
$conn = mysqli_connect('localhost', 'root', '', 'caykhe_doanck_sql');
if(! $conn)
{
    echo 'Connection error: ' . mysqli_connect_error();
}

$sql = "SELECT * FROM tbl_product";
if(!array_key_exists('phone',$_SESSION))
{
    $_SESSION['phone'] = null;
}
if(!array_key_exists('customer_own',$_SESSION))
{
    $_SESSION['customer_own'] = null;
}
if(!array_key_exists('id',$_SESSION))
{
    $_SESSION['id'] = null;
}
if($_SESSION['id'] != null)
{
    $idd = $_SESSION['id'];
    $sql = "SELECT * FROM tbl_product WHERE brand_id = $idd ";
    if($_SESSION['id'] == "23")
        $sql = "SELECT * FROM tbl_product WHERE product_price_new > 0";
    if($_SESSION['id'] == "24")
        $sql = "SELECT * FROM tbl_product WHERE cartegory_id = 13";
    if($_SESSION['id'] == "25")
        $sql = "SELECT * FROM tbl_product WHERE cartegory_id = 14";
   // $_SESSION['Loc'] = null;
}
$result = mysqli_query($conn, $sql);
$index = mysqli_fetch_all($result, MYSQLI_ASSOC);
mysqli_free_result($result);
mysqli_close($conn);
if ($_SERVER['REQUEST_METHOD']==='GET')
{
    if(array_key_exists('Xep',$_GET))
    {
        
       $index = $_SESSION['index'];
       
        if($_GET['Xep'] == "1")
        {
            $i = 0;
            while($i < count($index) - 1 )
            {
                $tpi = $index[$i]['product_price'] * (100 - $index[$i]['product_price_new'])/100;
                 //echo $index[$i]['product_name'];
                 //echo "<br>";
                $j = $i + 1;
                while($j < count($index))
                {
                    $tpj = $index[$j]['product_price'] * (100 - $index[$j]['product_price_new'])/100;
                    if($tpi > $tpj)
                    {
                        $tmp = $index[$i];
                        $index[$i] = $index[$j];
                        $index[$j] = $tmp;
                        $tpi = $index[$i]['product_price'] * (100 - $index[$i]['product_price_new'])/100;
                    }
                    $j++;
                }
               
                $i++;
            }
        }
        else 
        {
            $i = 0;
            while($i < count($index) - 1 )
            {
                $tpi = $index[$i]['product_price'] * (100 - $index[$i]['product_price_new'])/100;
                $j = $i + 1;
                while($j < count($index))
                {
                    $tpj = $index[$j]['product_price'] * (100 - $index[$j]['product_price_new'])/100;
                    if($tpi < $tpj)
                    {
                        $tmp = $index[$i];
                        $index[$i] = $index[$j];
                        $index[$j] = $tmp;
                        $tpi = $index[$i]['product_price'] * (100 - $index[$i]['product_price_new'])/100;
                    }
                    $j++;
                }
                $i++;
            }
        }
    }
    if(array_key_exists('Loc',$_GET))
    {
        $index = $_SESSION['index'];
        $l = 0;
        $r = 1000000;
            if($_GET['Loc'] == "2")
            {
                $l = 1000000;
                $r = 2000000;
            }
            else
            {
                if($_GET['Loc'] == "3")
                {
                    $l = 2000000;
                    $r = 3000000;
                }
                else
                {
                    $l = 3000000;
                    $r = 9000000;
                }
            }
        $i = 0;
        $dem = 0;
        while($i < count($index))
        {
            $tmp = $index[$i]['product_price'] * (100 - $index[$i]['product_price_new'])/100;
            while($i < count($index) && ($tmp < $l || $tmp > $r))
            {
                array_splice($index, $i, 1);
                if($i < count($index))
                    $tmp = $index[$i]['product_price'] * (100 - $index[$i]['product_price_new'])/100;
            }
            $i++;
        }
    }
}

if ($_SERVER['REQUEST_METHOD']==='POST')
{
    $conn = mysqli_connect('localhost', 'root', '', 'website_ivydemo');
    if(! $conn)
    {
        echo 'Connection error: ' . mysqli_connect_error();
    }
    $idd = "13";
    if(isset($_POST['13']))
    {
        $_SESSION['id'] = "13";
    }
    if(isset($_POST['14']))
    {
        $_SESSION['id'] = "14";
    }
    if(isset($_POST['15']))
    {
        $_SESSION['id'] = "15";
    }
    if(isset($_POST['16']))
    {
        $_SESSION['id'] = "16";
    }
    if(isset($_POST['17']))
    {
        $_SESSION['id'] = "17";
    }
    if(isset($_POST['18']))
    {
        $_SESSION['id'] = "18";
    }
    if(isset($_POST['19']))
    {
        $_SESSION['id'] = "19";
    }
    if(isset($_POST['20']))
    {
        $_SESSION['id'] = "20";
    }
    if(isset($_POST['21']))
    {
        $_SESSION['id'] = "21";
    }
    if($_SESSION['id'] != null)
        $idd = $_SESSION['id'];
    $sql = "SELECT * FROM tbl_product WHERE brand_id = $idd";
    if(isset($_POST['23']))
    {
        $sql = "SELECT * FROM tbl_product WHERE product_price_new > 0";
    }
    if(isset($_POST['24']))
    {
        $sql = "SELECT * FROM tbl_product WHERE cartegory_id = 13";
    }
    if(isset($_POST['25']))
    {
        $sql = "SELECT * FROM tbl_product WHERE cartegory_id = 14";
    }
    if(array_key_exists('26',$_POST))
    {
        $keyy = $_POST['26'];
        $sql = "SELECT * FROM tbl_product WHERE product_name LIKE '%$keyy%'";
    }
    if(isset($_POST['27']) || $idd == "27")
    {
        $sql = "SELECT *, SUM(bd.bill_desc_number) AS product_tt 
        FROM tbl_product pr JOIN tbl_bill_desc bd 
        ON pr.product_id = bd.product_id 
        GROUP BY pr.product_id
        ORDER BY product_tt DESC";
    }
    $result = mysqli_query($conn, $sql);

    $index = mysqli_fetch_all($result, MYSQLI_ASSOC);
    
    mysqli_free_result($result);
    mysqli_close($conn);
    //print_r($index);
    // foreach($index as $roww)
    // {
    //     echo $roww['product_name'];
    //     echo "<br>";
    // }
   // $_SESSION['Loc'] = null;
}
$_SESSION['sql'] = $sql;
if(!array_key_exists('Loc',$_GET))
    $_SESSION['index'] = $index;
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
    <title>Danh mục sản phẩm | CayKheShoes</title>
    <style>
        img{
            width: auto;
            height: auto;
        }
    </style>
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
            <li><button name = "27" type = "submit" >HÀNG BÁN CHẠY</button></li> 
            <li><button><a href = "member.php">THÔNG TIN</a></button></li> 
        </div>
    </form>
    </form>

    <div class="others">
        <li><input id = "26" placeholder="Tìm kiếm" type="text"> <i onclick = "TimKiem1()" class="fas fa-search" ></i></li>
        <li><a class="fa fa-user" <?php if($_SESSION['phone'] != null ) 
                echo 'href="./profile.php"';
              else
                echo 'href="./account_add.php"';
         ?>></a></li>
        <li><a class="fa fa-shopping-cart" <?php if($_SESSION['phone'] != null ) echo "href=\"cart.php\"" ?>></a></li>
        <li><a class="fa-solid fa-screwdriver-wrench" style="color: #202124;" <?php if($_SESSION['customer_own'] == 1 ) echo "href = \"cartegoryadd.php\"";?>></a></li>        
    </div>
</header>
<!-- --------Cartrgory----- -->
<section class="cartegory">
    <div class="container">
        <div class="cartegory-top row">
            <p>Trang chủ</p><span>&#10230; </span> <p>Nữ</p> <span>&#10230;</span><p>Giày thể thao</p>
        </div>
    </div>
    <div class="container">
            <div class="cartegory-right ">
                <div class="cartegory-right row">
                    <div class="cartegory-right-top-item">
                        <button id="filterButton" onclick="Loc()"> <i class="fa-solid fa-arrow-up-wide-short" ></i>Bộ lọc</button>
                    </div>
                    <div class="cartegory-right-top-item">  
                        <select name="" id ="Xep"  onchange = "Xep()">
                            <option >Sắp xếp</option>
                            <option id = "1" >Giá từ thấp đến cao</option>
                            <option id = "2"  >Giá từ cao đến thấp</option>
                        </select>
                    </div>
                </div>
               
                <div class="cartegory-right-content">
                  

                   <?php  foreach($index as $roww) { ?>
                    <?php if ($roww['product_number'] > 0) { ?>
                       <?php   if(!$roww['product_price_new'] > 0) { ?>
                          
                            <div class="cartegory-right-content-item">
                                <img src= "uploads/<?php echo ( $roww['product_img']) ?>" alt="" onclick = "Call(<?php echo ( $roww['product_id']) ?>)" > 
                                <h1> <?php echo htmlspecialchars( $roww['product_name']) ?></h1>
                                <p><?php
                                $s = $roww['product_price'];
                               
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
                                ?><sup>đ</sup></p>
                            </div>
                           <?php } else {?>
                           
                            <div class="cartegory-right-content-item giamgia">
                            
                            <img src= "uploads/<?php echo ( $roww['product_img']) ?>" alt="" onclick = "Call(<?php echo ( $roww['product_id']) ?>)" > 
                                <h1> <?php echo htmlspecialchars( $roww['product_name']) ?></h1>
                                <div class="label">Sale <?php echo $roww['product_price_new'];?>%</div>
                                <p><?php
                                $s = $roww['product_price']* ( 100 - $roww['product_price_new'])/100;
                                $ss = $roww['product_price_new'];
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
                                //echo htmlspecialchars( $roww['product_price'])
                                ?><sup>đ</sup></p>
                                
                            <p><?php
                                $s = $roww['product_price'];
                                
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
                                ?><sup>đ</sup></p>
                        </div>
                            <?php } ?>
                   <?php } else { ?>
                   
                    <?php   if(!$roww['product_price_new'] > 0) { ?>
                          
                          <div class="cartegory-right-content-item">
                              <img src= "uploads/<?php echo ( $roww['product_img']) ?>" alt="" > 
                              <h1> <?php echo htmlspecialchars( $roww['product_name']) ?></h1>
                              <label for="" class="cartegory-soldout">HẾT HÀNG</label>
                              <p><?php
                              $s = $roww['product_price'];
                             
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
                              ?><sup>đ</sup></p>
                          </div>
                         <?php } else {?>
                         
                          <div class="cartegory-right-content-item giamgia">
                          
                          <img src= "uploads/<?php echo ( $roww['product_img']) ?>" alt=""  > 
                              <h1> <?php echo htmlspecialchars( $roww['product_name']) ?></h1>
                              <label for="" class="label-soldout">HẾT HÀNG</label>
                              <div class="label">Sale <?php echo $roww['product_price_new'];?>%</div>
                              <p><?php
                              $s = $roww['product_price']* ( 100 - $roww['product_price_new'])/100;
                              $ss = $roww['product_price_new'];
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
                              //echo htmlspecialchars( $roww['product_price'])
                              ?><sup>đ</sup></p>
                              
                          <p><?php
                              $s = $roww['product_price'];
                              
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
                              ?><sup>đ</sup></p>
                      </div>
                          <?php } ?>
                    <?php } }?>
                   
                    <!-- <div class="cartegory-right-content-item">
                        <img src="image/product/product1/giay-nike-air-max-systm-nu-trang-xanh-01-800x800.jpg" alt="">
                        <h1> Giày Nike Air Max SYSTM Nữ</h1>
                            <label for="" class="label-soldout">HẾT HÀNG</label>
                            <p>1.590.000<sup>đ</sup></p>
                    </div>
                    <div class="cartegory-right-content-item">X
                        <img src="image/product/giay-nike-air-zoom-pegasus-40-nu-trang-ngoc-01-800x800.jpg" alt="">
                        <h1>Giày Nike Air Zoom Pegasus 40 Nữ - Trắng Ngọc</h1>
                            <p>3.829.000<sup>đ</sup></p>
                    </div>
                    <div class="cartegory-right-content-item">
                        <img src="image/product/giay-nike-air-zoom-pegasus-40-nu-hong-trang-01-800x800.jpg" alt="">
                        <h1>Giày Nike Air Zoom Pegasus 40 Nữ - Hồng Trắng</h1>
                            <p>3.829.000<sup>đ</sup></p>
                    </div>
                    <div class="cartegory-right-content-item">
                        <img src="image/product/giay-nike-air-winflo-10-nu-trang-01-800x800.jpg" alt="">
                        <h1>Giày Nike Air Winflo 10 Nữ - Trắng</h1>
                            <p>2.929.000<sup>đ</sup></p>
                    </div>
                    <div class="cartegory-right-content-item">
                        <img src="image/product/giay-nike-air-max-ap-nu-trang-01-800x800.jpg" alt="">
                        <h1>Giày Nike Air Max AP Nữ - Trắng</h1>
                            <p>1.590.000<sup>đ</sup></p>
                    </div>
                    <div class="cartegory-right-content-item">
                        <img src="image/product/giay-nike-air-max-excee-nu-trang-xanhl-01-800x800.jpg" alt="">
                        <h1>Giày Nike Air Max Excee Nữ - Trắng Xanh</h1>
                            <p>2.390.000<sup>đ</sup></p>
                    </div>
                    <div class="cartegory-right-content-item">
                        <img src="image/product/giay-nike-air-zoom-pegasus-39-nu-xam-01-800x800.jpg" alt="">
                        <h1>Giày Nike Air Zoom Pegasus 39 Nữ- Xám</h1>
                            <p>2.990.000<sup>đ</sup></p>
                    </div>
                    <div class="cartegory-right-content-item">
                        <img src="image/product/giay-nike-court-vision-low-nu-trang-01-800x800.jpg" alt="">
                        <h1>Giày Nike Court Vision Low Nữ- Trắng</h1>
                            <p>2.090.000<sup>đ</sup></p>
                    </div> -->
                     
                </div>   
                  
            </div>  
    </div>
    <div id= "loc" class="cartegory-boloc">
        <button class="exit-btn"><img src="image/cross.png" alt="" onclick = "Loc()" ></button>
        <h2 for="">BỘ LỌC</h2>
        <label for="">GIÁ</label><br>
        <input type="radio" name="gia" id = "1" onchange ="LLoc(this.id)"><label for="">Dưới 1.000.000 <sup>đ</sup></label><br>
        <input type="radio" name="gia" id = "2" onchange ="LLoc(this.id)"><label for="">Từ 1.000.000<sup>đ</sup> đến 2.000.000<sup>đ</sup</label><br>
        <input type="radio"name="gia" id = "3" onchange ="LLoc(this.id)"><label for="">Từ 2.000.000<sup>đ</sup> đến 3.000.000<sup>đ</sup</label><br>
        <input type="radio" name="gia" id = "4" onchange ="LLoc(this.id)"><label for="">Trên 3.000.000 <sup>đ</sup></label><br>   
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
    <img src="image/logo.png" alt=""><br>
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