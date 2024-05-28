-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2023 at 06:41 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `website_ivydemo`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account`
--

CREATE TABLE `tbl_account` (
  `account_phone` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_pass` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_date` date DEFAULT NULL,
  `customer_province` varchar(255) NOT NULL,
  `customer_district` varchar(255) NOT NULL,
  `customer_ward` varchar(255) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `sex` int(11) NOT NULL,
  `customer_ava` varchar(255) NOT NULL,
  `customer_own` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_account`
--

INSERT INTO `tbl_account` (`account_phone`, `account_name`, `account_pass`, `customer_name`, `customer_date`, `customer_province`, `customer_district`, `customer_ward`, `customer_address`, `sex`, `customer_ava`, `customer_own`) VALUES
('012345', 'Duy', '12345', '', '0000-00-00', '', '', '', '', 0, '0', b'0'),
('033270053', 'huy', '21', '', '0000-00-00', '', '', '', '', 0, '0', b'0'),
('0354', 'Duy', '1', 'Nguyễn Văn Minh', NULL, 'Khánh Hòa', 'Ninh Hòa', 'Ninh An', 'Ninh Ích', 0, '0', b'0'),
('0369084341', 'lethinh2003', 'thinh123', '', NULL, '', '', '', '', 0, '', b'0'),
('12', 'Vân', '1', 'Minh Vân', '0000-00-00', 'Long Khánh', 'Châu Thành', 'Ninh An', 'số 4 bà Triệu', 3, '0', b'0'),
('123', 'Mai', '321', 'Lê Công Văn', '2023-05-09', 'Tỉnh Hà Giang', 'Huyện Yên Minh', 'Xã Hữu Vinh', 'số 3 đường đá', 0, 'ngoc.png', b'1'),
('22', 'Loan', '1', 'Nguyễn Đại Long', '1998-02-13', 'Khánh Hòa', 'Châu Thành', 'Ninh An', 'số 4 bà Triệu', 3, '0', b'0'),
('555', 'Nam Ban', '1', 'Nguyễn Bàn Nam', '2023-05-10', 'Tỉnh Cao Bằng', 'Huyện Bảo Lạc', 'Xã Hưng Đạo', 'Số 16 đường Lộc Đá', 0, '0', b'0'),
('899', 'Tui', '11', '', NULL, '', '', '', '', 0, '', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bill`
--

CREATE TABLE `tbl_bill` (
  `bill_code` int(11) NOT NULL,
  `account_phone` varchar(255) NOT NULL,
  `bill_money` int(11) NOT NULL,
  `bill_date` date NOT NULL,
  `bill_flag` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_bill`
--

INSERT INTO `tbl_bill` (`bill_code`, `account_phone`, `bill_money`, `bill_date`, `bill_flag`) VALUES
(4, '123', 3894220, '0000-00-00', b'1'),
(5, '123', 3894220, '0000-00-00', b'1'),
(6, '123', 3894220, '0000-00-00', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bill_desc`
--

CREATE TABLE `tbl_bill_desc` (
  `bill_code` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `bill_desc_number` int(11) NOT NULL,
  `bill_desc_money` int(11) NOT NULL,
  `bill_desc_sale` int(11) NOT NULL,
  `bill_desc_size` int(11) NOT NULL DEFAULT 35
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_bill_desc`
--

INSERT INTO `tbl_bill_desc` (`bill_code`, `product_id`, `bill_desc_number`, `bill_desc_money`, `bill_desc_sale`, `bill_desc_size`) VALUES
(5, 29, 1, 2528900, 505780, 35),
(5, 100, 1, 2079000, 207900, 37);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int(11) NOT NULL,
  `cartegory_id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brand_id`, `cartegory_id`, `brand_name`) VALUES
(13, 13, 'GIÀY THỂ THAO'),
(14, 13, 'GIÀY CAO GÓT'),
(15, 13, 'GIÀY SANDAL'),
(16, 13, 'GIÀY BÚP BÊ'),
(17, 13, 'DÉP NỮ'),
(18, 14, 'GIÀY THỂ THAO'),
(19, 14, 'GIÀY TÂY'),
(20, 14, 'GIÀY SANDAL'),
(21, 14, 'DÉP NAM'),
(23, 16, 'SALE');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `account_phone` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cart_number` int(11) NOT NULL,
  `product_size` int(11) NOT NULL,
  `cart_tick` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_cart`
--

INSERT INTO `tbl_cart` (`account_phone`, `product_id`, `cart_number`, `product_size`, `cart_tick`) VALUES
('555', 29, 6, 36, b'1'),
('555', 91, 3, 37, b'1'),
('555', 31, 1, 36, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cartegory`
--

CREATE TABLE `tbl_cartegory` (
  `cartegory_id` int(11) NOT NULL,
  `cartegory_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_cartegory`
--

INSERT INTO `tbl_cartegory` (`cartegory_id`, `cartegory_name`) VALUES
(13, 'NỮ'),
(14, 'NAM'),
(16, 'SALE'),
(17, 'BỘ SƯU TẬP '),
(18, 'THÔNG TIN');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `cartegory_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_number` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_price_new` int(11) NOT NULL,
  `product_desc` varchar(5000) NOT NULL,
  `product_img` varchar(255) NOT NULL,
  `product_tax` int(11) NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_name`, `cartegory_id`, `brand_id`, `product_number`, `product_price`, `product_price_new`, `product_desc`, `product_img`, `product_tax`) VALUES
(29, 'GIÀY NIKE AIR MAX SYSTM NỮ - TRẮNG XANH', 13, 13, 102, 2299000, 20, '<p><em><strong>Gi&agrave;y Nike Air Max SYSTM</strong></em> <em>l&agrave; mẫu gi&agrave;y Air Max mới được Nike ra mắt trong năm nay. Nike Air Max SYSTM c&oacute; thiết kế thời trang năng động, trẻ trung. &nbsp;Đ&acirc;y hứa hẹn sẽ l&agrave; một mẫu gi&agrave;y cực hot trong trong thời gian tới.</em></p>\r\n\r\n<p>Phần Upper của gi&agrave;y được l&agrave;m từ chất liệu mesh tho&aacute;ng kh&iacute; v&agrave; da cao cấp, bộ đệm Air Max được thiết kế kh&aacute; d&agrave;y mang đến sự &ecirc;m &aacute;i tuyệt vời. Gi&agrave;y Nike Air Max SYSTM c&oacute; thể sử dụng trong mọi hoạt động h&agrave;ng ng&agrave;y.</p>\r\n\r\n<p>Gi&agrave;y Nike Air Max SYSTM tại <strong>CAYKHEShose</strong> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n\r\n<p><img alt=\"\" src=\"/admin/uploads/files/giay-nike-mota2.jpg\" style=\"height:300px; width:300px\" /></p>\r\n', 'GIÀY NIKE AIR MAX SYSTM NỮ - TRẮNG XANH.jpg', 10),
(30, 'GIÀY NIKE AIR ZOOM PEGASUS 40 NỮ - TRẮNG NGỌC', 13, 13, 0, 3499000, 40, '<p><strong>Gi&agrave;y Nike Air Zoom Pegasus 40</strong> chắc chắn sẽ l&agrave;m thoả m&atilde;n những người y&ecirc;u thương hiệu thương hiệu Nike tr&ecirc;n to&agrave;n thế giới, với những cải tiến vượt trội so với phi&ecirc;n bản trước Pegasus 39, Nike Pegasus 40 xứng đ&aacute;ng được c&aacute;c fan ng&agrave;y đ&ecirc;m săn đ&oacute;n.</p>\r\n\r\n<p><em>Vậy Gi&agrave;y Nike Air Zoom Pegasus 40 c&oacute; g&igrave; đặc biệt ch&uacute;ng ta c&ugrave;ng t&igrave;m hiểu nh&eacute;!</em></p>\r\n\r\n<ul>\r\n	<li>Đầu ti&ecirc;n x&eacute;t đến ngoại h&igrave;nh, Nike Pegasus 40 c&oacute; thiết kế thừa hưởng từ phi&ecirc;n bản Pegasus 39 nhưng với nhiều cải tiến vượt trội về chất liệu v&agrave; c&ocirc;ng nghệ.</li>\r\n	<li>Thứ 2: Phần Upper của gi&agrave;y được l&agrave; từ chất liệu Mesh d&agrave;y dặn v&agrave; c&oacute; độ đ&agrave;n hồi tốt hơn nhưng rất kho&aacute;ng kh&iacute;, khiến form gi&agrave;y được giữ rất tốt trong qu&aacute; tr&igrave;nh sử dụng. Thiết kế upper khiến cảm gi&aacute;c l&ecirc;n ch&acirc;n cực kỳ thoải m&aacute;i vừa vặn v&agrave; hấp dẫn.</li>\r\n	<li>Thứ 3: Phần đế giữa với sự kế hợp 2 c&ocirc;ng nghệ đỉnh cao của Nike đ&oacute; l&agrave; React v&agrave; Air Zoom tạo l&ecirc;n độ đ&agrave;n hồi v&agrave; &ecirc;m &aacute;i tuyệt vời. Bạn c&oacute; thể sử dụng Gi&agrave;y Nike Air Zoom Pegasus 40 cho c&aacute;c cuộc chạy đường d&agrave;i như Marathon hay chạy ngắn tốc độ cao đều rất ph&ugrave; hợp.</li>\r\n	<li>Thứ 4: Nike Air Zoom Pegasus 40 được thiết kế tối ưu cho việc chạy bộ, b&agrave;n ch&acirc;n bạn sẽ c&oacute; cảm gi&aacute;c chuyển động cực kỳ mượt m&agrave; từ ng&oacute;n ch&acirc;n cho đến g&oacute;t ch&acirc;n, năng lượng được tiết kiệm tối đa gi&uacute;p bạn c&oacute; thể sử dụng cả ng&agrave;y m&agrave; kh&ocirc;ng g&acirc;y nhức mỏi hay l&agrave;m bạn bị tổn thương.</li>\r\n</ul>\r\n\r\n<p>Cuối c&ugrave;ng, Gi&agrave;y Nike Pegasus 40 l&agrave; sản phẩm chiến lược của Nike n&ecirc;n họ đ&atilde; đưa v&agrave;o si&ecirc;u phẩm n&agrave;y những c&ocirc;ng nghệ tốt nhất biến n&oacute; trở th&agrave;nh mẫu gi&agrave;y thể thao tuyệt nhất m&agrave; CAYKHEShose tự h&agrave;o giới thiệu đến bạn.</p>\r\n\r\n<p><strong>Gi&agrave;y Nike Air Zoom Pegasus 40 được CAYKHEShose nhập khẩu Ch&iacute;nh H&atilde;ng từ Nike. Full box, đầy đủ phụ kiện.</strong></p>\r\n\r\n<p><strong><img alt=\"\" src=\"/admin/uploads/files/giay-nike-air-zoom.jpg\" style=\"height:270px; width:270px\" /></strong></p>\r\n', 'GIÀY NIKE AIR ZOOM PEGASUS 40 NỮ - TRẮNG NGỌC.jpg', 10),
(31, 'GIÀY NIKE AIR MAX AP NỮ - TRẮNG', 13, 13, 35, 2690000, 0, '<p><em><strong>Gi&agrave;y Nike Air Max AP</strong></em> <em>l&agrave; mẫu gi&agrave;y với thiết kế v&ocirc; c&ugrave;ng thời trang của Nike với sự kết hợp h&agrave;i h&ograve;a giữa qu&aacute; khứ v&agrave; hiện đại.</em></p>\r\n\r\n<p>Phần đế giữa của Nike Air Max AP được thiết kế rất hợp l&yacute; mềm mại với c&ocirc;ng nghệ ti&ecirc;n tiến nhất của Nike. Chắc chắn đ&acirc;y l&agrave; mẫu gi&agrave;y m&agrave; bất cứ fan Sneaker kh&ocirc;ng thể bỏ qua</p>\r\n\r\n<p><em>Gi&agrave;y Nike Air Max AP</em> ch&iacute;nh h&atilde;ng tại <strong>CAYKHEShose</strong> được nhập khẩu ch&iacute;nh h&atilde;ng từ Nike. Full box, đầy đủ phụ kiện.</p>\r\n\r\n<p><img alt=\"\" src=\"/admin/uploads/files/GI%C3%80Y%20NIKE%20AIR%20MAX%20AP%20N%E1%BB%AE%20-%20TR%E1%BA%AENG.jpg\" style=\"height:270px; width:270px\" /></p>\r\n', 'GIÀY NIKE AIR MAX AP NỮ - TRẮNG.jpg', 10),
(32, 'GIÀY NIKE AIR MAX EXCEE NỮ - TRẮNG XANH', 13, 13, 70, 2380000, 20, '<p><em><strong>Gi&agrave;y Nike Air Max Excee</strong></em> mẫu gi&agrave;y thời trang năng động, trẻ trung Air Max Excee đ&atilde; cập bến tại CAYKHEShose. Đ&acirc;y hứa hẹn sẽ l&agrave; một mẫu gi&agrave;y chất chơi m&agrave; bạn kh&ocirc;ng thể bỏ qua.</p>\r\n\r\n<p>Gi&agrave;y &nbsp;Nike &nbsp;Air Max Excee ch&iacute;nh h&atilde;ng tại <strong>CAYKHEShose</strong> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n\r\n<p><img alt=\"\" src=\"/admin/uploads/files/GI%C3%80Y%20NIKE%20AIR%20MAX%20EXCEE%20N%E1%BB%AE%20-%20TR%E1%BA%AENG%20XANH.jpg\" style=\"height:270px; width:270px\" /></p>\r\n', 'GIÀY NIKE AIR MAX EXCEE NỮ - TRẮNG XANH.jpg', 10),
(33, 'GIÀY NIKE REVOLUTION 6 NEXT NATURE NỮ - HỒNG NHẠT', 13, 13, 105, 1999000, 5, '<p><em><strong>Gi&agrave;y Nike Revolution 6</strong></em> l&agrave; mẫu gi&agrave;y chạy bộ, tập thể thao nhẹ nh&agrave;ng v&agrave; c&oacute; mức gi&aacute; rất tốt tại <em>CAYKHEShose</em> - Gi&agrave;y Ch&iacute;nh H&atilde;ng. Nike Revolution 6 sẽ l&agrave; lựa chọn ho&agrave;n hảo, hợp l&yacute;,ch&iacute;nh x&aacute;c cho bạn &lt;3.</p>\r\n\r\n<p>Với c&ocirc;ng nghệ được thiết kế để vừa chạy vừa c&oacute; thể tập thể thao nhưng lại kh&ocirc;ng qu&aacute; đắt như Zoom hay React. Nike Revolution 6 sẽ l&agrave; mẫu gi&agrave;y m&agrave; c&aacute;c t&iacute;n đồ y&ecirc;u th&iacute;ch thể thao n&ecirc;n c&oacute; cho m&igrave;nh một đ&ocirc;i. Đồng thời với lối thiết kế trẻ trung, hiện đại th&igrave; bạn c&oacute; thể d&ugrave;ng ch&iacute;nh đ&ocirc;i gi&agrave;y n&agrave;y để kết hợp với c&aacute;c Outfit thường ng&agrave;y.</p>\r\n\r\n<p><strong>Gi&agrave;y Nike Revolution 6</strong> tại <strong>CAYKHEShose </strong>được nhập khẩu ch&iacute;nh h&atilde;ng từ Nike. Full box, đầy đủ phụ kiện.</p>\r\n\r\n<p><img alt=\"\" src=\"/admin/uploads/files/GI%C3%80Y%20NIKE%20REVOLUTION%206%20NEXT%20NATURE%20N%E1%BB%AE%20-%20H%E1%BB%92NG%20NH%E1%BA%A0T.jpg\" style=\"height:270px; width:270px\" /></p>\r\n', 'GIÀY NIKE REVOLUTION 6 NEXT NATURE NỮ - HỒNG NHẠT.jpg', 10),
(34, 'GIÀY CAO GÓT NỮ BÍT MŨI ICON LEATHER POINTER', 13, 14, 80, 1999000, 10, '<ul>\r\n	<li>Chất liệu: Calf Leather. Lớp l&oacute;t: PU</li>\r\n	<li>Chiều cao g&oacute;t: 6.5 cm</li>\r\n	<li>Kiểu d&aacute;ng gi&agrave;y cao g&oacute;t mũi nhọn hiện đại</li>\r\n	<li>Quai đeo g&oacute;t bản mảnh v&agrave; kh&oacute;a kim loại nhỏ</li>\r\n	<li>Đ&iacute;nh logo thương hiệu ở mũi gi&agrave;y nổi bật</li>\r\n	<li>Gam m&agrave;u hiện đại dễ d&agrave;ng phối với nhiều trang phục v&agrave; phụ kiện</li>\r\n	<li>Xuất xứ thương hiệu: Singapore</li>\r\n</ul>\r\n\r\n<p><strong>Gi&agrave;y cao g&oacute;t nữ Icon Leather Pointer</strong> tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'GIÀY CAO GÓT NỮ BÍT MŨI ICON LEATHER POINTER.webp', 10),
(35, 'GIÀY CAO GÓT NỮ BÍT MŨI PHỐI QUAI CHUỖI XÍCH HIỆN ĐẠI', 13, 14, 55, 1890000, 15, '<ul>\r\n	<li>Kiểu d&aacute;ng gi&agrave;y cao g&oacute;t mũi nhọn thời trang</li>\r\n	<li>Hở g&oacute;t hiện đại, phối quai ngang với chuỗi x&iacute;ch kim loại sang trọng</li>\r\n	<li>G&oacute;t nhọn nữ t&iacute;nh</li>\r\n	<li>Phom &ocirc;m ch&acirc;n, dễ d&agrave;ng di chuyển</li>\r\n	<li>Chất liệu mềm mại, &ecirc;m &aacute;i</li>\r\n	<li>Gam m&agrave;u hiện đại dễ d&agrave;ng phối với nhiều trang phục v&agrave; phụ kiện</li>\r\n	<li>Xuất xứ thương hiệu: Singapore&nbsp;</li>\r\n</ul>\r\n\r\n<p>Gi&agrave;y cao g&oacute;t nữ b&iacute;t mũi phối quai chuỗi x&iacute;ch hiện đại tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY CAO GÓT NỮ BÍT MŨI PHỐI QUAI CHUỖI XÍCH HIỆN ĐẠI.webp', 10),
(36, 'GIÀY CAO GÓT NỮ BÍT MŨI MAIA LEATHER', 13, 14, 60, 2350000, 7, '<ul>\r\n	<li>Chất liệu: Kid Leather. Lớp l&oacute;t: Kid Leather&nbsp;</li>\r\n	<li>Chiều cao g&oacute;t: 8 cm</li>\r\n	<li>Kiểu d&aacute;ng gi&agrave;y cao g&oacute;t mũi nhọn thời thượng</li>\r\n	<li>Quai ngang v&agrave; quai đeo g&oacute;t bản mảnh</li>\r\n	<li>Phom &ocirc;m ch&acirc;n, dễ d&agrave;ng di chuyển</li>\r\n	<li>Chất liệu mềm mại, &ecirc;m &aacute;i</li>\r\n	<li>Gam m&agrave;u hiện đại dễ d&agrave;ng phối với nhiều trang phục v&agrave; phụ kiện</li>\r\n	<li>Xuất xứ thương hiệu: Singapore&nbsp;</li>\r\n</ul>\r\n\r\n<p>Gi&agrave;y cao g&oacute;t nữ b&iacute;t mũi Maia Leather Slingback tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY CAO GÓT NỮ BÍT MŨI MAIA LEATHER.webp', 10),
(37, 'GIÀY CAO GÓT NỮ BÍT MŨI EMBELLISHED SATIN ', 13, 14, 65, 1890000, 9, '<ul>\r\n	<li>Chất liệu: Satin Faux Leather. Lớp l&oacute;t: PU</li>\r\n	<li>Chiều cao g&oacute;t: 7.5 cm</li>\r\n	<li>Kiểu d&aacute;ng gi&agrave;y cao g&oacute;t mũi nhọn thời thượng</li>\r\n	<li>Phom &ocirc;m ch&acirc;n, dễ d&agrave;ng di chuyển</li>\r\n	<li>Chất liệu mềm mại, &ecirc;m &aacute;i</li>\r\n	<li>Gam m&agrave;u hiện đại dễ d&agrave;ng phối với nhiều trang phục v&agrave; phụ kiện</li>\r\n	<li>Xuất xứ thương hiệu: Singapore&nbsp;</li>\r\n</ul>\r\n\r\n<p>Gi&agrave;y cao g&oacute;t nữ b&iacute;t mũi Embellished Satin tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY CAO GÓT NỮ BÍT MŨI EMBELLISHED SATIN.webp', 10),
(38, 'GIÀY CAO GÓT NỮ BÍT MŨI NỮ TÍNH', 13, 14, 70, 2299000, 10, '<ul>\r\n	<li>Kiểu d&aacute;ng gi&agrave;y cao g&oacute;t mũi nhọn thời trang</li>\r\n	<li>Phom d&aacute;ng &ocirc;m ch&acirc;n</li>\r\n	<li>G&oacute;t nhọn</li>\r\n	<li>Thiết kế đường viền may nổi tinh tế, đẹp mắt</li>\r\n	<li>Lớp l&oacute;t b&ecirc;n trong gi&uacute;p mang lại cảm gi&aacute;c thoải m&aacute;i khi mang</li>\r\n	<li>Gam m&agrave;u hiện đại dễ d&agrave;ng phối với nhiều trang phục v&agrave; phụ kiện</li>\r\n	<li>Xuất xứ thương hiệu: Singapore&nbsp;</li>\r\n</ul>\r\n\r\n<p>Gi&agrave;y cao g&oacute;t nữ b&iacute;t mũi nữ t&iacute;nh tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.<br />\r\n&nbsp;</p>\r\n', 'GIÀY CAO GÓT NỮ BÍT MŨI NỮ TÍNH.webp', 10),
(39, 'GIÀY SANDALS NỮ ĐẾ THẤP QUAI NGANG HIỆN ĐẠI TERRAZO', 13, 15, 75, 1999000, 5, '<ul>\r\n	<li>Chất liệu: Tweed/ Faux Suede. Lớp l&oacute;t: PU</li>\r\n	<li>Chiều cao g&oacute;t: 3.3cm</li>\r\n	<li>Kiểu d&aacute;ng gi&agrave;y sandals nữ mũi tr&ograve;n thời trang</li>\r\n	<li>Quang ngang trẻ trung</li>\r\n	<li>Đi k&egrave;m d&acirc;y đeo cổ ch&acirc;n chắc chắn</li>\r\n	<li>Phom d&aacute;ng &ocirc;m ch&acirc;n, vừa vặn</li>\r\n	<li>Gam m&agrave;u hiện đại dễ d&agrave;ng phối với nhiều trang phục v&agrave; phụ kiện</li>\r\n	<li>Xuất xứ thương hiệu: Singapore</li>\r\n</ul>\r\n\r\n<p>Gi&agrave;y sandals nữ đế thấp quai ngang hiện đại Terrazo tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY SANDALS NỮ ĐẾ THẤP QUAI NGANG HIỆN ĐẠI TERRAZO.jpg', 10),
(40, 'GIÀY SANDALS CAO GÓT NỮ MŨI VUÔNG THỜI TRANG', 13, 15, 50, 2099000, 10, '<ul>\r\n	<li>Kiểu d&aacute;ng gi&agrave;y cao g&oacute;t mũi vu&ocirc;ng hiện đại</li>\r\n	<li>Phom &ocirc;m ch&acirc;n, dễ d&agrave;ng di chuyển</li>\r\n	<li>G&oacute;t nhọn nữ t&iacute;nh</li>\r\n	<li>Quai ngang mảnh nữ t&iacute;nh</li>\r\n	<li>D&acirc;y đeo slingback phối kh&oacute;a c&agrave;i c&oacute; thể điểu chỉnh</li>\r\n	<li>Chất liệu mềm mại, &ecirc;m &aacute;i</li>\r\n	<li>Gam m&agrave;u hiện đại dễ d&agrave;ng phối với nhiều trang phục v&agrave; phụ kiện</li>\r\n	<li>Xuất xứ thương hiệu: Singapore</li>\r\n</ul>\r\n\r\n<p>Gi&agrave;y sandals cao g&oacute;t nữ mũi vu&ocirc;ng thời trang tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY SANDALS CAO GÓT NỮ MŨI VUÔNG THỜI TRANG.webp', 10),
(41, 'GIÀY SANDALS NỮ ĐẾ THẤP QUAI BẢN RỘNG THỜI TRANG', 13, 15, 85, 1999000, 8, '<ul>\r\n	<li>Kiểu d&aacute;ng gi&agrave;y sandals mũi vu&ocirc;ng thời trang</li>\r\n	<li>Thiết kế quai thắt độc đ&aacute;o, bản rộng c&aacute; t&iacute;nh</li>\r\n	<li>Phối d&acirc;y đeo slingback c&oacute; kh&oacute;a c&oacute; thể điều chỉnh</li>\r\n	<li>Phong c&aacute;ch ph&oacute;ng kho&aacute;ng, hiện đại, đa năng</li>\r\n	<li>M&agrave;u sắc hiện đại, dễ d&agrave;ng kết hợp với nhiều phong c&aacute;ch kh&aacute;c nhau</li>\r\n	<li>Xuất xứ thương hiệu: Singapore</li>\r\n</ul>\r\n\r\n<p>Gi&agrave;y sandals nữ đế thấp quai bản rộng thời trang tại <strong><em>CAYKHEShose</em></strong> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY SANDALS NỮ ĐẾ THẤP QUAI BẢN RỘNG THỜI TRANG.webp', 10),
(42, 'GIÀY SANDALS UNISEX ĐẾ THẤP QUAI NGANG CHUNKY', 13, 15, 60, 1890000, 10, '<ul>\r\n	<li>Chất liệu: TPU</li>\r\n	<li>Kiểu d&aacute;ng gi&agrave;y sandals hở mũi thời trang</li>\r\n	<li>Quai ngang hiện đại</li>\r\n	<li>Kh&oacute;a d&aacute;n tiện lợi, phối logo b&oacute;ng ch&agrave;y nổi bật</li>\r\n	<li>Lớp l&oacute;t &ecirc;m &aacute;i, thấm h&uacute;t mồ h&ocirc;i</li>\r\n	<li>Phần đế thiết kế c&aacute;c khe r&atilde;nh chống trơn trượt</li>\r\n	<li>Gam m&agrave;u hiện đại dễ d&agrave;ng phối với nhiều trang phục v&agrave; phụ kiện</li>\r\n	<li>Xuất xứ thương hiệu: H&agrave;n Quốc</li>\r\n</ul>\r\n\r\n<p>Gi&agrave;y sandals unisex đế thấp quai ngang Chunky tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY SANDALS UNISEX ĐẾ THẤP QUAI NGANG CHUNKY.webp', 10),
(43, 'GIÀY BÚP BÊ NỮ ĐẾ BỆT MŨI NHỌN MALTA', 13, 16, 65, 1890000, 9, '<ul>\r\n	<li>Chất liệu: Nappa leather&nbsp;</li>\r\n	<li>Kiểu d&aacute;ng gi&agrave;y b&uacute;p b&ecirc; nữ mũi nhọn thời trang</li>\r\n	<li>Phom &ocirc;m ch&acirc;n, dễ d&agrave;ng di chuyển</li>\r\n	<li>Phối quai ngang bằng vải thun co gi&atilde;n thoải m&aacute;i</li>\r\n	<li>Chất liệu da sang trọng, lớp l&oacute;t &ecirc;m &aacute;i</li>\r\n	<li>Gam m&agrave;u hiện đại dễ d&agrave;ng phối với nhiều trang phục v&agrave; phụ kiện</li>\r\n	<li>Xuất xứ thương hiệu: &Yacute;</li>\r\n</ul>\r\n\r\n<p>Gi&agrave;y b&uacute;p b&ecirc; nữ đế bệt mũi nhọn Malta tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY BÚP BÊ NỮ ĐẾ BỆT MŨI NHỌN MALTA.webp', 10),
(44, 'GIÀY BÚP BÊ NỮ ĐẾ BỆT MŨI NHỌN STUDIO JEANNE', 13, 16, 70, 999000, 5, '<ul>\r\n	<li>Chất liệu: Kid Leather. Lớp l&oacute;t: Kid Leather</li>\r\n	<li>Chiều cao g&oacute;t: 1.2cm</li>\r\n	<li>Kiểu d&aacute;ng gi&agrave;y đế bệt b&iacute;t mũi hở g&oacute;t trẻ trung</li>\r\n	<li>Mũi nhọn nữ t&iacute;nh</li>\r\n	<li>Phối d&acirc;y đeo cổ ch&acirc;n với chi tiết kim loại mạ v&agrave;ng sang trọng</li>\r\n	<li>Gam m&agrave;u hiện đại dễ d&agrave;ng phối với nhiều trang phục v&agrave; phụ kiện</li>\r\n	<li>Xuất xứ thương hiệu: Singapore</li>\r\n</ul>\r\n\r\n<p>Gi&agrave;y b&uacute;p b&ecirc; nữ đế bệt mũi nhọn Studio Jeanne tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY BÚP BÊ NỮ ĐẾ BỆT MŨI NHỌN STUDIO JEANNE.webp', 10),
(45, 'GIÀY BÚP BÊ NỮ ĐẾ BỆT MŨI NHỌN SANG TRỌNG', 13, 16, 45, 1678000, 10, '<ul>\r\n	<li>Chất liệu: Fabric &amp; Faux Leather</li>\r\n	<li>Chiều cao g&oacute;t: 0.8cm</li>\r\n	<li>Kiểu d&aacute;ng gi&agrave;y đế bệt mũi nhọn nữ t&iacute;nh, thời trang</li>\r\n	<li>Phối biểu tương thương hiệu bằng kim loại nổi bật ở giữa mũi</li>\r\n	<li>Phom &ocirc;m ch&acirc;n thoải m&aacute;i</li>\r\n	<li>Gam m&agrave;u hiện đại dễ d&agrave;ng phối với nhiều trang phục v&agrave; phụ kiện</li>\r\n	<li>Xuất xứ thương hiệu: Singapore</li>\r\n</ul>\r\n\r\n<p>Gi&agrave;y b&uacute;p b&ecirc; nữ đế bệt mũi nhọn sang trọng tại <em><strong>CAYKHEShose </strong></em>được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY BÚP BÊ NỮ ĐẾ BỆT MŨI NHỌN SANG TRỌNG.webp', 10),
(46, 'GIÀY BÚP BÊ NỮ ĐẾ BỆT MŨI NHỌN HỞ GÓT VAE SKIMMER', 13, 16, 80, 1678000, 10, '<ul>\r\n	<li>Th&agrave;nh phần chất liệu: Da thật</li>\r\n	<li>Độ cao g&oacute;t: 1/4&quot;</li>\r\n	<li>Kiểu d&aacute;ng gi&agrave;y b&uacute;p b&ecirc; nữ hở g&oacute;t thời trang</li>\r\n	<li>Mũi nhọn nữ t&iacute;nh, kh&oacute;a c&agrave;i xỏ kim đơn giản</li>\r\n	<li>Đế cao su chắc chắn</li>\r\n	<li>Phom &ocirc;m d&aacute;ng ch&acirc;n, dễ d&agrave;ng di chuyển</li>\r\n	<li>Gam m&agrave;u hiện đại, dễ d&agrave;ng phối với nhiều trang phục v&agrave; phụ kiện kh&aacute;c</li>\r\n	<li>Xuất xứ thương hiệu: New York</li>\r\n</ul>\r\n\r\n<p>Gi&agrave;y b&uacute;p b&ecirc; nữ đế bệt mũi nhọn hở g&oacute;t Vae Skimmer tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY BÚP BÊ NỮ ĐẾ BỆT MŨI NHỌN HỞ GÓT VAE SKIMMER.webp', 10),
(47, 'DÉP NỮ ZUCIA QUAI NGANG ĐẾ TRẤU', 13, 17, 85, 999000, 8, '<p><strong>D&Eacute;P NỮ ZUCIA QUAI NGANG ĐẾ TRẤU</strong></p>\r\n\r\n<p>- Điểm nổi bật: Quai ngang cắt Laser &ocirc;m ch&acirc;n c&ugrave;ng đế trấu mềm nhẹ thoải m&aacute;i.<br />\r\n- M&atilde; sản phẩm: DTW04<br />\r\n- M&agrave;u: Đen, T&iacute;m, Trắng<br />\r\n- Size: 35 - 39&nbsp;<br />\r\n- Chất liệu: Si<br />\r\n- Đế: Đế trấu<br />\r\n- Cao: 3cm<br />\r\nD&eacute;p nữ Zucia quai ngang đế trấu tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'DÉP NỮ ZUCIA QUAI NGANG ĐẾ TRẤU.webp', 10),
(48, 'DÉP NỮ PEACH BLUSH CALVIN KLEIN', 13, 17, 60, 1090000, 10, '<p><strong>Calvin Klein</strong> l&agrave; một trong những thương hiệu thời trang h&agrave;ng đầu tr&ecirc;n thế giới được nh&agrave; thiết kế c&ugrave;ng t&ecirc;n Calvin Richard Klein th&agrave;nh lập năm 1968. Calvin Klein lu&ocirc;n cải tiến v&agrave; đi đầu trong c&ocirc;ng nghệ v&agrave; chất liệu để nhằm mang đến cho kh&aacute;ch h&agrave;ng những sản phẩm thời trang cao cấp với chất lượng tốt nhất.</p>\r\n\r\n<p>N&acirc;ng tầm phong c&aacute;ch bằng những d&ograve;ng phụ kiện nổi bật với xu hướng mới từ thương hiệu Calvin Klein, tạo điểm nhấn ấn tượng cho c&aacute;c outfit ho&agrave;n hảo c&ugrave;ng t&uacute;i x&aacute;ch, v&iacute;, d&acirc;y nịt, mắt k&iacute;nh, gi&agrave;y thời trang cho cả nam v&agrave; nữ.</p>\r\n\r\n<p><em><strong>M&agrave;u Sắc:</strong></em>&nbsp;&nbsp; &nbsp;PEACH BLUSH<br />\r\n<em><strong>Chất liệu:</strong></em>&nbsp;&nbsp; &nbsp;100% Recycled Cotton<br />\r\nD&eacute;p nữ Peach Blush Calvin Klein &nbsp;tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'DÉP NỮ CALVIN KLEIN PEACH BLUSH.webp', 10),
(49, 'DÉP QUAI NGANG NỮ - RẼ DOUBLE BUCKLE SLIDE ', 13, 17, 65, 1599000, 9, '<p><strong>M&agrave;u Sắc:&nbsp;</strong>&nbsp; &nbsp;WHITE TEXTURE<br />\r\n<strong>Chất liệu:</strong>&nbsp;&nbsp; &nbsp;Lining: 100% Non Leather Outsole: 100% Polyethylene Vinyl Acetate Upper: 100% Non Leather<br />\r\nD&eacute;p quai ngang nữ - rẽ Double Buckle Slide tại <em><strong>CAYKHEShose </strong></em>được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'DÉP QUAI NGANG NỮ - RẼ DOUBLE BUCKLE SLIDE.webp', 10),
(50, 'DÉP ĐI TRONG NHÀ - FUR SLIDE SLIPPER', 13, 17, 40, 1590000, 20, '<p><strong>D&Eacute;P ĐI TRONG NH&Agrave; - FUR SLIDE SLIPPER</strong></p>\r\n\r\n<p><strong>M&agrave;u Sắc :</strong>&nbsp; &nbsp;GARDENIA<br />\r\n<strong>Chất liệu&nbsp; :&nbsp;</strong> Interior: 100% Polyester Lining: 100% Polyester Outsole: 100% Poly Vinyl Chloride (PVC) Upper: 100% Polyester.<br />\r\nD&eacute;p đi trong nh&agrave; - Fur Slide Slipper tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'DÉP ĐI TRONG NHÀ - FUR SLIDE SLIPPER.webp', 10),
(51, 'GIÀY NIKE PRECISION 5 NAM - XÁM', 14, 18, 75, 1999000, 10, '<p><em><strong>Gi&agrave;y Nike Precision 5</strong></em> một mẫu gi&agrave;y sneaker Nike l&agrave;m bằng chất liệu cao cấp v&agrave; c&ocirc;ng nghệ đỉnh cao sẽ l&agrave; một lựa chọn tuyệt vời của c&aacute;c t&iacute;n đồ sneaker.</p>\r\n\r\n<p>Gi&agrave;y Nike Precision 5 &nbsp;tại <strong>CAYKHEShose</strong> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n\r\n<p><img alt=\"\" src=\"/admin/uploads/files/GI%C3%80Y%20NIKE%20PRECISION%205%20NAM%20-%20X%C3%81M.jpg\" style=\"height:270px; width:270px\" /></p>\r\n', 'GIÀY NIKE PRECISION 5 NAM - XÁM.jpg', 10),
(52, 'GIÀY NIKE COURT ROYALE NAM - TRẮNG XANH', 14, 18, 80, 1678000, 10, '<p><em><strong>Gi&agrave;y Nike Court Royale </strong>l&agrave; mẫu gi&agrave;y với thiết kế lấy cảm hứng từ thập ni&ecirc;n 70 với những n&eacute;t cổ điển mang phong c&aacute;ch đường phố đặc trưng. Với chất liệu da cao cấp v&agrave; đến cao su nguy&ecirc;n chất khiến đ&ocirc;i gi&agrave;y bền bỉ với thời gian.</em></p>\r\n\r\n<p>Gi&agrave;y Nike Court Royale tại CAYKHEShose được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n\r\n<p><img alt=\"\" src=\"/admin/uploads/files/GI%C3%80Y%20NIKE%20COURT%20ROYALE%20NAM%20-%20TR%E1%BA%AENG%20XANH.jpg\" style=\"height:270px; width:270px\" /><br />\r\n&nbsp;</p>\r\n', 'GIÀY NIKE COURT ROYALE NAM - TRẮNG XANH.jpg', 10),
(53, 'GIÀY NIKE KD TREY 5 IX EP NAM - XÁM', 14, 18, 85, 2350000, 15, '<p><em><strong>Gi&agrave;y Nike KD Trey 5 IX EP</strong></em> một mẫu gi&agrave;y sneaker Nike kết hợp với si&ecirc;u sao b&oacute;ng rổ Kevin Durant, với những chất liệu cao cấp v&agrave; c&ocirc;ng nghệ đỉnh cao Nike KD Trey 5 IX EP sẽ l&agrave; một lựa chọn kh&oacute; c&oacute; thể bỏ qua của c&aacute;c t&iacute;n đồ sneaker.</p>\r\n\r\n<p>Gi&agrave;y Nike KD Trey 5 IX EP &nbsp;tại<em><strong> CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY NIKE KD TREY 5 IX EP NAM - XÁM.jpg', 10),
(54, 'GIÀY PUMA RBD GAME LOW NAM - TRẮNG XANH LÁ', 14, 18, 60, 1999000, 0, '<p><em><strong>Gi&agrave;y Puma RBD Game Low</strong></em> mẫu gi&agrave;y c&oacute; thiết kế cổ điển m&agrave; tinh tế. Chất liệu da cao cấp v&agrave; đế cao su bền bỉ chắc chắn sẽ l&agrave;m h&agrave;i l&ograve;ng những kh&aacute;ch h&agrave;ng kh&oacute; t&iacute;nh nhất. Bạn sẽ lu&ocirc;n y&ecirc;n t&acirc;m rằng n&oacute; kh&ocirc;ng bao giờ bị lỗi mốt.</p>\r\n\r\n<p>Gi&agrave;y Puma RBD Game Low tại <em><strong>CAYKHEShose </strong></em>được nhập khẩu ch&iacute;nh h&atilde;ng Full box, đầy đủ phụ kiện.</p>\r\n\r\n<p><img alt=\"\" src=\"/admin/uploads/files/puma1.jpg\" style=\"height:270px; width:270px\" /></p>\r\n', 'GIÀY PUMA RBD GAME LOW NAM - TRẮNG XANH LÁ.jpg', 10),
(55, 'GIÀY ADIDAS RUNFALCON 3.0 NAM - ĐEN TRẮNG', 14, 18, 65, 1890000, 0, '<p><em><strong>Gi&agrave;y Adidas RunFalcon 3.0</strong></em> <em>l&agrave; mẫu gi&agrave;y thể thao mới nhất của adidas. Với thiết kế trẻ trung, khỏe khoắn, &ocirc;m s&aacute;t b&agrave;n ch&acirc;n. Đế gi&agrave;y cloud si&ecirc;u nhẹ v&agrave; &ecirc;m &aacute;i gi&uacute;p bạn di chuyển cả ng&agrave;y m&agrave; kh&ocirc;ng mệt mỏi.</em></p>\r\n\r\n<p>Ngo&agrave;i ra, Adidas RunFalcon 3.0 lại c&oacute; mức gi&aacute; rất hợp l&yacute; d&agrave;nh cho tất cả mọi người.</p>\r\n\r\n<p>Gi&agrave;y Adidas RunFalcon 3.0 tại <em>CAYKHEShose</em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY ADIDAS RUNFALCON 3.0 NAM - ĐEN TRẮNG.jpg', 10),
(56, 'GIÀY HORSEBIT LOAFER DA BÒ PHOM TRÒN HLF19', 14, 19, 70, 3499000, 0, '<p><strong>GI&Agrave;Y HORSEBIT LOAFER DA B&Ograve; PHOM TR&Ograve;N HLF19</strong></p>\r\n\r\n<p>❖ Chất liệu: Da b&ograve; nguy&ecirc;n tấm</p>\r\n\r\n<p>❖ Đế: Cao su cao cấp</p>\r\n\r\n<p>Gi&agrave;y Horsebit loafer da b&ograve; phom tr&ograve;n Hlf19 tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n\r\n<p><img alt=\"\" src=\"/admin/uploads/files/GI%C3%80Y%20HORSEBIT%20LOAFER%20DA%20B%C3%92%20PHOM%20TR%C3%92N%20HLF19.jpg\" style=\"height:270px; width:270px\" /><br />\r\n&nbsp;</p>\r\n', 'GIÀY HORSEBIT LOAFER DA BÒ PHOM TRÒN HLF19.jpg', 10),
(57, 'GIÀY BELGIAN LOAFER DA LỘN BLF03', 14, 19, 45, 1999000, 0, '<p><strong>GI&Agrave;Y BELGIAN LOAFER DA LỘN BLF03</strong></p>\r\n\r\n<p>❖ Chất liệu: &nbsp;Da lộn</p>\r\n\r\n<p>❖ Đế: Gỗ ph&iacute;p &eacute;p cao su, kh&acirc;u cấu tr&uacute;c McKay</p>\r\n\r\n<p>Gi&agrave;y Belgian Loafer da lộn BLF03 tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'GIÀY BELGIAN LOAFER DA LỘN BLF03.jpg', 10),
(58, 'GIÀY MODERN DERBY DA BÒ PATENT MÀU ĐEN ĐẾ ĐỐC DF23', 14, 19, 80, 2099000, 0, '<p><strong>GI&Agrave;Y MODERN DERBY DA B&Ograve; PATENT M&Agrave;U ĐEN ĐẾ ĐỐC DF23</strong></p>\r\n\r\n<p>❖ Chất liệu: Da b&ograve; nguy&ecirc;n tấm</p>\r\n\r\n<p>❖ Đế: Cao su đ&uacute;c nguy&ecirc;n khối</p>\r\n\r\n<p><em>Gi&agrave;y Modern Derby da b&ograve; Patent m&agrave;u đen đế đốc DF23</em> tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.<br />\r\n&nbsp;</p>\r\n', 'GIÀY MODERN DERBY DA BÒ PATENT MÀU ĐEN ĐẾ ĐỐC DF23.jpg', 10),
(59, 'GIÀY OXFORD ĐẾ CAO NAM GCLAS997-8-D', 14, 19, 115, 1678000, 0, '<p>Da b&ograve; thật 100%, Tăng chiều cao &nbsp;5-7cm<br />\r\nThiết kế gi&agrave;y cao nam với lớp đệm cao su đ&agrave;n hồi, dễ sử dụng<br />\r\nKiểu d&aacute;ng Oxford buộc d&acirc;y&nbsp;<br />\r\nMũi gi&agrave;y nhọn sang trọng tạo cảm gi&aacute;c gọn v&agrave; d&agrave;i cho đ&ocirc;i ch&acirc;n&nbsp;<br />\r\nĐế cao, l&oacute;t cao su chống trơn trượt&nbsp;<br />\r\nM&agrave;u sắc: Đen<br />\r\nPhối đồ: Dễ d&agrave;ng phối c&ugrave;ng nhiều loại trang phục nơi c&ocirc;ng sở&nbsp;<br />\r\nXuất xứ: Trung Quốc</p>\r\n\r\n<p><em>Gi&agrave;y Oxford đế cao nam GCLAS997-8-D</em> tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY OXFORD ĐẾ CAO NAM GCLAS997-8-D.jpg', 10),
(60, 'GIÀY LƯỜI DA NAM GNLAJD6611-1028-D', 14, 19, 0, 2099000, 0, '<p><strong>Thiết kế phối da hiện đại:</strong> Mặt tr&ecirc;n l&agrave;m từ da c&aacute; đuối, m&aacute; gi&agrave;y l&agrave;m bằng da b&ograve;<br />\r\nThiết kế mũi nhọn hiện đại, thời thượng<br />\r\nHọa tiết in h&igrave;nh quả tr&aacute;m sang trọng<br />\r\n<strong>M&agrave;u sắc:</strong> đen<br />\r\n<strong>Phối đồ:</strong> Dễ d&agrave;ng phối c&ugrave;ng nhiều loại trang phục nơi c&ocirc;ng sở&nbsp;</p>\r\n\r\n<p><em>Gi&agrave;y lười da nam GNLAJD6611-1028-D</em> tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY LƯỜI DA NAM GNLAJD6611-1028-D.jpg', 10),
(61, 'DÉP SANDAL NAM PIERE CARDIN - PCMFWLE 135', 14, 20, 35, 990000, 8, '<p><strong>Sandal Nam Pierre Cardin - PCMFWLE 135 </strong>c&oacute; thiết kế 2 quai ngang tối giản, đường may nổi tinh tế. Phần quai sau c&oacute; độ d&agrave;y vừa phải, với kh&oacute;a c&agrave;i bằng kim loại chắc chắn. Từ đ&oacute; tăng th&ecirc;m phần vững v&agrave;ng cho từng bước đi. Đặc biệt, đế gi&agrave;y c&oacute; 1 phần l&agrave;m bằng da, mang đến sự sang trọng cho Qu&yacute; Kh&aacute;ch h&agrave;ng. Với thiết kế vừa lịch sự vừa tiện dụng, Sandal sẽ ph&ugrave; hợp cho phong c&aacute;ch dạo phố, đi cafe hoặc d&atilde; ngoại. &nbsp;</p>\r\n\r\n<p><em>Pierre Cardin Paris Vietnam</em> l&agrave; thương hiệu thời trang cao cấp đến từ Ph&aacute;p - HỆ THỐNG GI&Agrave;Y T&Acirc;Y &amp; PHỤ KIỆN DA SỐ 1 VIỆT NAM; <em><strong>CAYKHEShose</strong></em> cam kết đem đến cho Qu&yacute; Kh&aacute;ch h&agrave;ng những trải nghiệm tốt nhất về sản phẩm thời trang h&agrave;ng hiệu.</p>\r\n', 'DÉP SANDAL NAM PIERE CARDIN - PCMFWLE 135.webp', 10),
(62, 'DÉP SANDAL NAM CẤP PIERE CARDIN - PCMFWLE 136', 14, 20, 70, 1678000, 0, '<p><em><strong>Sandal Nam Cao Cấp Pierre Cardin - PCMFWLE 136</strong></em> l&agrave; đ&ocirc;i gi&agrave;y &ldquo;si&ecirc;u chắc chắn&rdquo; với phần quai trước bản to, kết hợp c&ugrave;ng quai sau v&agrave; kh&oacute;a c&agrave;i. Qu&yacute; Kh&aacute;ch h&agrave;ng cũng sẽ kh&ocirc;ng lo bị b&iacute; b&aacute;ch đ&ocirc;i ch&acirc;n nhờ v&agrave;o lỗ tho&aacute;t kh&iacute; hai b&ecirc;n gi&agrave;y.</p>\r\n\r\n<p><em>Pierre Cardin Paris Vietnam</em> l&agrave; thương hiệu thời trang cao cấp đến từ Ph&aacute;p - HỆ THỐNG GI&Agrave;Y T&Acirc;Y &amp; PHỤ KIỆN DA SỐ 1 VIỆT NAM; <em><strong>CAYKHEShose</strong></em> cam kết đem đến cho Qu&yacute; Kh&aacute;ch h&agrave;ng những trải nghiệm tốt nhất về sản phẩm thời trang h&agrave;ng hiệu.</p>\r\n', 'DÉP SANDAL NAM CẤP PIERE CARDIN - PCMFWLE 136.jpg', 10),
(63, 'DÉP SANDAL NAM CẤP PIERE CARDIN - PCMFWLE 127', 14, 20, 105, 1990000, 7, '<p><strong>D&eacute;p Nam Pierre Cardin - PCMFWLG 127</strong> l&agrave; lựa chọn &ldquo;2 trong 1&rdquo; d&agrave;nh cho Qu&yacute; Kh&aacute;ch h&agrave;ng. Phần quai sau c&oacute; thể trở th&agrave;nh quai gi&agrave;y sandal. Hoặc được gạt l&ecirc;n để biến th&agrave;nh một đ&ocirc;i d&eacute;p tiện lợi. Với thiết kế đa năng n&agrave;y, Qu&yacute; Kh&aacute;ch h&agrave;ng c&oacute; thể mang d&eacute;p trong những chuyến d&atilde; ngoại, du lịch, dạo phố. D&eacute;p được l&agrave;m từ da b&ograve; nhập khẩu 100%, rất bền chắc khi sử dụng. Đế cao su b&aacute;m d&iacute;nh chống trơn trượt khi sử dụng.</p>\r\n\r\n<p><em><strong>Pierre Cardin Paris Vietnam</strong></em> l&agrave; thương hiệu thời trang cao cấp đến từ Ph&aacute;p - HỆ THỐNG GI&Agrave;Y T&Acirc;Y SỐ 1 VIỆT NAM; <em><strong>CAYKHEShose</strong></em> cam kết đem đến cho Qu&yacute; Kh&aacute;ch h&agrave;ng những trải nghiệm tốt nhất về sản phẩm thời trang h&agrave;ng hiệu.</p>\r\n', 'PCMFWLE 127_1.webp', 10),
(64, 'DÉP SANDAL NAM CẤP PIERE CARDIN - PCMFWLE 142', 14, 20, 80, 1090000, 0, '<p><strong>D&eacute;p Nam Cao Cấp Pierre Cardin - PCMFWLG 142</strong> l&agrave; đ&ocirc;i d&eacute;p kẹp kh&ocirc;ng thể thiếu trong tủ gi&agrave;y, bởi t&iacute;nh tiện dụng của n&oacute;. D&eacute;p Pierre Cardin được l&agrave;m từ chất da b&ograve; thật, đế cao su si&ecirc;u b&aacute;m d&iacute;nh gi&uacute;p Qu&yacute; Kh&aacute;ch vững v&agrave;ng khi di chuyển.&nbsp;</p>\r\n\r\n<p>D&eacute;p c&oacute; đường chỉ nhấn tr&ecirc;n quai - tạo điểm nhấn trẻ trung. Qu&yacute; Kh&aacute;ch h&agrave;ng c&oacute; thể mang d&eacute;p trong mọi hoạt động h&agrave;ng ng&agrave;y, hoặc trong c&aacute;c chuyến đi d&atilde; ngoại, du lịch.&nbsp;</p>\r\n\r\n<p><em>Pierre Cardin Paris Vietnam</em> l&agrave; thương hiệu thời trang cao cấp đến từ Ph&aacute;p - HỆ THỐNG GI&Agrave;Y T&Acirc;Y &nbsp;&amp; PHỤ KIỆN DA SỐ 1 VIỆT NAM; <em><strong>CAYKHEShose</strong></em> cam kết đem đến cho Qu&yacute; Kh&aacute;ch h&agrave;ng những trải nghiệm tốt nhất về sản phẩm thời trang h&agrave;ng hiệu.</p>\r\n', 'DÉP SANDAL NAM CẤP PIERE CARDIN - PCMFWLE 142.jpg', 10),
(65, 'DÉP SANDAL NAM CẤP PIERE CARDIN - PCMFWLE 130', 14, 20, 55, 890000, 0, '<p><strong>D&eacute;p Nam Pierre Cardin - PCMFWLG 130 </strong>c&oacute; thiết kế quai ch&eacute;o đơn giản, chắc chắn v&agrave; tho&aacute;ng m&aacute;t. D&eacute;p được l&agrave;m từ da b&ograve; nhập khẩu 100%, đế cao su b&aacute;m d&iacute;nh chống trơn trượt. B&ecirc;n cạnh đ&oacute;, thiết kế logo Pierre Cardin c&ugrave;ng đường may chữ T tinh tế tr&ecirc;n quai d&eacute;p l&agrave; điểm nhấn th&uacute; vị. &nbsp;</p>\r\n\r\n<p><em>Pierre Cardin Paris Vietnam </em>l&agrave; thương hiệu thời trang cao cấp đến từ Ph&aacute;p - HỆ THỐNG GI&Agrave;Y T&Acirc;Y SỐ 1 VIỆT NAM; <em><strong>CAYKHEShose</strong></em> cam kết đem đến cho Qu&yacute; Kh&aacute;ch h&agrave;ng những trải nghiệm tốt nhất về sản phẩm thời trang h&agrave;ng hiệu.</p>\r\n', 'PCMFWLE 130_1.webp', 10),
(66, 'DÉP NAM QUAI NGANG CAO CẤP KEEDO KDX15', 14, 21, 60, 699000, 0, '<p><strong>Xuất xứ : </strong>Made in &nbsp;Vietnam<br />\r\n<strong>Chất liệu:</strong> Đế cao su chống trơn trợt, quai da tổng hợp may viền chỉ chắc chắn<br />\r\n<strong>Thiết k&ecirc;:</strong> Kiểu d&aacute;ng năng động hợp phong c&aacute;ch giới trẻ<br />\r\n<strong>Bảo h&agrave;nh:</strong> 6 Th&aacute;ng<br />\r\n<em>D&eacute;p nam quai ngang cao cấp KEEDO KDX15</em> tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'KEEDO KDX15_4.jpg', 10),
(67, 'DÉP NAM QUAI NGANG CAO CẤP KEEDO KDX13', 14, 21, 65, 999000, 0, '<p><strong>Xuất xứ :</strong> Made in &nbsp;Vietnam<br />\r\n<strong>Chất liệu:</strong> Đế cao su chống trơn trợt, quai da tổng hợp may viền chỉ chắc chắn<br />\r\n<strong>Thiết k&ecirc;: </strong>Kiểu d&aacute;ng năng động hợp phong c&aacute;ch giới trẻ<br />\r\n<strong>Bảo h&agrave;nh:</strong> 6 Th&aacute;ng<br />\r\n<em>D&eacute;p nam quai ngang cao cấp KEEDO KDX13</em> tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.<br />\r\n&nbsp;</p>\r\n', 'DÉP NAM QUAI NGANG CAO CẤP KEEDO KDX13.jpg', 10),
(68, 'DÉP NAM QUAI NGANG CAO CẤP KEEDO KDX05', 14, 21, 70, 990000, 9, '<p><strong>Xuất xứ</strong> : Made in &nbsp;Vietnam<br />\r\n<strong>Chất liệu:</strong> Đế cao su chống trơn trợt, quai da tổng hợp may viền chỉ chắc chắn<br />\r\nThiết k&ecirc;: Kiểu d&aacute;ng năng động hợp phong c&aacute;ch giới trẻ<br />\r\n<strong>Bảo h&agrave;nh: </strong>6 Th&aacute;ng<br />\r\n<em>D&eacute;p nam quai ngang cao cấp KEEDO KDX05</em> tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'DÉP NAM QUAI NGANG CAO CẤP KEEDO KDX05.jpg', 10),
(69, 'DÉP NAM QUAI NGANG CAO CẤP KEEDO Y-814', 14, 21, 75, 1599000, 10, '<p><strong>Xuất xứ :</strong> Made in &nbsp;Vietnam<br />\r\n<strong>Chất liệu:</strong> Đế cao su chống trơn trợt, quai da tổng hợp may viền chỉ chắc chắn<br />\r\n<strong>Thiết kế:</strong> Kiểu d&aacute;ng năng động hợp phong c&aacute;ch giới trẻ<br />\r\n<strong>Bảo h&agrave;nh:</strong> 6 Th&aacute;ng<br />\r\n<em>D&eacute;p nam quai ngang cao cấp KEEDO Y-814</em> tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.<br />\r\n&nbsp;</p>\r\n', 'DÉP NAM QUAI NGANG CAO CẤP KEEDO Y-814.jpg', 10),
(70, 'DÉP ĐẾ MAY SẴN DA BÒ QUAI NGANG CAO CẤP KEEDO TL-204', 14, 21, 50, 699000, 0, '<p><strong>Xuất xứ :</strong> Made in &nbsp;Vietnam<br />\r\n<strong>Chất liệu:</strong> Đế cao su nguy&ecirc;n chất chống trơn trợt, quai da b&ograve; thật 100% si&ecirc;u bền.<br />\r\n<strong>Thiết kế:</strong> May quai v&agrave; đế rất chắc chắn. Kiểu d&aacute;ng ph&ugrave; hợp phong c&aacute;ch giới trẻ<br />\r\n<strong>Bảo h&agrave;nh:</strong> 6 Th&aacute;ng<br />\r\n<em>D&eacute;p đế may sẵn da b&ograve; quai ngang cao cấp KEEDO TL-204</em> tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.&nbsp;</p>\r\n', 'DÉP ĐẾ MAY SẴN DA BÒ QUAI NGANG CAO CẤP KEEDO TL-204.jpg', 10),
(71, 'DÉP ĐẾ MAY SẴN DA BÒ QUAI NGANG CAO CẤP KEEDO TL-080', 14, 21, 85, 1599000, 0, '<p><strong>Xuất xứ : </strong>Made in &nbsp;Vietnam<br />\r\n<strong>Chất liệu:</strong> Đế cao su nguy&ecirc;n chất chống trơn trợt, quai da b&ograve; thật 100% si&ecirc;u bền.<br />\r\n<strong>Thiết kế:</strong> May quai v&agrave; đế rất chắc chắn. Kiểu d&aacute;ng ph&ugrave; hợp phong c&aacute;ch giới trẻ<br />\r\n<strong>Bảo h&agrave;nh:</strong> 6 Th&aacute;ng</p>\r\n\r\n<p><em>D&eacute;p đế may sẵn da b&ograve; quai ngang cao cấp KEEDO TL-080 </em>tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'DÉP ĐẾ MAY SẴN DA BÒ QUAI NGANG CAO CẤP KEEDO TL-080.jpg', 10),
(72, 'DÉP HAI QUAI NGANG KEEDO - KD0508', 14, 21, 60, 499000, 0, '<p><strong>Xuất xứ :</strong> Made in &nbsp;Vietnam<br />\r\n<strong>Chất liệu:</strong> Đế cao su nguy&ecirc;n chất chống trơn trợt. Quai vải kết hợp da tổng hợp cao cấp.<br />\r\n<strong>Thiết k&ecirc;</strong>: Kiểu d&aacute;ng năng động hợp phong c&aacute;ch giới trẻ<br />\r\n<strong>Bảo h&agrave;nh:</strong> 6 Th&aacute;ng<br />\r\n<em>D&eacute;p Hai Quai Ngang KEEDO-KD0508</em> tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.<br />\r\n&nbsp;</p>\r\n', 'KD0508_1.jpg', 10),
(73, 'DÉP QUAI NGANG CHỮ H DA BÒ THẬT KEEDO T143 FULL BOX', 14, 21, 65, 699000, 0, '<p><em>Thiết kế đơn giản thời trang được l&agrave;m thủ c&ocirc;ng với b&agrave;n tay đi&ecirc;u luyện của những nghệ nh&acirc;n c&oacute; kinh nghiệm d&agrave;y dặn trong nghề</em><br />\r\n<strong>Chất liệu:</strong> Đế cao su nguy&ecirc;n chất chống trơn trợt, quai da b&ograve; thật.<br />\r\n<strong>Thiết kế:</strong> Kiểu d&aacute;ng năng động hợp phong c&aacute;ch giới trẻ<br />\r\n<strong>Bảo h&agrave;nh:</strong> 12 th&aacute;ng<br />\r\n<em>D&eacute;p quai ngang chữ H da b&ograve; thật KEEDO T143 Full box</em> tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'DÉP QUAI NGANG CHỮ H DA BÒ THẬT KEEDO T143 FULL BOX.jpg', 10),
(74, 'SANDAL VENTO NAM CHÍNH HÃNG XUẤT KHẨU NHẬT NV - 1001', 14, 20, 70, 790000, 0, '<p><strong>Xuất xứ :</strong> H&agrave;ng VNXK<br />\r\n<strong>Chất liệu:</strong> Đế cao su nguy&ecirc;n chất chống trơn trợt. Thoải m&aacute;i đi mưa đi biển.<br />\r\n<strong>Thiết kế:</strong> Kiểu d&aacute;ng năng động hợp phong c&aacute;ch giới trẻ<br />\r\n<em>Sandal Vento nam ch&iacute;nh h&atilde;ng xuất khẩu nhật NV-1001</em> tại <strong><em>CAYKHEShose</em></strong> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.<br />\r\n&nbsp;</p>\r\n', 'VENTO_2.jpg', 10),
(75, 'GIÀY QUAI HẬU VENTO CHÍNH HÃNG NB01', 14, 20, 45, 790000, 0, '<p><strong>Xuất xứ : </strong>H&agrave;ng VNXK<br />\r\n<strong>Chất liệu:</strong> Đế cao su nguy&ecirc;n chất chống trơn trợt. Thoải m&aacute;i đi mưa đi biển.<br />\r\n<strong>Thiết kế:</strong> Kiểu d&aacute;ng năng động hợp phong c&aacute;ch giới trẻ<br />\r\n<em>Gi&agrave;y quai hậu Vento ch&iacute;nh h&atilde;ng NB01</em> tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.<br />\r\n&nbsp;</p>\r\n', 'NB01_3.jpg', 10),
(76, 'SANDAL ADIDAS ADILETTE', 14, 20, 80, 3499000, 6, '<p><strong>Xuất xứ :</strong> VNXK<br />\r\n<strong>Thiết kế:</strong> Trẻ trung, năng động dễ d&agrave;ng mang v&agrave;o th&aacute;o ra<br />\r\n<em>Sandal adidas adilette</em> tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'SANDAL ADIDAS ADILETTE.jpg', 10),
(77, 'SANDAL NAM CHÍNH HÃNG KEEDO KDA01', 16, 23, 85, 1890000, 0, '<p>Thiết kế đơn giản thời trang được l&agrave;m thủ c&ocirc;ng với b&agrave;n tay đi&ecirc;u luyện của những nghệ nh&acirc;n c&oacute; kinh nghiệm d&agrave;y dặn trong nghề</p>\r\n\r\n<p><strong>Chất liệu:</strong> Đế Fylon chống trơn trợt, quai d&ugrave; cao cấp<br />\r\n<strong>Thiết kế:</strong> Kiểu d&aacute;ng năng động, đi học, đi chơi&hellip;<br />\r\n<strong>Bảo h&agrave;nh:</strong> 6 th&aacute;ng<br />\r\n<em>Sandal nam ch&iacute;nh h&atilde;ng KEEDO KDA01</em> tại <em><strong>CAYKHEShose </strong></em>được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.<br />\r\n&nbsp;</p>\r\n', 'SANDAL NAM CHÍNH HÃNG KEEDO KDA01.jpg', 10),
(78, 'GIÀY NIKE E-SERIES 1.0 NAM - NÂU', 16, 23, 60, 3499000, 20, '<p><em>Gi&agrave;y Nike E-Series 1.0 mẫu gi&agrave;y thời trang được Nike vừa ra mắt. Với thiết kế đơn giản nhưng sang trọng v&agrave; c&oacute; t&iacute;nh ứng dụng rất cao trong mọi hoạt động h&agrave;ng ng&agrave;y. Đ&acirc;y l&agrave; mẫu gi&agrave;y hứa hẹn sẽ l&agrave;m mưa l&agrave;m gi&oacute; của Nike trong năm nay.</em></p>\r\n\r\n<p>Phần upper được l&agrave;m từ chất liệu chất liệu đặc biệt c&oacute; mềm &ecirc;m tho&aacute;ng kh&iacute;, phần đế giữa chất liệ froam &ecirc;m &aacute;i, đế ngo&agrave;i chất liệu cao su bền chắc. Một mẫu gi&agrave;y hột tụ đủ c&aacute;c yếu tố cao cấp từ chất liệu, c&ocirc;ng nghệ v&agrave; thiết kế.</p>\r\n\r\n<p><em>Gi&agrave;y Nike E-Series 1.0 </em>tại <em><strong>CAYKHEShose </strong></em>được ph&acirc;n phối ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY NIKE E-SERIES 1.0 NAM - NÂU.jpg', 10),
(79, 'GIÀY NIKE DUNK HI RETRO NAM - NÂU TRẮNG', 16, 23, 65, 2099000, 0, '<p><em>Gi&agrave;y Nike Dunk Hi Retro l&agrave; d&ograve;ng gi&agrave;y sneaker rất được y&ecirc;u th&iacute;ch của Nike tr&ecirc;n to&agrave;n thế giới. Với thiết kế đơn giản nhưng đẹp mắt kh&ocirc;ng bao giờ lỗi mốt, Nike Dunk Hi Retro chắc chắn l&agrave; đ&ocirc;i gi&agrave;y kh&ocirc;ng thể thiếu với c&aacute;c t&iacute;n đồ sneaker.</em><br />\r\nPhần upper của gi&agrave;y được l&agrave;m từ chất liệu da cao cấp kết hợp với canvas si&ecirc;u bền, đế gi&agrave;y l&agrave;m bằng cao su nguy&ecirc;n chất cực kỳ bền chắc. Đ&acirc;y ch&iacute;nh l&agrave; một trong những mẫu gi&agrave;y được săn đ&oacute;n tr&ecirc;n to&agrave;n cầu mỗi khi ra mắt.</p>\r\n\r\n<p><em>Gi&agrave;y Nike Dunk Hi Retro</em> tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.<br />\r\n&nbsp;</p>\r\n', 'GIÀY NIKE DUNK HI RETRO NAM - NÂU TRẮNG.jpg', 10),
(80, 'GIÀY CAO GÓT MŨI NHỌN BN0167', 16, 23, 40, 2350000, 0, '<p><strong>M&atilde; SP</strong>&nbsp;&nbsp; &nbsp;BN0167<br />\r\n<strong>Chất liệu</strong>&nbsp;&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t</strong>&nbsp;&nbsp; &nbsp;6 cm<br />\r\n<strong>D&ograve;ng&nbsp;&nbsp;</strong> &nbsp;Văn ph&ograve;ng, Đi chơi<br />\r\n- Thiết kế mũi nhọn phối quai mảnh đơn giản nhưng kh&ocirc;ng k&eacute;m phần thanh lịch.<br />\r\n- G&oacute;t trụ 6cm chắc chắn, dễ di chuyển v&agrave; ph&ugrave; hợp với nhiều dịp như đi l&agrave;m, đi chơi, đi tiệc,...<br />\r\n- Đế cao su chống trơn trợt gi&uacute;p n&agrave;ng tự tin với mỗi bước đi.<br />\r\n- Gam m&agrave;u hiện đại, dễ d&agrave;ng kết hợp nhiều trang phục.<br />\r\n&nbsp;</p>\r\n', 'BN0167_1.jpg', 10),
(81, 'GIÀY CAO GÓT MŨI NHỌN CAO CẤP JEREMY BN0002', 16, 23, 75, 1678000, 0, '<p><strong>M&atilde; SP&nbsp;</strong>&nbsp; &nbsp;BN0002<br />\r\n<strong>Chất liệu&nbsp;&nbsp;</strong> &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t&nbsp;</strong>&nbsp; &nbsp;Tr&ecirc;n 10 cm<br />\r\n<strong>D&ograve;ng&nbsp;&nbsp;</strong> &nbsp;Casual<br />\r\n- Gi&agrave;y thiết kế mũi nhọn đơn giản nhưng kh&ocirc;ng k&eacute;m phần sang trọng, thanh lịch.<br />\r\n- Chất liệu da b&oacute;ng tạo hiệu ứng tr&aacute;ng gương sang trọng.<br />\r\n- Đế trụ chắc chắn, đế cao su chống trơn trợt gi&uacute;p n&agrave;ng tự tin trong mỗi bước đi.<br />\r\n- Thiết kế đơn giản, kh&ocirc;ng bị lỗi mốt v&agrave; ph&ugrave; hợp với nhiều dịp v&agrave; sự kiện.<br />\r\n&nbsp;</p>\r\n', 'GIÀY CAO GÓT MŨI NHỌN CAO CẤP JEREMY BN0002.jpg', 10),
(82, 'GIÀY SANDAL ĐẾ BỆT PHỐI NƠ KIM TUYẾN SK0057', 16, 23, 80, 990000, 0, '<p><strong>M&atilde; SP</strong>&nbsp;&nbsp; &nbsp;SK0057<br />\r\n<strong>Chất liệu&nbsp;&nbsp;</strong> &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t&nbsp;&nbsp;</strong> &nbsp;Dưới 5 cm<br />\r\n- Thiết kế b&iacute;t mũi thanh lịch v&agrave; sang trọng với đế bệt tiện dụng dễ d&agrave;ng di chuyển.<br />\r\n- Họa tiết nơ kim tuyến nổi bật v&ocirc; c&ugrave;ng xinh xắn.<br />\r\n- Gam m&agrave;u trẻ trung v&agrave; nữ t&iacute;nh dễ kết hợp c&ugrave;ng trang phục v&agrave; phụ kiện.<br />\r\n&nbsp;</p>\r\n', 'GIÀY SANDAL ĐẾ BỆT PHỐI NƠ KIM TUYẾN SK0057.jpg', 10),
(83, 'GIÀY TÂY NEWGEN LOAFER - LF01', 16, 23, 85, 1890000, 0, '<ul>\r\n	<li><strong>Da ngo&agrave;i (Upper):</strong> Da B&ograve; &Yacute;</li>\r\n	<li><strong>L&oacute;t trong (Sock Lining)</strong>: Da B&ograve; thuộc Thảo Mộc</li>\r\n	<li><strong>Cấu tr&uacute;c (Construction): </strong>McKAY</li>\r\n	<li><strong>Đế (Outsole): </strong>Đế Cao Su&nbsp;</li>\r\n	<li><strong>Size (EU):</strong> 38 39 40 41 42 43 44 45</li>\r\n	<li>S<strong>ản phẩm được bảo h&agrave;nh</strong>: 3 NĂM</li>\r\n</ul>\r\n\r\n<p>Những Qu&yacute; &Ocirc;ng đến chọn gi&agrave;y T&acirc;y của CAYKHEShose. Họ đều kh&aacute; c&oacute; gu, mỗi người mỗi gu nhất định. C&oacute; người th&iacute;ch lịch thiệp n&ecirc;n chọn Oxford, người chọn Loafer v&igrave; trẻ trung,... v&agrave; c&ograve;n rất nhiều.</p>\r\n', 'GIÀY TÂY NEWGEN LOAFER - LF01.webp', 10),
(84, 'GIÀY SANDAL BÁNH MÌ QUAI CHÉO SK0058', 16, 23, 60, 1678000, 6, '<p><strong>M&atilde; SP&nbsp;</strong>&nbsp; &nbsp;SK0058<br />\r\n<strong>Chất liệu&nbsp;</strong>&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t</strong>&nbsp;&nbsp; &nbsp;4 cm<br />\r\n- Thiết kế đế b&aacute;nh m&igrave; trẻ trung kết hợp quai ch&eacute;o năng động v&agrave; c&aacute; t&iacute;nh.<br />\r\n- Chất liệu da mềm, quai chần b&ocirc;ng &ecirc;m &aacute;i gi&uacute;p n&agrave;ng thoải m&aacute;i vận động v&agrave; di chuyển.<br />\r\n- M&agrave;u sắc đa dạng, hợp thời trang. Mũi gi&agrave;y cao 2cm.<br />\r\n&nbsp;</p>\r\n', 'GIÀY SANDAL BÁNH MÌ QUAI CHÉO SK0058.jpg', 10),
(85, 'DÉP XẸP QUAI ĐAN DX0062', 13, 17, 65, 790000, 0, '<p><strong>M&atilde; SP</strong>&nbsp;&nbsp; &nbsp;DX0062<br />\r\n<strong>Chất liệu&nbsp;</strong>&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t&nbsp;</strong>&nbsp; &nbsp;1 cm<br />\r\n<strong>D&ograve;ng&nbsp;&nbsp;</strong> &nbsp;casual<br />\r\n- D&aacute;ng quai ngang c&aacute;ch điệu đan ch&eacute;o đơn giản, thời trang.<br />\r\n- Đế cao su chống trơn trợt gi&uacute;p n&agrave;ng tự tin với mỗi bước đi.<br />\r\n- Gam m&agrave;u hiện đại, dễ d&agrave;ng kết hợp nhiều trang phục.</p>\r\n', 'DX0062_1.jpg', 10),
(86, 'DÉP XẸP QUAI NGANG CHẦN BÔNG ÊM ÁI DX0070', 13, 17, 70, 1090000, 0, '<p><strong>M&atilde; SP</strong>&nbsp;&nbsp; &nbsp;DX0070<br />\r\n<strong>Chất liệu</strong>&nbsp;&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t&nbsp;</strong>&nbsp; &nbsp;2 cm<br />\r\n- Thiết kế quai ngang v&agrave; d&aacute;ng mũi vu&ocirc;ng đơn giản nhưng kh&ocirc;ng k&eacute;m phần thanh lịch, sang trọng.<br />\r\n- Họa tiết kẻ sọc dập chỉ v&agrave; chần b&ocirc;ng v&ocirc; c&ugrave;ng &ecirc;m &aacute;i, gi&uacute;p n&agrave;ng thoải m&aacute;i di chuyển.<br />\r\n- Gam m&agrave;u trẻ trung, dễ kết hợp c&ugrave;ng nhiều trang phục v&agrave; phụ kiện.<br />\r\n&nbsp;</p>\r\n', 'DX0070_1.jpg', 10),
(87, 'DÉP XẸP QUAI NGANG PHỐI XÍCH KIM LOẠI DX0065', 13, 17, 45, 1490000, 5, '<p><strong>M&atilde; SP</strong>&nbsp;&nbsp; &nbsp;DX0065<br />\r\n<strong>Chất liệu&nbsp;</strong>&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t&nbsp;&nbsp;</strong> &nbsp;1 cm<br />\r\n<strong>D&ograve;ng&nbsp;&nbsp; </strong>&nbsp;Casual<br />\r\n- Với thiết kế quai ngang bản to kết hợp x&iacute;ch kim loại dạng to nổi bật v&agrave; sang trọng, c&aacute; t&iacute;nh.<br />\r\n- Chất da tổng hợp v&acirc;n c&aacute; sấu tinh tế, đẹp mắt.<br />\r\n- Đế bệt 1cm dễ di chuyển v&agrave; &ecirc;m ch&acirc;n.<br />\r\n&nbsp;</p>\r\n', 'DÉP XẸP QUAI NGANG PHỐI XÍCH KIM LOẠI DX0065.jpg', 10),
(88, 'DÉP XẸP QUAI ĐAN CHÉO ĐÍNH CƯỜM DX0067', 13, 17, 80, 2350000, 0, '<p><strong>M&atilde; SP</strong>&nbsp;&nbsp; &nbsp;DX0067<br />\r\n<strong>Chất liệu&nbsp;</strong>&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t&nbsp;</strong>&nbsp; &nbsp;1 cm<br />\r\n<strong>D&ograve;ng&nbsp;</strong>&nbsp; &nbsp;Casual<br />\r\n- Thiết kế quai mảnh đan ch&eacute;o c&aacute;ch điệu đẹp mắt.<br />\r\n- Điểm nhấn bởi chi tiết đ&iacute;nh cườm lấp l&aacute;nh, sang trọng v&agrave; nữ t&iacute;nh.<br />\r\n- Đế cao su chống trơn trợt.<br />\r\n- Gam m&agrave;u hiện đại dễ d&agrave;ng phối trang phục v&agrave; phụ kiện.</p>\r\n', 'DÉP XẸP QUAI ĐAN CHÉO ĐÍNH CƯỜM DX0067.jpg', 10),
(89, 'GIÀY BÚP BÊ MŨI NHỌN PHỐI QUAI XÍCH KIM LOẠI BB0071', 13, 16, 115, 1890000, 9, '<p><strong>M&atilde; SP</strong>&nbsp;&nbsp; &nbsp;BB0071<br />\r\n<strong>Chất liệu&nbsp;</strong>&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t</strong>&nbsp;&nbsp; &nbsp;1 cm<br />\r\n<strong>D&ograve;ng</strong>&nbsp;&nbsp; &nbsp;Casual<br />\r\n- Điểm nhấn bởi họa tiết x&iacute;ch to bản nổi bật v&agrave; đầy c&aacute; t&iacute;nh.<br />\r\n- Thiết kế mũi nhọn cơ bản với đế thấp c&oacute; l&oacute;t đệm &ecirc;m &aacute;i gi&uacute;p n&agrave;ng tự tin di chuyển.<br />\r\n- Gam m&agrave;u cơ bản dễ kết hợp c&ugrave;ng quần &aacute;o v&agrave; phụ kiện.<br />\r\n&nbsp;</p>\r\n', 'BB0071_1.jpg', 10),
(90, 'GIÀY BÚP BÊ MŨI TRÒN ĐÍNH NƠ XINH XẮN BB0072', 13, 16, 0, 999000, 0, '<p><strong>M&atilde; SP</strong>&nbsp;&nbsp; &nbsp;BB0072<br />\r\n<strong>Chất liệu&nbsp;</strong>&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;</strong>t&nbsp;&nbsp; &nbsp;1 cm<br />\r\n- Kiểu d&aacute;ng đơn giản với mũi tr&ograve;n xinh xắn v&agrave; nữ t&iacute;nh.<br />\r\n- Họa tiết nơ da c&ugrave;ng chất liệu vừa giản dị nhưng kh&ocirc;ng k&eacute;m phần nữ t&iacute;nh v&agrave; tinh tế.<br />\r\n- Gam m&agrave;u ngọt ng&agrave;o v&agrave; trẻ trung ph&ugrave; hợp với xu hướng hiện tại.<br />\r\n&nbsp;</p>\r\n', 'BB0072_1.jpg', 10);
INSERT INTO `tbl_product` (`product_id`, `product_name`, `cartegory_id`, `brand_id`, `product_number`, `product_price`, `product_price_new`, `product_desc`, `product_img`, `product_tax`) VALUES
(91, 'GIÀY BÚP BÊ ĐÍNH NƠ ĐƠN GIẢN BB0073', 13, 16, 35, 1899000, 7, '<p><strong>M&atilde; SP&nbsp;</strong>&nbsp; &nbsp;BB0073<br />\r\n<strong>Chất liệu</strong>&nbsp;&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t&nbsp;</strong>&nbsp; &nbsp;1 cm<br />\r\n- Thiết kế mũi vu&ocirc;ng thanh lịch với d&aacute;ng gi&agrave;y đơn giản ph&ugrave; hợp với nhiều nhu cầu sử dụng.<br />\r\n- Họa tiết nơ c&ugrave;ng chất liệu v&agrave; t&ocirc;ng m&agrave;u xinh xắn, t&ocirc;n n&eacute;t nữ t&iacute;nh.<br />\r\n- Gam m&agrave;u cơ bản dễ kết hợp với nhiều trang phục v&agrave; phụ kiện.<br />\r\n&nbsp;</p>\r\n', 'BB0073_1.jpg', 10),
(92, 'GIÀY BÚP BÊ MŨI VUÔNG ĐÍNH NƠ BB0067', 13, 16, 70, 1999000, 0, '<p><strong>M&atilde; SP</strong>&nbsp;&nbsp; &nbsp;BB0067<br />\r\n<strong>Chất liệu&nbsp;</strong>&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;</strong>t&nbsp;&nbsp; &nbsp;2 cm<br />\r\n<strong>D&ograve;ng&nbsp;&nbsp;</strong> &nbsp;Basic<br />\r\n- Thiết kế kiểu d&aacute;ng mũi vu&ocirc;ng đơn giản phối nơ xinh xắn.<br />\r\n- Họa tiết dập chỉ chần b&ocirc;ng mềm mại<br />\r\n- Đế cao su chống trơn trợt gi&uacute;p n&agrave;ng tự tin với mỗi bước đi.<br />\r\n- Gam m&agrave;u cơ bản gi&uacute;p n&agrave;ng dễ d&agrave;ng phối hợp với nhiều loại trang phục</p>\r\n', 'BB0067_1.jpg', 10),
(93, 'GUỐC NHỌN KIỂU DÁNG BASIC ĐÍNH CƯỜM GN0054', 13, 14, 105, 1999000, 9, '<p><strong>M&atilde; SP&nbsp;</strong>&nbsp; &nbsp;GN0054<br />\r\n<strong>Chất liệu&nbsp;</strong>&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t</strong>&nbsp;&nbsp; &nbsp;5 cm<br />\r\n- Guốc nhọn b&iacute;t mũi cơ bản với đế trụ chắc chắn, thanh lịch v&agrave; kh&ocirc;ng bị lỗi mốt.<br />\r\n- Chi tiết đ&iacute;nh cườm sang trọng, s&aacute;ng ch&acirc;n.<br />\r\n- Gam m&agrave;u nữ t&iacute;nh, ngọt ng&agrave;o ph&ugrave; hợp xu hướng thời trang hiện đại.<br />\r\n- Ph&ugrave; hợp với nhiều nhu cầu sử dụng.<br />\r\n&nbsp;</p>\r\n', 'GN0054_1.jpg', 10),
(94, 'GIÀY SANDAL GÓT NHỌN MŨI VUÔNG SN0163', 13, 14, 80, 1999000, 8, '<p><strong>M&atilde; SP</strong>&nbsp;&nbsp; &nbsp;SN0163<br />\r\n<strong>Chất liệu</strong>&nbsp;&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t</strong>&nbsp;&nbsp; &nbsp;9 cm<br />\r\n<strong>D&ograve;ng&nbsp;</strong>&nbsp; &nbsp;Office, Dạo Phố , Party<br />\r\n- Gi&agrave;y thiết kế mũi vu&ocirc;ng đơn giản v&agrave; thanh lịch.<br />\r\n- Điểm nhấn quai ngang c&aacute;ch điệu.<br />\r\n- Chất liệu da b&oacute;ng tạo hiệu ứng tr&aacute;ng gương sang trọng.<br />\r\n- Gam m&agrave;u hiện đại, dễ d&agrave;ng kết hợp nhiều trang phục.<br />\r\n&nbsp;</p>\r\n', 'SN0163_1.jpg', 10),
(95, 'GIÀY CAO GÓT MŨI NHỌN HỌA TIẾT KIM LOẠI BN0162', 13, 14, 55, 899000, 7, '<p><strong>M&atilde; SP</strong>&nbsp;&nbsp; &nbsp;BN0162<br />\r\n<strong>Chất liệu&nbsp;</strong>&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t&nbsp;</strong>&nbsp; &nbsp;5 - 7 cm<br />\r\n- Kiểu d&aacute;ng basic với mũi nhọn cơ bản v&agrave; họa tiết nơ kim loại mảnh thanh lịch, sang trọng.<br />\r\n- Chất liệu da tổng hợp cao cấp với 3 gam m&agrave;u đơn giản rất dễ kết hợp trang phục v&agrave; phụ kiện.<br />\r\n- Chiều cao vừa phải, đế cao su chống trơn trợt gi&uacute;p n&agrave;ng tự tin trong mỗi bước đi.</p>\r\n', 'GIÀY CAO GÓT MŨI NHỌN HỌA TIẾT KIM LOẠI BN0162.jpg', 10),
(96, 'GIÀY SANDAL ĐẾ BỆT QUAI ĐAN CHÉO SK0067', 13, 15, 60, 1999000, 10, '<p><strong>M&atilde; SP&nbsp;&nbsp; </strong>&nbsp;SK0067<br />\r\n<strong>Chất liệu&nbsp;&nbsp; </strong>&nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t&nbsp;</strong>&nbsp; &nbsp;1 cm<br />\r\n- Gi&agrave;y đế bệt tiện dụng thoải m&aacute;i với thiết kế thanh lịch dễ d&agrave;ng ứng dụng trong nhiều dịp kh&aacute;c nhau.<br />\r\n- Thiết kế quai mảnh đan ch&eacute;o đẹp mắt, nữ t&iacute;nh.<br />\r\n- M&agrave;u sắc trẻ trung với 5 gam m&agrave;u cho n&agrave;ng dễ d&agrave;ng lựa chọn.</p>\r\n', 'GIÀY SANDAL ĐẾ BỆT QUAI ĐAN CHÉO SK0067.jpg', 10),
(97, 'GIÀY SANDAL ĐẾ BÁNH MÌ QUAI MẢNH SK0055', 13, 15, 65, 1890000, 0, '<p><strong>M&atilde; SP</strong>&nbsp;&nbsp; &nbsp;SK0055<br />\r\n<strong>Chất liệu</strong>&nbsp;&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t&nbsp;</strong>&nbsp; &nbsp;3 cm<br />\r\n<strong>D&ograve;ng&nbsp;</strong>&nbsp; &nbsp;casual<br />\r\n- Với thiết kế đế b&aacute;nh m&igrave; cao 3cm &ecirc;m ch&acirc;n v&agrave; hợp xu hướng.<br />\r\n- Kiểu d&aacute;ng quai đan d&acirc;y v&agrave; kẹp ng&oacute;n c&aacute; t&iacute;nh, trẻ trung.<br />\r\n- Gam m&agrave;u hiện đại, dễ d&agrave;ng kết hợp nhiều trang phục.</p>\r\n', 'GIÀY SANDAL ĐẾ BÁNH MÌ QUAI MẢNH SK0055.jpg', 10),
(98, 'GIÀY SANDAL QUAI NHÚN ĐÍNH CƯỜM SN0176', 13, 15, 70, 1678000, 0, '<p><strong>M&atilde; SP</strong>&nbsp;&nbsp; &nbsp;SN0176<br />\r\n<strong>Chất liệu</strong>&nbsp;&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t&nbsp;</strong>&nbsp; &nbsp;5 - 7 cm<br />\r\n- Thiết kế quai nh&uacute;n nữ t&iacute;nh kết hợp đ&iacute;nh cườm lấp l&aacute;nh tạo điểm nhấn nổi bật.<br />\r\n- Guốc trụ cơ bản với quai hậu chắc chắn gi&uacute;p n&agrave;ng tự tin trong mỗi bước đi.<br />\r\n- 3 gam m&agrave;u cơ bản kh&ocirc;ng sợ lỗi mốt v&agrave; dễ d&agrave;ng kết hợp c&ugrave;ng quần &aacute;o, phụ kiện.</p>\r\n', 'GIÀY SANDAL QUAI NHÚN ĐÍNH CƯỜM SN0176.jpg', 10),
(99, 'GIÀY SANDAL GÓT NHỌN ĐÍNH HẠT LẤP LÁNH SN0166', 13, 15, 75, 1678000, 10, '<p><strong>M&atilde; SP&nbsp;&nbsp;</strong> &nbsp;SN0166<br />\r\n<strong>Chất liệu</strong>&nbsp;&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t</strong>&nbsp;&nbsp; &nbsp;8 cm<br />\r\n<strong>D&ograve;ng&nbsp;</strong>&nbsp; &nbsp;Office, Dạo Phố , Party<br />\r\n- Gi&agrave;y sandal g&oacute;t nhọn phối hạt trang tr&iacute; sang trọng, thời thượng.<br />\r\n- G&oacute;t mạ &aacute;nh bạc nổi bật kết hợp với quai đeo mảnh tạo cảm gi&aacute;c thanh mảnh, nữ t&iacute;nh.<br />\r\n- Đế cao su chống trơn trợt gi&uacute;p n&agrave;ng tự tin với mỗi bước đi.<br />\r\n- Gam m&agrave;u hiện đại dễ d&agrave;ng kết hợp nhiều trang phục.<br />\r\n&nbsp;</p>\r\n', 'SN0166_1.jpg', 10),
(100, 'GIÀY BATA SỤC ĐẠP GÓT BA0022', 13, 13, 49, 1890000, 10, '<p><strong>M&atilde; SP&nbsp;</strong>&nbsp; &nbsp;BA0022<br />\r\n<strong>Chất liệu&nbsp;</strong>&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t</strong>&nbsp;&nbsp; &nbsp;2 cm<br />\r\n- Phong c&aacute;ch thể thao gọn nhẹ, phối vải tạo cảm gi&aacute;c mềm mại nữ t&iacute;nh.<br />\r\n- Đế gi&agrave;y với c&aacute;c lớp cao su c&oacute; độ đ&agrave;n hồi cao<br />\r\n- Đế cao su chống trơn trợt gi&uacute;p n&agrave;ng tự tin với mỗi bước đi.</p>\r\n', 'BA0022_2.jpg', 10),
(101, 'GIÀY SNEAKER BASIC HỌA TIẾT CẮT LASER SE0009 ', 13, 13, 85, 1599000, 0, '<p><strong>M&atilde; SP&nbsp;</strong>&nbsp; &nbsp;SE0009<br />\r\n<strong>Chất liệu</strong>&nbsp;&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t</strong>&nbsp;&nbsp; &nbsp;2 cm<br />\r\n<strong>D&ograve;ng</strong>&nbsp;&nbsp; &nbsp;casual<br />\r\n- Thiết kế họa tiết cắt plazer tr&ograve;n nhỏ ở mũi gi&agrave;y tạo điểm nhấn.<br />\r\n- Kiểu d&aacute;ng basic với phong c&aacute;ch tối giản, năng động dễ d&agrave;ng kết hợp với nhiều trang phục v&agrave; phụ kiện.<br />\r\n- Chất liệu da tổng hợp v&agrave; đệm gi&agrave;y &ecirc;m ch&acirc;n, thoải m&aacute;i khi di chuyển.<br />\r\n&nbsp;</p>\r\n', 'SE0009_2.jpg', 10),
(102, 'GIÀY SNEAKER NỮ QUAI DÁN SE0011', 13, 13, 60, 2350000, 0, '<p><strong>M&atilde; SP</strong>&nbsp;&nbsp; &nbsp;SE0011<br />\r\n<strong>Chất liệu</strong>&nbsp;&nbsp; &nbsp;Da tổng hợp<br />\r\n<strong>Độ cao g&oacute;t&nbsp;&nbsp;</strong> &nbsp;2 cm<br />\r\n<strong>D&ograve;ng&nbsp;</strong>&nbsp; &nbsp;casual<br />\r\n- Kiểu d&aacute;ng basic với phong c&aacute;ch trẻ trung, năng động<br />\r\n- Điểm nhấn chạy viền m&agrave;u nổi bậc, quai d&aacute;n tiện lợi<br />\r\n- Thiết kế &ocirc;m ch&acirc;n, đế đệm &ecirc;m &aacute;i đem đến cảm gi&aacute;c thoải m&aacute;i khi di chuyển.<br />\r\n- Chất liệu da tổng hợp cao cấp kết hợp đế cao su chắc chắn, bền đẹp.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'SE0011_1.jpg', 10),
(103, 'GIÀY NIKE AIR MAX EXCEE NAM - XÁM XANH', 14, 18, 65, 2380000, 10, '<p><em>Gi&agrave;y Nike Air Max Excee mẫu gi&agrave;y thời trang năng động, trẻ trung Air Max Excee đ&atilde; cập bến tại CAYKHEShose. Đ&acirc;y hứa hẹn sẽ l&agrave; một mẫu gi&agrave;y chất chơi m&agrave; bạn kh&ocirc;ng thể bỏ qua.</em></p>\r\n\r\n<p><em>Gi&agrave;y Nike Air Max Excee </em>tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện<br />\r\n&nbsp;</p>\r\n', 'GIÀY NIKE AIR MAX EXCEE NAM - XÁM XANH.jpg', 10),
(104, 'GIÀY NIKE AIR MAX SC NAM- XÁM XANH', 14, 18, 70, 1678000, 8, '<p><em><strong>Gi&agrave;y Nike Air Max SC</strong> </em>mang n&eacute;t huyền thoại của Nike, với bộ đệm Air Max trứ danh đ&acirc;y l&agrave; mẫu gi&agrave;y c&oacute; thể kết hợp với bất cứ trang phục n&agrave;o m&agrave; bạn vẫn ho&agrave;n to&agrave;n tự tin trong mọi ho&agrave;n cảnh.</p>\r\n\r\n<p><em>Gi&agrave;y Nike Air Max SC </em>ch&iacute;nh h&atilde;ng tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng qua đường h&agrave;ng kh&ocirc;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY NIKE AIR MAX SC NAM- XÁM XANH.jpg', 10),
(105, 'GIÀY NIKE RENEW RIDE 3 NAM - ĐEN XANH', 14, 18, 45, 2299000, 0, '<p><em><strong>Gi&agrave;y Nike Renew Ride 3 </strong></em>được n&acirc;ng cấp kh&aacute; nhiều từ phi&ecirc;n bản Nike Renew Ride 2 với thiết kế đẹp, hiện đại hơn. Ngo&agrave;i ra phần Upper v&agrave; bộ đế Renew với nhiều cải tiến mới gi&uacute;p đ&ocirc;i gi&agrave;y cực kỳ &ecirc;m &aacute;i.</p>\r\n\r\n<p>Ngo&agrave;i những n&acirc;ng cấp đ&aacute;ng kể về c&ocirc;ng nghệ Nike Renew Ride 3 c&ograve;n c&oacute; thiết kế thời trang n&ecirc;n đ&acirc;y chắc chắn l&agrave; mẫu gi&agrave;y được r&aacute;t nhiều người săn đ&oacute;n.</p>\r\n\r\n<p><em>Nike Renew Ride 3</em> tại <em><strong>CAYKHEShose</strong></em> được nhập khẩu ch&iacute;nh h&atilde;ng. Full box, đầy đủ phụ kiện.</p>\r\n', 'GIÀY NIKE RENEW RIDE 3 NAM - ĐEN XANH.jpg', 10),
(106, 'GIÀY NAM ĐẾ CAO 7CM MŨI THUYỀN GCTATC123-D', 14, 19, 80, 1678000, 5, '<p>&ndash; Chất liệu: Da b&ograve; trơn, da thật 100%</p>\r\n\r\n<p>&ndash; Thiết kế: Kiểu d&aacute;ng loafer, đế cao su</p>\r\n\r\n<p>&ndash; Hỗ trợ tăng chiều cao th&ecirc;m 7cm</p>\r\n\r\n<p>&ndash; Thương hiệu: Đồ da T&acirc;m Anh</p>\r\n\r\n<p>&ndash; M&agrave;u sắc: Đen</p>\r\n\r\n<p>Thiết kế chi tiết:</p>\r\n\r\n<ul>\r\n	<li>Trẻ trung, nam t&iacute;nh v&agrave; hiện đại l&agrave; điều bạn c&oacute; thể dễ d&agrave;ng nhận thấy trong thiết kế n&agrave;y.</li>\r\n	<li>Chất liệu da cao cấp, mềm mại c&ugrave;ng thiết kế đế gi&agrave;y bằng chất liệu cao su &eacute;p gỗ mang lại cảm gi&aacute;c thoải m&aacute;i khi sử dụng</li>\r\n</ul>\r\n', 'GIÀY NAM ĐẾ CAO 7CM MŨI THUYỀN GCTATC123-D.jpg', 10),
(107, 'GIÀY LƯỜI DA NAM MÀU NÂU VÂN PHỐI VIỀN KẺ GNTA5506-N', 14, 19, 85, 1599000, 0, '<p>&ndash; Chất liệu: Da b&ograve; trơn, da thật 100%</p>\r\n\r\n<p>&ndash; Kiểu d&aacute;ng: Penny Loafer c&aacute;ch điệu</p>\r\n\r\n<p>&ndash; Thiết kế: Đế cao su chống trơn trượt, hoạ tiết da sần lạ mắt trẻ trung dễ d&agrave;ng phối nhiều loại trang phục</p>\r\n\r\n<p>&ndash; Thương hiệu: Đồ da T&acirc;m Anh</p>\r\n\r\n<p>&ndash; M&agrave;u sắc: N&acirc;u</p>\r\n\r\n<p>Thiết kế chi tiết:</p>\r\n\r\n<ul>\r\n	<li>Trẻ trung, nam t&iacute;nh v&agrave; hiện đại l&agrave; điều bạn c&oacute; thể dễ d&agrave;ng nhận thấy trong mẫu thiết kế n&agrave;y.</li>\r\n	<li>Gi&agrave;y nam m&atilde; GNTA5506-N sở hữu thiết kế viền họa tiết thời trang, sang trọng</li>\r\n</ul>\r\n', 'GIÀY LƯỜI DA NAM MÀU NÂU VÂN PHỐI VIỀN KẺ GNTA5506-N.jpg', 10),
(108, 'GIÀY DA NAM KIỂU DÁNG OXFORD BASIC GNTA0345-D', 14, 19, 60, 1599000, 0, '<p>&ndash; Chất liệu: Da b&ograve; trơn, da thật 100%</p>\r\n\r\n<p>&ndash; Kiểu d&aacute;ng: Oxford</p>\r\n\r\n<p>&ndash; Thiết kế: Đế cao su chống trơn trượt, mũi gi&agrave;y bo tr&ograve;n thời thượng</p>\r\n\r\n<p>&ndash; Thương hiệu: Đồ da T&acirc;m Anh</p>\r\n\r\n<p>&ndash; M&agrave;u sắc: Đen</p>\r\n\r\n<p>Thiết kế chi tiết:</p>\r\n\r\n<ul>\r\n	<li>Trẻ trung, nam t&iacute;nh v&agrave; hiện đại l&agrave; điều bạn c&oacute; thể dễ d&agrave;ng nhận thấy trong thiết kế n&agrave;y.</li>\r\n	<li>Gi&agrave;y da nam GNTA0345-D sở hữu thiết kế đơn giản, lịch l&atilde;m, dễ kết hợp trang phục</li>\r\n	<li>Chất liệu da cao cấp, mềm mại c&ugrave;ng thiết kế đế gi&agrave;y bằng chất liệu cao su &eacute;p gỗ mang lại cảm gi&aacute;c thoải m&aacute;i khi sử dụng.<br />\r\n	&nbsp;</li>\r\n</ul>\r\n', 'GIÀY DA NAM KIỂU DÁNG OXFORD BASIC GNTA0345-D.jpg', 10),
(109, 'GIÀY CAO GÓT SLINGBACK PHỐI KHÓA ', 13, 14, 65, 1999000, 9, '<p><strong>M&atilde; sản phẩm:</strong> CG09157<br />\r\n<strong>Kiểu d&aacute;ng:</strong> Gi&agrave;y cao g&oacute;t<br />\r\n<strong>Chất liệu:</strong> Si mờ trơn<br />\r\n<strong>Độ cao:</strong> 9cm<br />\r\n<strong>M&agrave;u sắc:</strong> Đen &aacute;nh kim-Xanh &aacute;nh kim-Kem<br />\r\n<strong>K&iacute;ch cỡ</strong>: 35-36-37-38-39<br />\r\n<strong>Xuất xứ:</strong> Việt Nam<br />\r\n<strong>Gi&aacute; đ&atilde; bao gồm VAT</strong></p>\r\n', 'GIÀY CAO GÓT SLINGBACK PHỐI KHÓA.webp', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_img_desc`
--

CREATE TABLE `tbl_product_img_desc` (
  `product_id` int(11) NOT NULL,
  `product_img_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_product_img_desc`
--

INSERT INTO `tbl_product_img_desc` (`product_id`, `product_img_desc`) VALUES
(29, 'giay-nike-mota3.jpg'),
(29, 'giay-nike-mota.jpg'),
(29, 'giay-nike-mota1.jpg'),
(29, 'giay-nike-mota2.jpg'),
(30, 'giay-nike-air-zoom4.jpg'),
(30, 'giay-nike-air-zoom.jpg'),
(30, 'giay-nike-air-zoom1.jpg'),
(30, 'giay-nike-air-zoom2.jpg'),
(31, 'giay-nike-air-max-ap4.jpg'),
(31, 'giay-nike-air-max-ap1.jpg'),
(31, 'giay-nike-air-max-ap2.jpg'),
(31, 'giay-nike-air-max-ap3.jpg'),
(32, 'giay-nike-air-max-excee4.jpg'),
(32, 'giay-nike-air-max-excee1.jpg'),
(32, 'giay-nike-air-max-excee2.jpg'),
(32, 'giay-nike-air-max-excee3.jpg'),
(33, 'giay-nike-revolution4.jpg'),
(33, 'giay-nike-revolution1.jpg'),
(33, 'giay-nike-revolution2.jpg'),
(33, 'giay-nike-revolution3.jpg'),
(34, 'icon_leather4.webp'),
(34, 'icon_leather1.webp'),
(34, 'icon_leather2.webp'),
(34, 'icon_leather3.webp'),
(35, 'phối quai4.webp'),
(35, 'phối quai1.webp'),
(35, 'phối quai2.webp'),
(35, 'phối quai3.webp'),
(36, 'Maia Leather4.webp'),
(36, 'Maia Leather1.webp'),
(36, 'Maia Leather2.webp'),
(36, 'Maia Leather3.webp'),
(37, 'Embellished Satin4.webp'),
(37, 'Embellished Satin1.webp'),
(37, 'Embellished Satin2.webp'),
(37, 'Embellished Satin3.webp'),
(38, 'cao got4.webp'),
(38, 'cao got1.webp'),
(38, 'cao got2.webp'),
(38, 'cao got3.webp'),
(39, 'Terrazo4.jpg'),
(39, 'Terrazo1.jpg'),
(39, 'Terrazo2.jpg'),
(39, 'Terrazo3.jpg'),
(40, 'sandals cao gót4.webp'),
(40, 'sandals cao gót1.webp'),
(40, 'sandals cao gót2.webp'),
(40, 'sandals cao gót3.webp'),
(41, 'Sandals bản rộng4.webp'),
(41, 'Sandals bản rộng1.webp'),
(41, 'Sandals bản rộng2.webp'),
(41, 'Sandals bản rộng3.webp'),
(42, 'Chunky4.webp'),
(42, 'Chunky1.webp'),
(42, 'Chunky2.jpg'),
(42, 'Chunky3.webp'),
(43, 'Malta4.webp'),
(43, 'Malta1.webp'),
(43, 'Malta2.webp'),
(43, 'Malta3.webp'),
(44, 'studio jeanne4.webp'),
(44, 'studio jeanne1.webp'),
(44, 'studio jeanne2.webp'),
(44, 'studio jeanne3.webp'),
(45, 'Đế_bệt_sang_trọng4.jpg'),
(45, 'Đế_bệt_sang_trọng1.webp'),
(45, 'Đế_bệt_sang_trọng2.webp'),
(45, 'Đế_bệt_sang_trọng3.webp'),
(46, 'skimmer2.webp'),
(46, 'skimmer1.webp'),
(47, 'Zucia4.webp'),
(47, 'Zucia1.webp'),
(47, 'Zucia2.webp'),
(47, 'Zucia3.webp'),
(48, 'DÉP NỮ CALVIN KLEIN PEACH BLUSH.webp'),
(48, 'Peach Blush1.webp'),
(48, 'Peach Blush2.webp'),
(48, 'Peach Blush3.webp'),
(49, 'Slide3.webp'),
(49, 'DÉP QUAI NGANG NỮ - RẼ DOUBLE BUCKLE SLIDE.webp'),
(49, 'Slide1.webp'),
(49, 'Slide2.webp'),
(50, 'Fur Slide Slipper3.webp'),
(50, 'DÉP ĐI TRONG NHÀ - FUR SLIDE SLIPPER.webp'),
(50, 'Fur Slide Slipper1.webp'),
(51, 'giay-nike-nam4.jpg'),
(51, 'giay-nike-nam1.jpg'),
(51, 'giay-nike-nam2.jpg'),
(51, 'giay-nike-nam3.jpg'),
(52, 'royale_nam4.jpg'),
(52, 'royale_nam1.jpg'),
(52, 'royale_nam2.jpg'),
(52, 'royale_nam3.jpg'),
(53, 'trey_nam1.jpg'),
(53, 'trey_nam2.jpg'),
(53, 'trey_nam3.jpg'),
(53, 'trey_nam4.jpg'),
(54, 'GIÀY PUMA RBD GAME LOW NAM - TRẮNG XANH LÁ.jpg'),
(54, 'puma1.jpg'),
(54, 'puma2.jpg'),
(54, 'puma3.jpg'),
(55, 'Adidas4.jpg'),
(55, 'Adidas1.jpg'),
(55, 'Adidas2.jpg'),
(55, 'Adidas3.jpg'),
(56, 'Horsebit loafer4.jpg'),
(56, 'Horsebit loafer1.jpg'),
(56, 'Horsebit loafer2.png'),
(56, 'Horsebit loafer3.jpg'),
(57, 'Belgian Loafer4.jpg'),
(57, 'Belgian Loafer1.jpg'),
(57, 'Belgian Loafer2.jpg'),
(57, 'Belgian Loafer3.jpg'),
(58, 'Modern Derby4.jpg'),
(58, 'Modern Derby1.jpg'),
(58, 'Modern Derby2.jpg'),
(58, 'Modern Derby3.jpg'),
(59, 'Giày Oxford4.jpg'),
(59, 'Giày Oxford1.jpg'),
(59, 'Giày Oxford2.jpg'),
(59, 'Giày Oxford3.jpg'),
(60, 'Giày lười4.jpg'),
(60, 'Giày lười3.jpg'),
(60, 'Giày lười2.jpg'),
(60, 'Giày lười1.jpg'),
(61, 'Pierre Cardin3.webp'),
(61, 'DÉP SANDAL NAM PIERE CARDIN - PCMFWLE 135.webp'),
(61, 'Pierre Cardin1.webp'),
(61, 'Pierre Cardin2.webp'),
(62, 'PCMFWLE 136_4.jpg'),
(62, 'PCMFWLE 136_3.webp'),
(62, 'PCMFWLE 136_2.webp'),
(62, 'PCMFWLE 136_1.webp'),
(63, 'PCMFWLE 127_4.webp'),
(63, 'PCMFWLE 127_3.webp'),
(63, 'PCMFWLE 127_2.webp'),
(63, 'PCMFWLE 127_1.webp'),
(64, 'PCMFWLE 142_3.webp'),
(64, 'PCMFWLE 142_2.webp'),
(64, 'PCMFWLE 142_1.webp'),
(64, 'DÉP SANDAL NAM CẤP PIERE CARDIN - PCMFWLE 142.jpg'),
(65, 'PCMFWLE 130_4.webp'),
(65, 'PCMFWLE 130_3.webp'),
(65, 'PCMFWLE 130_2.webp'),
(65, 'PCMFWLE 130_1.webp'),
(66, 'DÉP NAM QUAI NGANG CAO CẤP KEEDO KDX15.jpg'),
(66, 'KEEDO KDX15_1.jpg'),
(66, 'KEEDO KDX15_2.jpg'),
(66, 'KEEDO KDX15_3.jpg'),
(67, 'KEEDO KDX13_1.jpg'),
(67, 'KEEDO KDX13_2.jpg'),
(67, 'KEEDO KDX13_3.jpg'),
(67, 'KEEDO KDX13_4.jpg'),
(68, 'DÉP NAM QUAI NGANG CAO CẤP KEEDO KDX05.jpg'),
(68, 'KEEDO KDX05_1.jpg'),
(68, 'KEEDO KDX05_2.jpg'),
(68, 'KEEDO KDX05_3.jpg'),
(69, 'KEEDO Y-814_1.jpg'),
(69, 'KEEDO Y-814_2.jpg'),
(69, 'KEEDO Y-814_3.jpg'),
(69, 'KEEDO Y-814_4.jpg'),
(70, 'KEEDO TL-204_1.jpg'),
(70, 'KEEDO TL-204_2.jpg'),
(70, 'KEEDO TL-204_3.jpg'),
(70, 'KEEDO TL-204_4.jpg'),
(71, 'DÉP ĐẾ MAY SẴN DA BÒ QUAI NGANG CAO CẤP KEEDO TL-080.jpg'),
(71, 'KEEDO TL-080_1.jpg'),
(71, 'KEEDO TL-080_2.jpg'),
(71, 'KEEDO TL-080_3.jpg'),
(72, 'DÉP HAI QUAI NGANG KEEDO - KD0508.jpg'),
(72, 'KD0508_2.jpg'),
(72, 'KD0508_3.jpg'),
(72, 'KD0508_4.jpg'),
(73, 'T143_4.jpg'),
(73, 'T143_1.jpg'),
(73, 'T143_2.jpg'),
(73, 'T143_3.jpg'),
(74, 'VENTO_3.jpg'),
(74, 'VENTO_2.jpg'),
(74, 'VENTO_1.jpg'),
(74, 'SANDAL VENTO NAM CHÍNH HÃNG XUẤT KHẨU NHẬT NV - 1001.jpg'),
(75, 'NB01_4.jpg'),
(75, 'NB01_1.jpg'),
(75, 'NB01_2.jpg'),
(75, 'NB01_3.jpg'),
(76, 'adidas-1.jpg'),
(76, 'adidas-2.jpg'),
(76, 'adidas-3.jpg'),
(76, 'adidas-4.jpg'),
(77, 'KDA01_1.jpg'),
(77, 'KDA01_2.jpg'),
(77, 'KDA01_3.jpg'),
(77, 'SANDAL NAM CHÍNH HÃNG KEEDO KDA01.jpg'),
(78, 'E-SERIES_4.jpg'),
(78, 'E-SERIES_3.jpg'),
(78, 'E-SERIES_2.jpg'),
(78, 'E-SERIES_1.jpg'),
(79, 'DUNK_4.jpg'),
(79, 'DUNK_3.jpg'),
(79, 'DUNK_2.jpg'),
(79, 'DUNK_1.jpg'),
(80, 'BN0167_4.jpg'),
(80, 'BN0167_3.jpg'),
(80, 'BN0167_2.jpg'),
(80, 'BN0167_1.jpg'),
(81, 'JEREMY_4.jpg'),
(81, 'JEREMY_3.jpg'),
(81, 'JEREMY_2.jpg'),
(81, 'JEREMY_1.jpg'),
(82, 'SK0057_4.jpg'),
(82, 'SK0057_3.jpg'),
(82, 'SK0057_2.jpg'),
(82, 'SK0057_1.jpg'),
(83, 'LF01_4.webp'),
(83, 'LF01_3.webp'),
(83, 'LF01_2.webp'),
(83, 'LF01_1.webp'),
(84, 'SK0058_4.jpg'),
(84, 'SK0058_3.jpg'),
(84, 'SK0058_2.jpg'),
(84, 'SK0058_1.jpg'),
(85, 'DX0062_4.jpg'),
(85, 'DX0062_3.jpg'),
(85, 'DX0062_2.jpg'),
(85, 'DX0062_1.jpg'),
(86, 'DX0070_4.jpg'),
(86, 'DX0070_3.jpg'),
(86, 'DX0070_2.jpg'),
(86, 'DX0070_1.jpg'),
(87, 'DX0065_4.jpg'),
(87, 'DX0065_3.jpg'),
(87, 'DX0065_2.jpg'),
(87, 'DX0065_1.jpg'),
(88, 'DX0067_4.jpg'),
(88, 'DX0067_3.jpg'),
(88, 'DX0067_2.jpg'),
(88, 'DX0067_1.jpg'),
(89, 'BB0071_4.jpg'),
(89, 'BB0071_3.jpg'),
(89, 'BB0071_2.jpg'),
(89, 'BB0071_1.jpg'),
(90, 'BB0072_4.jpg'),
(90, 'BB0072_3.jpg'),
(90, 'BB0072_2.jpg'),
(90, 'BB0072_1.jpg'),
(91, 'BB0073_4.jpg'),
(91, 'BB0073_3.jpg'),
(91, 'BB0073_2.jpg'),
(91, 'BB0073_1.jpg'),
(92, 'BB0067_4.jpg'),
(92, 'BB0067_3.jpg'),
(92, 'BB0067_2.jpg'),
(92, 'BB0067_1.jpg'),
(93, 'GN0054_4.jpg'),
(93, 'GN0054_3.jpg'),
(93, 'GN0054_2.jpg'),
(93, 'GN0054_1.jpg'),
(94, 'SN0163_3.jpg'),
(94, 'SN0163_2.jpg'),
(94, 'SN0163_1.jpg'),
(94, 'SN0163_4.jpg'),
(95, 'BN0162_4.jpg'),
(95, 'BN0162_3.jpg'),
(95, 'BN0162_2.jpg'),
(95, 'BN0162_1.jpg'),
(96, 'SK0067_4.jpg'),
(96, 'SK0067_3.jpg'),
(96, 'SK0067_2.jpg'),
(96, 'SK0067_1.jpg'),
(97, 'SK0055_4.jpg'),
(97, 'SK0055_3.jpg'),
(97, 'SK0055_2.jpg'),
(97, 'SK0055_1.jpg'),
(98, 'SN0176_4.jpg'),
(98, 'SN0176_3.jpg'),
(98, 'SN0176_2.jpg'),
(98, 'SN0176_1.jpg'),
(99, 'SN0166_4.jpg'),
(99, 'SN0166_3.jpg'),
(99, 'SN0166_2.jpg'),
(99, 'SN0166_1.jpg'),
(100, 'BA0022_4.jpg'),
(100, 'BA0022_3.jpg'),
(100, 'BA0022_2.jpg'),
(100, 'BA0022_1.jpg'),
(101, 'SE0009_4.jpg'),
(101, 'SE0009_3.jpg'),
(101, 'SE0009_2.jpg'),
(101, 'SE0009_1.jpg'),
(102, 'SE0011_4.jpg'),
(102, 'SE0011_3.jpg'),
(102, 'SE0011_2.jpg'),
(102, 'SE0011_1.jpg'),
(103, 'EXCEE NAM_4.jpg'),
(103, 'EXCEE NAM_3.jpg'),
(103, 'EXCEE NAM_2.jpg'),
(103, 'EXCEE NAM_1.jpg'),
(104, 'MAX SC_4.jpg'),
(104, 'MAX SC_3.jpg'),
(104, 'MAX SC_2.jpg'),
(104, 'MAX SC_1.jpg'),
(105, 'RENEW RIDE_4.jpg'),
(105, 'RENEW RIDE_3.jpg'),
(105, 'RENEW RIDE_2.jpg'),
(105, 'RENEW RIDE_1.jpg'),
(106, 'GCTATC123-D_4.jpg'),
(106, 'GCTATC123-D_3.jpg'),
(106, 'GCTATC123-D_2.jpg'),
(106, 'GCTATC123-D_1.jpg'),
(107, 'GNTA5506-N_4.jpg'),
(107, 'GNTA5506-N_3.jpg'),
(107, 'GNTA5506-N_2.jpg'),
(107, 'GNTA5506-N_1.jpg'),
(108, 'GNTA0345-D_4.jpg'),
(108, 'GNTA0345-D_3.jpg'),
(108, 'GNTA0345-D_2.jpg'),
(108, 'GNTA0345-D_1.jpg'),
(109, 'SLINGBACK_4.webp'),
(109, 'SLINGBACK_3.webp'),
(109, 'SLINGBACK_2.webp'),
(109, 'SLINGBACK_1.webp');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_size`
--

CREATE TABLE `tbl_product_size` (
  `product_id` int(11) NOT NULL,
  `product_size` int(11) NOT NULL,
  `product_size_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_product_size`
--

INSERT INTO `tbl_product_size` (`product_id`, `product_size`, `product_size_number`) VALUES
(29, 36, 44),
(29, 37, 11),
(29, 38, 22),
(29, 39, 21),
(30, 35, 0),
(30, 36, 0),
(30, 37, 0),
(30, 38, 0),
(30, 39, 0),
(31, 35, 5),
(31, 36, 6),
(31, 37, 7),
(31, 38, 8),
(31, 39, 9),
(32, 35, 10),
(32, 36, 12),
(32, 37, 14),
(32, 38, 16),
(32, 39, 18),
(33, 35, 15),
(33, 36, 18),
(33, 37, 21),
(33, 38, 24),
(33, 39, 27),
(34, 35, 20),
(34, 36, 24),
(34, 37, 28),
(34, 38, 2),
(34, 39, 6),
(35, 35, 25),
(35, 36, 0),
(35, 37, 5),
(35, 38, 10),
(35, 39, 15),
(36, 35, 0),
(36, 36, 6),
(36, 37, 12),
(36, 38, 18),
(36, 39, 24),
(37, 35, 5),
(37, 36, 12),
(37, 37, 19),
(37, 38, 26),
(37, 39, 3),
(38, 35, 10),
(38, 36, 18),
(38, 37, 26),
(38, 38, 4),
(38, 39, 12),
(39, 35, 15),
(39, 36, 24),
(39, 37, 3),
(39, 38, 12),
(39, 39, 21),
(40, 35, 20),
(40, 36, 0),
(40, 37, 10),
(40, 38, 20),
(40, 39, 0),
(41, 35, 25),
(41, 36, 6),
(41, 37, 17),
(41, 38, 28),
(41, 39, 9),
(42, 35, 0),
(42, 36, 12),
(42, 37, 24),
(42, 38, 6),
(42, 39, 18),
(43, 35, 5),
(43, 36, 18),
(43, 37, 1),
(43, 38, 14),
(43, 39, 27),
(44, 35, 10),
(44, 36, 24),
(44, 37, 8),
(44, 38, 22),
(44, 39, 6),
(45, 35, 15),
(45, 36, 0),
(45, 37, 15),
(45, 38, 0),
(45, 39, 15),
(46, 35, 20),
(46, 36, 6),
(46, 37, 22),
(46, 38, 8),
(46, 39, 24),
(47, 35, 25),
(47, 36, 12),
(47, 37, 29),
(47, 38, 16),
(47, 39, 3),
(48, 35, 0),
(48, 36, 18),
(48, 37, 6),
(48, 38, 24),
(48, 39, 12),
(49, 35, 5),
(49, 36, 24),
(49, 37, 13),
(49, 38, 2),
(49, 39, 21),
(50, 35, 10),
(50, 36, 0),
(50, 37, 20),
(50, 38, 10),
(50, 39, 0),
(51, 35, 15),
(51, 36, 6),
(51, 37, 27),
(51, 38, 18),
(51, 39, 9),
(52, 35, 20),
(52, 36, 12),
(52, 37, 4),
(52, 38, 26),
(52, 39, 18),
(53, 35, 25),
(53, 36, 18),
(53, 37, 11),
(53, 38, 4),
(53, 39, 27),
(54, 35, 0),
(54, 36, 24),
(54, 37, 18),
(54, 38, 12),
(54, 39, 6),
(55, 35, 5),
(55, 36, 0),
(55, 37, 25),
(55, 38, 20),
(55, 39, 15),
(56, 35, 10),
(56, 36, 6),
(56, 37, 2),
(56, 38, 28),
(56, 39, 24),
(57, 35, 15),
(57, 36, 12),
(57, 37, 9),
(57, 38, 6),
(57, 39, 3),
(58, 35, 20),
(58, 36, 18),
(58, 37, 16),
(58, 38, 14),
(58, 39, 12),
(59, 35, 25),
(59, 36, 24),
(59, 37, 23),
(59, 38, 22),
(59, 39, 21),
(60, 35, 0),
(60, 36, 0),
(60, 37, 0),
(60, 38, 0),
(60, 39, 0),
(61, 35, 5),
(61, 36, 6),
(61, 37, 7),
(61, 38, 8),
(61, 39, 9),
(62, 35, 10),
(62, 36, 12),
(62, 37, 14),
(62, 38, 16),
(62, 39, 18),
(63, 35, 15),
(63, 36, 18),
(63, 37, 21),
(63, 38, 24),
(63, 39, 27),
(64, 35, 20),
(64, 36, 24),
(64, 37, 28),
(64, 38, 2),
(64, 39, 6),
(65, 35, 25),
(65, 36, 0),
(65, 37, 5),
(65, 38, 10),
(65, 39, 15),
(66, 35, 0),
(66, 36, 6),
(66, 37, 12),
(66, 38, 18),
(66, 39, 24),
(67, 35, 5),
(67, 36, 12),
(67, 37, 19),
(67, 38, 26),
(67, 39, 3),
(68, 35, 10),
(68, 36, 18),
(68, 37, 26),
(68, 38, 4),
(68, 39, 12),
(69, 35, 15),
(69, 36, 24),
(69, 37, 3),
(69, 38, 12),
(69, 39, 21),
(70, 35, 20),
(70, 36, 0),
(70, 37, 10),
(70, 38, 20),
(70, 39, 0),
(71, 35, 25),
(71, 36, 6),
(71, 37, 17),
(71, 38, 28),
(71, 39, 9),
(72, 35, 0),
(72, 36, 12),
(72, 37, 24),
(72, 38, 6),
(72, 39, 18),
(73, 35, 5),
(73, 36, 18),
(73, 37, 1),
(73, 38, 14),
(73, 39, 27),
(74, 35, 10),
(74, 36, 24),
(74, 37, 8),
(74, 38, 22),
(74, 39, 6),
(75, 35, 15),
(75, 36, 0),
(75, 37, 15),
(75, 38, 0),
(75, 39, 15),
(76, 35, 20),
(76, 36, 6),
(76, 37, 22),
(76, 38, 8),
(76, 39, 24),
(77, 35, 25),
(77, 36, 12),
(77, 37, 29),
(77, 38, 16),
(77, 39, 3),
(78, 35, 0),
(78, 36, 18),
(78, 37, 6),
(78, 38, 24),
(78, 39, 12),
(79, 35, 5),
(79, 36, 24),
(79, 37, 13),
(79, 38, 2),
(79, 39, 21),
(80, 35, 10),
(80, 36, 0),
(80, 37, 20),
(80, 38, 10),
(80, 39, 0),
(81, 35, 15),
(81, 36, 6),
(81, 37, 27),
(81, 38, 18),
(81, 39, 9),
(82, 35, 20),
(82, 36, 12),
(82, 37, 4),
(82, 38, 26),
(82, 39, 18),
(83, 35, 25),
(83, 36, 18),
(83, 37, 11),
(83, 38, 4),
(83, 39, 27),
(84, 35, 0),
(84, 36, 24),
(84, 37, 18),
(84, 38, 12),
(84, 39, 6),
(85, 35, 5),
(85, 36, 0),
(85, 37, 25),
(85, 38, 20),
(85, 39, 15),
(86, 35, 10),
(86, 36, 6),
(86, 37, 2),
(86, 38, 28),
(86, 39, 24),
(87, 35, 15),
(87, 36, 12),
(87, 37, 9),
(87, 38, 6),
(87, 39, 3),
(88, 35, 20),
(88, 36, 18),
(88, 37, 16),
(88, 38, 14),
(88, 39, 12),
(89, 35, 25),
(89, 36, 24),
(89, 37, 23),
(89, 38, 22),
(89, 39, 21),
(90, 35, 0),
(90, 36, 0),
(90, 37, 0),
(90, 38, 0),
(90, 39, 0),
(91, 35, 5),
(91, 36, 6),
(91, 37, 7),
(91, 38, 8),
(91, 39, 9),
(92, 35, 10),
(92, 36, 12),
(92, 37, 14),
(92, 38, 16),
(92, 39, 18),
(93, 35, 15),
(93, 36, 18),
(93, 37, 21),
(93, 38, 24),
(93, 39, 27),
(94, 35, 20),
(94, 36, 24),
(94, 37, 28),
(94, 38, 2),
(94, 39, 6),
(95, 35, 25),
(95, 36, 0),
(95, 37, 5),
(95, 38, 10),
(95, 39, 15),
(96, 35, 0),
(96, 36, 6),
(96, 37, 12),
(96, 38, 18),
(96, 39, 24),
(97, 35, 5),
(97, 36, 12),
(97, 37, 19),
(97, 38, 26),
(97, 39, 3),
(98, 35, 10),
(98, 36, 18),
(98, 37, 26),
(98, 38, 4),
(98, 39, 12),
(99, 35, 15),
(99, 36, 24),
(99, 37, 3),
(99, 38, 12),
(99, 39, 21),
(100, 35, 20),
(100, 36, 0),
(100, 37, 9),
(100, 38, 20),
(100, 39, 0),
(101, 35, 25),
(101, 36, 6),
(101, 37, 17),
(101, 38, 28),
(101, 39, 9),
(102, 35, 0),
(102, 36, 12),
(102, 37, 24),
(102, 38, 6),
(102, 39, 18),
(103, 35, 5),
(103, 36, 18),
(103, 37, 1),
(103, 38, 14),
(103, 39, 27),
(104, 35, 10),
(104, 36, 24),
(104, 37, 8),
(104, 38, 22),
(104, 39, 6),
(105, 35, 15),
(105, 36, 0),
(105, 37, 15),
(105, 38, 0),
(105, 39, 15),
(106, 35, 20),
(106, 36, 6),
(106, 37, 22),
(106, 38, 8),
(106, 39, 24),
(107, 35, 25),
(107, 36, 12),
(107, 37, 29),
(107, 38, 16),
(107, 39, 3),
(108, 35, 0),
(108, 36, 18),
(108, 37, 6),
(108, 38, 24),
(108, 39, 12),
(109, 35, 5),
(109, 36, 24),
(109, 37, 13),
(109, 38, 2),
(109, 39, 21),
(29, 35, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`account_phone`);

--
-- Indexes for table `tbl_bill`
--
ALTER TABLE `tbl_bill`
  ADD PRIMARY KEY (`bill_code`),
  ADD KEY `account_phone` (`account_phone`);

--
-- Indexes for table `tbl_bill_desc`
--
ALTER TABLE `tbl_bill_desc`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `bill_code` (`bill_code`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`),
  ADD KEY `cartegory_id` (`cartegory_id`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_cartegory`
--
ALTER TABLE `tbl_cartegory`
  ADD PRIMARY KEY (`cartegory_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `cartegory_id` (`cartegory_id`);

--
-- Indexes for table `tbl_product_img_desc`
--
ALTER TABLE `tbl_product_img_desc`
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_product_size`
--
ALTER TABLE `tbl_product_size`
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_bill`
--
ALTER TABLE `tbl_bill`
  MODIFY `bill_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_cartegory`
--
ALTER TABLE `tbl_cartegory`
  MODIFY `cartegory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_bill`
--
ALTER TABLE `tbl_bill`
  ADD CONSTRAINT `tbl_bill_ibfk_1` FOREIGN KEY (`account_phone`) REFERENCES `tbl_account` (`account_phone`);

--
-- Constraints for table `tbl_bill_desc`
--
ALTER TABLE `tbl_bill_desc`
  ADD CONSTRAINT `tbl_bill_desc_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`),
  ADD CONSTRAINT `tbl_bill_desc_ibfk_2` FOREIGN KEY (`bill_code`) REFERENCES `tbl_bill` (`bill_code`);

--
-- Constraints for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD CONSTRAINT `tbl_brand_ibfk_1` FOREIGN KEY (`cartegory_id`) REFERENCES `tbl_cartegory` (`cartegory_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD CONSTRAINT `tbl_cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `tbl_brand` (`brand_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_product_ibfk_2` FOREIGN KEY (`cartegory_id`) REFERENCES `tbl_cartegory` (`cartegory_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_product_img_desc`
--
ALTER TABLE `tbl_product_img_desc`
  ADD CONSTRAINT `tbl_product_img_desc_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`);

--
-- Constraints for table `tbl_product_size`
--
ALTER TABLE `tbl_product_size`
  ADD CONSTRAINT `tbl_product_size_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
