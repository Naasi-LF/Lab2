-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 02, 2023 at 11:49 AM
-- Server version: 5.7.36
-- PHP Version: 8.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `site_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE `forum` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `subject` varchar(60) NOT NULL,
  `message` text NOT NULL,
  `post_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `order_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_contents`
--

CREATE TABLE `order_contents` (
  `content_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `price` decimal(4,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `item_id` int(11) NOT NULL,
  `guid` varchar(36) NOT NULL,
  `title_zh` varchar(100) NOT NULL,
  `item_name` varchar(500) NOT NULL,
  `description_zh` varchar(1000) NOT NULL,
  `item_desc` varchar(4096) NOT NULL,
  `vegetarian` tinyint(1) NOT NULL DEFAULT '0',
  `hasMeat` tinyint(1) NOT NULL DEFAULT '0',
  `hasFish` tinyint(1) NOT NULL DEFAULT '0',
  `item_price` int(11) NOT NULL,
  `spiciness` tinyint(4) NOT NULL,
  `item_img` varchar(200) NOT NULL,
  `fk_guid` varchar(36) NOT NULL,
  `restaurant` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`item_id`, `guid`, `title_zh`, `item_name`, `description_zh`, `item_desc`, `vegetarian`, `hasMeat`, `hasFish`, `item_price`, `spiciness`, `item_img`, `fk_guid`, `restaurant`) VALUES
(0, '3bb1f246-52f0-11ee-8d71-b48c9d1b3686', '蔬菜牛奶汤', 'Vegetables with milk soup', '用牛奶烹煮得新鲜蔬菜做成得汤。简单的调味，有益健康。', 'A soup made from fresh vegetables simmered in milk. Simply flavoured leads to healthy benefits.', 1, 0, 0, 15, 1, 'Vegetables with milk soup.jpg', '0', 'g20'),
(1, '3bb22d3c-52f0-11ee-8d71-b48c9d1b3686', '蔬菜浓汤', 'Vegetable soup', '能品尝道蔬菜甘甜的浓汤。是经过慢炖后味道浓郁的一道菜', 'A sweet and savoury soup with vegetables. It is a dish that has been slowly simmered to give it a rich flavour.', 1, 0, 0, 10, 1, 'Vegetable soup.jpg', '0', 'g20'),
(2, '3bb264e2-52f0-11ee-8d71-b48c9d1b3686', '海陆煎烤', 'Grilled seafood and poultry', '将新鲜的鱼和肉混在一起烧烤，是充满营养的菜肴', 'A delicious and nutritious dish made from grilled fresh fish and meat.', 0, 1, 0, 20, 2, 'Grilled seafood and poultry.jpg', '0', 'g20'),
(3, '3bb29b19-52f0-11ee-8d71-b48c9d1b3686', '香辣煎肉', 'Pan-fried Spicy Meat', '将辣椒研碎撒入，通过烧烤消除肉的腥臭味引出鲜味的鲜肉菜肴', 'A dish of meat that is grilled to eliminate the odour of the meat and bring out its freshness by adding ground chilli.', 0, 1, 0, 12, 5, 'Pan-fried Spicy Meat.jpg', '0', 'g20'),
(4, '3bb2d2aa-52f0-11ee-8d71-b48c9d1b3686', '海鲜咖喱饭', 'Seafood Curry with Rice', '能尝到满满海味的奢华咖喱饭。口感有点辣，略味成熟的风味.', 'A luxurious dish is full of seafood flavours. A little spicy in taste, the combination of seafood and curry gives the dish a unique flavour.', 0, 0, 1, 16, 2, 'Seafood Curry with Rice.jpeg', '0', 'g20'),
(5, '3bb31851-52f0-11ee-8d71-b48c9d1b3686', '咖喱饭', 'Curry with Rice', '无论老人还是小孩都非常喜欢的常规菜肴，是简单又不会吃腻的一道菜', 'A regular dish preferred by the elderly and children, it is an easy and oil-less dish to eat.', 1, 1, 0, 8, 3, 'Curry with Rice.jpg', '0', 'g20'),
(6, '3bb35552-52f0-11ee-8d71-b48c9d1b3686', '蘑菇烩饭', 'Mushroom Risotto', '将大米慢煮做成的烩饭。蘑菇和黄油的香气令人食欲大增', 'A risotto made from slow-cooked rice. The smell of mushrooms and butter is very appetising', 1, 0, 0, 11, 1, 'Mushroom Risotto.jpg', '0', 'g20'),
(7, '3bb38f2e-52f0-11ee-8d71-b48c9d1b3686', '番茄披萨', 'Tomato pizza', '点缀了新鲜的番茄的披萨，融化了起司令人心醉', 'A pizza topped with fresh tomatoes and a delightful blend of melted cheese ', 1, 0, 0, 9, 1, 'Tomato pizza.jpg', '0', 'g20'),
(8, '3bb3ca4f-52f0-11ee-8d71-b48c9d1b3686', '油炖海鲜', 'Stewed Seafood with Oil', '用撒满大蒜的油炖煮海鲜食材而成的料理。强烈的香味挑拨着味蕾', 'A seafood dish cooked in oil sprinkled with garlic. The intense flavour tantalises the taste buds', 0, 1, 1, 22, 2, 'Stewed Seafood with Oil.jpg', '0', 'g20'),
(9, '3bb4039d-52f0-11ee-8d71-b48c9d1b3686', '干煎鲑鱼', 'Pan-fried salmon', '在鲑鱼上撒上小麦粉后用黄油煎。表皮酥脆的口感也非常特别', 'Salmon sprinkled with wheat flour and pan-fried in butter. The crispy texture of the skin makes this dish special', 0, 0, 1, 30, 1, 'Pan-fried salmon.jpg', '0', 'g20'),
(10, '3bb43a92-52f0-11ee-8d71-b48c9d1b3686', '番茄汤', 'Tomato Soup', '用醇厚的牛奶炖煮水灵灵的番茄，汤汁具有柔和的酸味，口感易于接受', 'Fresh tomatoes simmered in creamy milk, giving the soup an appetising sour taste and an accessible texture.', 1, 0, 1, 20, 1, 'Tomato Soup.jpg', '0', 'g20'),
(11, '3bb46c41-52f0-11ee-8d71-b48c9d1b3686', '蘑菇煎蛋卷', 'Mushroom Omelet', '拌入了香气浓郁做成的煎蛋卷。是可以品尝软乎乎口感的一道菜', 'An egg omelet with a rich mushroom flavour. A dish where you can taste the soft texture', 1, 0, 0, 10, 1, 'Mushroom Omelet.jpg', '0', 'g20'),
(13, '3b8448df-52f0-11ee-8d71-b48c9d1b3686', '脆皮黄瓜卷', 'Crispy Cucumber Rolls', '脆皮黄瓜是一道简单的家常菜品。是以黄瓜、干红辣椒为原材料制作而成。其做法简单快捷，营养健康，具有高脂血症调理、减肥瘦身调理、清热解毒调理等功效。', 'Crispy cucumber is a simple home cooked dish. It is made from cucumber and dried red pepper as raw materials. Its method is simple and fast, nutritious and healthy, and has effects such as hyperlipidemia regulation, weight loss and slimming regulation, heat clearing and detoxification regulation.', 1, 0, 0, 18, 1, '12.png', '0', 'g1'),
(14, '3b868826-52f0-11ee-8d71-b48c9d1b3686', '至尊汉堡', 'Supreme Burger', '至尊汉堡由牛肉饼加入番茄酱、沙拉酱等，再加入番茄片、洋葱、酸黄瓜等制作而成。其食用方便、风味可口、营养全面，成为畅销世界的主食之一。', 'The Supreme Burger is made by adding beef patties with tomato sauce, salad dressing, etc., and then adding tomato slices, onions, pickles, etc. Its convenient consumption, delicious flavor, and comprehensive nutrition have become one of the best-selling staple foods in the world.', 0, 0, 1, 31, 2, '11.png', '0', 'g1'),
(15, '3b86d3dc-52f0-11ee-8d71-b48c9d1b3686', '鸿运当头', 'lucky strike', '鸿运当头是关于烤肠的一道菜。口感浓郁，香飘四溢，外表干燥酥脆，白里透红，特别好吃。', 'Lucky strike is a dish about grilled sausages. The taste is rich and fragrant, with a dry and crispy appearance and a white to red color, making it particularly delicious.', 0, 1, 1, 28, 2, '10.png', '0', 'g1'),
(16, '3b87064e-52f0-11ee-8d71-b48c9d1b3686', '酸菜鱼', 'boiled fish with pickled cabbage and chili ', '酸菜鱼也称为酸汤鱼，以其特有的调味和独特的烹调技法而著称。以草鱼为主料，配以泡菜等食材煮制而成，口味酸辣可口。', 'Pickled Chinese cabbage fish, also known as fish in sour soup, is famous for its unique seasoning and cooking techniques. It is made with grass carp as the main ingredient, paired with ingredients such as kimchi, and has a sour, spicy and delicious taste.', 0, 0, 1, 30, 3, '9.png', '0', 'g1'),
(17, '3b87427c-52f0-11ee-8d71-b48c9d1b3686', '香煎三文鱼', 'Pan-fried salmon', '红烧鲫鱼是以鲫鱼为主要食材，配以香菜、红辣椒一起烧制的美味私房菜，口味香辣可口，美容抗皱，营养价值丰富。', 'Braised crucian carp in brown sauce is a delicious private dish made with crucian carp as the main ingredient, accompanied by coriander and chili peppers. It has a spicy and delicious taste, beauty and wrinkle resistance, and rich nutritional value.', 0, 0, 1, 22, 4, '8.png', '0', 'g1'),
(18, '3b8772bc-52f0-11ee-8d71-b48c9d1b3686', '红烧鲫鱼', 'Braised crucian carp in brown sauce', '红烧鲫鱼是以鲫鱼为主要食材，配以香菜、红辣椒一起烧制的美味私房菜，口味香辣可口，美容抗皱，营养价值丰富。', 'Braised crucian carp in brown sauce is a delicious private dish made with crucian carp as the main ingredient, accompanied by coriander and chili peppers. It has a spicy and delicious taste, beauty and wrinkle resistance, and rich nutritional value.', 0, 0, 1, 25, 3, '7.png', '0', 'g1'),
(19, '3b879fdc-52f0-11ee-8d71-b48c9d1b3686', '醋拌黄瓜', 'Vinegar mixed cucumber', '醋拌黄瓜是以黄瓜为主要食材的清爽家常凉拌菜，口感清脆爽口，操作简单，具有美容养颜功效，营养价值丰富。', 'Vinegar mixed cucumber is a refreshing and homely cold dish made mainly from cucumber. It has a crispy and refreshing taste, simple operation, beauty and beauty benefits, and rich nutritional value.', 1, 0, 0, 15, 1, '6.png', '0', 'g1'),
(20, '3b87d759-52f0-11ee-8d71-b48c9d1b3686', '蔬菜沙拉', 'green salad', '蔬菜沙拉是一道 以圆白菜、番茄、黄瓜等作为主要食材制作而成的美食。蔬菜沙拉是一种非常营养健康的饮食方法。', 'Vegetable salad is a delicacy made with cabbage, tomatoes, cucumbers, and other main ingredients. Vegetable salad is a very nutritious and healthy dietary method.', 1, 0, 0, 15, 1, '5.png', '0', 'g1'),
(21, '3b880716-52f0-11ee-8d71-b48c9d1b3686', '和牛烤串', 'Beef skewers', '烤串挑选上等牛肉，肉经炭火洗练，本就香气四溢，又因椒盐辣酱的增色，变得更加入味。', 'The skewers are made of high-quality beef, which is washed over charcoal fire and has a rich aroma. It is also enhanced by the color of spicy sauce, making it more flavorful.', 0, 1, 0, 15, 4, '4.png', '0', 'g1'),
(22, '3b8845ef-52f0-11ee-8d71-b48c9d1b3686', '铁板披萨', 'Iron plate pizza', '铁板披萨，外酥里嫩，口感丰富。外层酥略带脆，内心又有一份柔软，口感真的是刚刚好。在饼底外侧，咀嚼时还能感受到类似苏打饼干的香气。', 'Iron plate pizza, crispy on the outside and tender on the inside, with a rich taste. The outer layer is slightly crispy, while the inner layer has a softness, and the taste is really just right. On the outer side of the bottom of the cake, you can still feel the aroma similar to soda biscuits when chewing.', 1, 1, 0, 20, 1, '3.png', '0', 'g1'),
(23, '3b887d44-52f0-11ee-8d71-b48c9d1b3686', '香煎牛扒', 'Pan-fry steak', '铁板牛排是肉与铁盘碰撞出来的香气，切起来的牛排肉质细腻，柔软多汁，吃进嘴里，就能立刻感受到被酱汁唤醒的鲜嫩。', 'Iron plate steak is the aroma of meat colliding with iron plates. The cut steak is delicate, soft, and juicy, and once eaten, one can immediately feel the freshness awakened by the sauce.', 0, 1, 0, 22, 3, '0', '0', 'g1'),
(24, '3b88b5bb-52f0-11ee-8d71-b48c9d1b3686', '香浓骨头汤', 'Fragrant Bone Soup', '骨头汤是一道菜品，制作原料主要有扇子骨、直通骨、尾脊骨等，味道鲜美，香味浓郁。', 'Bone soup is a dish made mainly from ingredients such as fan bone, straight bone, and tailbone. It has a delicious taste and a rich aroma.', 0, 1, 0, 25, 2, '1.png', '0', 'g1'),
(25, '3b88db1b-52f0-11ee-8d71-b48c9d1b3686', '宫保鸡丁', 'Kung Pao Chicken', '宫保鸡丁', 'Kung Pao Chicken', 0, 1, 0, 33, 2, 'chicken.jpg', '0', 'g2'),
(26, '3b890ca2-52f0-11ee-8d71-b48c9d1b3686', '糖醋里脊', 'pork fillets with sweet&sour sauce', '糖醋里脊', 'pork fillets with sweet&sour sauce', 0, 1, 0, 20, 3, '糖醋里脊.jpg', '0', 'g2'),
(27, '3b8933c2-52f0-11ee-8d71-b48c9d1b3686', '红烧鲤鱼', 'braised common carp', '红烧鲤鱼', 'braised common carp', 0, 1, 1, 11, 2, '红烧鲤鱼.png', '0', 'g2'),
(28, '3b89668f-52f0-11ee-8d71-b48c9d1b3686', '回锅肉', 'saute pork in hot sauce', '回锅肉', 'saute pork in hot sauce', 0, 1, 0, 22, 3, '回锅肉.jpg', '0', 'g2'),
(29, '3b899803-52f0-11ee-8d71-b48c9d1b3686', '鱼香茄子', 'saute eggplant with fish flavor', '鱼香茄子', 'saute eggplant with fish flavor', 1, 0, 0, 33, 5, '鱼香茄子.jpg', '0', 'g2'),
(30, '3b89c882-52f0-11ee-8d71-b48c9d1b3686', '醋溜白菜', 'saute cabbage&pepper in sweet&sour sauce', '醋溜白菜', 'saute cabbage&pepper in sweet&sour sauce', 1, 0, 0, 20, 2, '醋溜白菜.jpg', '0', 'g2'),
(31, '3b89ee68-52f0-11ee-8d71-b48c9d1b3686', '凉拌黄豆芽', 'asdfsf', '凉拌黄豆芽', 'asdfsf', 1, 0, 0, 33, 5, '凉拌黄豆芽.jpg', '0', 'g2'),
(32, '3b8a1ea5-52f0-11ee-8d71-b48c9d1b3686', '韭菜炒蛋', 'saute leek sprouts&eggs', '韭菜炒蛋', 'saute leek sprouts&eggs', 1, 0, 0, 33, 5, '韭菜炒蛋.png', '0', 'g2'),
(33, '3b8a4366-52f0-11ee-8d71-b48c9d1b3686', '酸菜鱼', 'Boiled Fish with Sichuan Pickles ', '酸菜鱼', 'Boiled Fish with Sichuan Pickles ', 0, 1, 1, 33, 5, '酸菜鱼.jpg', '0', 'g2'),
(34, '3b8a78cc-52f0-11ee-8d71-b48c9d1b3686', '北京烤鸭', 'Peking Roast Duck', '北京烤鸭', 'Peking Roast Duck', 0, 1, 0, 33, 5, '北京烤鸭.jpg', '0', 'g2'),
(35, '3b8aa6cd-52f0-11ee-8d71-b48c9d1b3686', '麻婆豆腐', 'stwed beancurd with minced pork in pepper sauce', '麻婆豆腐', 'stwed beancurd with minced pork in pepper sauce', 1, 0, 0, 33, 5, '麻婆豆腐.png', '0', 'g2'),
(36, '3b8acc81-52f0-11ee-8d71-b48c9d1b3686', '鱼香肉丝', 'shredded pork with garlic sauce', '鱼香肉丝', 'shredded pork with garlic sauce', 0, 1, 0, 33, 5, '鱼香肉丝.jpg', '0', 'g2'),
(37, '3b8af7c4-52f0-11ee-8d71-b48c9d1b3686', '汉堡', 'Hambuger', '汉堡', 'Hambuger', 1, 1, 0, 20, 3, 'burger.jpg', '0', 'g3'),
(38, '3b8b1bd7-52f0-11ee-8d71-b48c9d1b3686', '塔克', 'Taco', '塔克', 'Taco', 1, 0, 0, 11, 2, 'nachos.jpg', '0', 'g3'),
(39, '3b8b47cd-52f0-11ee-8d71-b48c9d1b3686', '白切鸡', 'White cut chicken', '白切鸡', 'chicken', 0, 1, 0, 59, 3, '5795.jpg_wh1200.jpg', '0', 'g3'),
(40, '3b8b7814-52f0-11ee-8d71-b48c9d1b3686', '豆腐炒西兰花', 'Stir-fried broccoli with tofu', '豆腐炒西兰花', 'Stir-fried broccoli with tofu', 1, 0, 0, 19, 3, '0172.jpg_wh1200.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g3'),
(41, '3b8baa02-52f0-11ee-8d71-b48c9d1b3686', '凉拌鸡爪', 'Chilled chicken feet', '凉拌鸡爪', 'Chilled chicken feet', 0, 1, 0, 29, 3, '0194.jpg_wh1200.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g3'),
(42, '3b8bd5b1-52f0-11ee-8d71-b48c9d1b3686', '铁板肥肠', 'Iron plate fat sausage', '铁板肥肠', 'Iron plate fat sausage', 0, 1, 0, 69, 3, '0196.jpg_wh1200.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g3'),
(43, '3b8c0f4e-52f0-11ee-8d71-b48c9d1b3686', '藤椒鱼', 'Vine pepperfish', '藤椒鱼', 'Vine pepperfish', 0, 0, 1, 59, 3, '0203.jpg_wh1200.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g3'),
(44, '3b8c3ccd-52f0-11ee-8d71-b48c9d1b3686', '凉拌黄瓜', 'Chilled cucumber', '凉拌黄瓜', 'Chilled cucumber', 1, 0, 0, 9, 3, '1363.jpg_wh1200.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g3'),
(45, '3b8c70cd-52f0-11ee-8d71-b48c9d1b3686', '龙井虾仁', 'Longjing shrimp', '龙井虾仁', 'Longjing shrimp', 0, 1, 0, 39, 3, '2542.jpg_wh1200.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g3'),
(46, '3b8ca5bc-52f0-11ee-8d71-b48c9d1b3686', '烤鸭', 'Roast duck', '烤鸭', 'Roast duck', 0, 1, 0, 59, 3, '2634.jpg_wh1200.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g3'),
(47, '3b8cda1a-52f0-11ee-8d71-b48c9d1b3686', '粉蒸排骨', 'Steamed ribs', '粉蒸排骨', 'Steamed ribs', 0, 1, 0, 49, 3, '3298.jpg_wh1200.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g3'),
(48, '3b8d1813-52f0-11ee-8d71-b48c9d1b3686', '炒青菜', 'Stir-fried greens', '炒青菜', 'Stir-fried greens', 1, 0, 0, 12, 3, '炒青菜.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g3'),
(49, '3b8d529c-52f0-11ee-8d71-b48c9d1b3686', '牛排', 'Sirloin steak', '西冷牛排，取自牛腰部脊骨外面的肉，即后腰肉，也叫下腰肉；菲力牛排，取自牛腰部的小块里脊肉，也叫里脊肉、牛柳肉或腰内肉，这也是整头牛身上运动量最小的一块肌肉，每头牛只能切出几块菲力牛排，因此它的价格会比其它牛排略高一些', 'Sirloin steak, taken from the meat outside the spine of the beef loin, that is, the back loin, also called lower loin; Filet mignet, taken from the small tenderloin of the beef loin, also called tenderloin, beef fillet or inner loin, which is also the least moving muscle on the whole cow, each cow can only cut a few pieces of filet mign, so its price will be slightly higher than other steaks', 0, 1, 0, 60, 1, 'Breef.jpg', 'dcb82a74-3ac2-4fa1-86db-7cb8c9820016', 'g4'),
(50, '3b8d9186-52f0-11ee-8d71-b48c9d1b3686', '沙拉', 'Salad', '蔬菜沙拉是一道 以圆白菜、番茄、黄瓜等作为主要食材制作而成的美食。蔬菜沙拉是一种非常营养健康的饮食方法。首先它大多不必加热，这样会最大限度的保持住蔬菜中的各种营养不至于被破坏或流失。\r\n做蔬菜沙拉时，可在普通的蛋黄沙拉酱内加入适量的甜味鲜奶油，其制出的沙拉奶香味浓郁，甜味加重。蔬菜的种类数量可随个人口味随意增减，同时蔬菜沙拉原料要选新鲜蔬菜，蔬菜切后装盘，摆放时间不宜过长，否则会影响其美观，也会使蔬菜的营养降低。', 'Vegetable salad is a dish made with cabbage, tomatoes, cucumbers, etc. as the main ingredients. Vegetable salad is a very nutritious and healthy way to eat. First of all, most of it does not need to be heated, which will maximize the maintenance of various nutrients in the vegetables from being destroyed or lost.\r\nWhen making vegetable salad, you can add an appropriate amount of sweet whipped cream to the ordinary mayonnaise salad dressing, and the salad produced is rich in milk aroma and sweetness. The number of types of vegetables can be increased or decreased at will with personal taste, and the raw materials of vegetable salad should be selected fresh vegetables, vegetables cut and plated, and the placement time should not be too long, otherwise it will affect its beauty, and will also reduce the nutrition of vegetables.', 1, 0, 0, 10, 1, 'salad.jpg', '7487d6aa-17ca-4a5c-ad9e-5d25fe762e02', 'g4'),
(51, '3b8dd4b9-52f0-11ee-8d71-b48c9d1b3686', '汉堡包', 'hamburger', '最早的汉堡包主要由两片小圆面包夹一块牛肉饼组成。现代汉堡中除夹牛肉饼或其他肉饼外，还在圆面包的第二层中涂以黄油、芥末、番茄酱、沙拉酱等，再夹入番茄片、洋葱、酸黄瓜等食物，可以同时吃到主副食。其食用方便、风味可口、营养全面，成为畅销世界的主食之一。因为汉堡包热量高，含有大量脂肪，所以不适合减肥人群或高血压、高血脂人群过量食用。', 'The earliest hamburgers consisted mainly of two buns sandwiched with a piece of beef patty. In modern burgers, in addition to beef patties or other meatloaf, the second layer of the bun is coated with butter, mustard, tomato paste, salad dressing, etc., and then sandwiched with tomato slices, onions, sour cucumbers and other foods, you can eat the main food at the same time. It is convenient to eat, delicious in flavor and comprehensive in nutrition, and has become one of the best-selling staple foods in the world. Because hamburgers are high in calories and contain a lot of fat, they are not suitable for people who lose weight or people with high blood pressure and high blood lipids.', 1, 1, 1, 28, 2, 'burger.jpg', '22a8bf89-788a-4b44-9c6a-15649a71f7f6', 'g4'),
(52, '3b8e281a-52f0-11ee-8d71-b48c9d1b3686', '地锅鸡', 'Earth Pot Chicken', '徐州的地锅菜有着悠久的历史，其起源于苏北和鲁南交界处的微山湖地区。过去，在微山湖上作息的渔民们常常吃地锅饭。', 'Xuzhou\'s local pot cuisine has a long history, originating in the Weishan Lake area at the junction of northern Jiangsu and Lunan. In the past, fishermen working on Weishan Lake used to eat rice from the ground.', 0, 1, 0, 30, 4, '地锅鸡.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g4'),
(53, '3b8e60ac-52f0-11ee-8d71-b48c9d1b3686', '法棍面包', 'baguette', '法式长棍面包（baguette）是一种最传统的法式面包。法国面包的代表就是“棍子面包”，法语baguette的原意是“长条形的宝石”。法式长棍面包的配方很简单，只用面粉、水、盐和酵母四种基本原料，通常不加糖，不加乳粉，不加或几乎不加油、小麦粉。', 'The baguette is one of the most traditional forms of baguette. The representative of French bread is \"stick bread\", and the original meaning of French baguette is \"long jewel\". The recipe for baguads is simple, using only four basic ingredients, flour, water, salt and yeast, usually without sugar, milk powder, oil or wheat flour.', 1, 1, 0, 25, 1, '法棍面包.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g4'),
(54, '3b8e894b-52f0-11ee-8d71-b48c9d1b3686', '黄焖鸡', 'braised chicken rice', '黄焖鸡米饭又叫香辣鸡煲或浓汁香辣鸡煲饭，是鲁菜名吃，源自山东济南天桥区的传统名吃。色香味美，口感鲜嫩，透味不粘腻，香味浓郁。', 'Yellow stewed chicken rice, also known as spicy chicken pot or thick sauce spicy chicken claypot rice, is a famous dish of Lu cuisine, derived from the traditional name of Tianqiao District of Jinan, Shandong. The color and aroma are beautiful, the taste is tender, the taste is not sticky, and the aroma is rich.', 1, 1, 0, 15, 4, '黄焖鸡.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g4'),
(55, '3b8ebc4c-52f0-11ee-8d71-b48c9d1b3686', '红烧肉', 'Braised pork', '红烧肉（拼音： hóng shāo ròu），一道著名的大众菜肴，各大菜系都有自己特色的红烧肉。其以五花肉为制作主料，也可用猪后腿代替 [3] ，最好选用肥瘦相间的三层肉来做，锅具以砂锅为主，做出来的肉肥瘦相间，肥而不腻，香甜松软，营养丰富，入口即化。', 'Braised pork (pinyin: hóng shāo ròu), a famous popular dish, all major cuisines have their own characteristics of braised pork. It uses pork belly as the main ingredient, can also be used to replace the pig hind legs [3], it is best to use fat and lean three-layer meat to make, the pot is mainly casserole, the meat made is fat and lean, fat but not greasy, sweet and fluffy, rich in nutrition, melts in the mouth.', 1, 1, 0, 23, 1, '红烧肉.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g4'),
(56, '3b8ef12e-52f0-11ee-8d71-b48c9d1b3686', '麻辣香锅', 'spicy fragrant pot', '麻辣香锅（Spicy incense pot），发源于中国重庆市，是川渝地方麻辣风味菜品，为四川菜系 [1-2]。\r\n麻辣香锅以麻、辣、鲜、香、油、混搭为特点，口味多样化，多种食材可任意搭配', 'Spicy incense pot, originated in Chongqing, China, is a local spicy dish in Sichuan and Chongqing, which is Sichuan cuisine [1-2].\r\nThe spicy fragrant pot is characterized by hemp, spicy, freshness, fragrant, oily and mixed matching, with diversified flavors and a variety of ingredients that can be combined at will', 1, 1, 1, 25, 4, '麻辣香锅.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g4'),
(57, '3b8f2499-52f0-11ee-8d71-b48c9d1b3686', '酸汤肥牛', 'Sour soup fat beef', '酸汤肥牛，是很多川菜馆的常见名菜，属于川菜肥牛的品质自然是第一要素，但入乡随俗以后，酸汤至关重要是汤的调味，要酸辣得恰到好处。肥牛美味而且营养丰富，不仅提供丰富的蛋白质、铁、锌、钙，而且还是每天需要的维生素 B群，包括叶酸、维生素 B和核黄素等的最佳来源。吃肥牛可以配合海鲜和青菜，海鲜中含有丰富的蛋白质、铁和维生素，营养更丰富，更易于人体的吸收。', 'Sour soup fat beef is a common famous dish in many Sichuan restaurants, and the quality of Sichuan cuisine fat beef is naturally the first element, but after entering the countryside, the most important thing is the seasoning of the soup, and it must be sour and spicy just right. Fatty beef is delicious and nutritious, not only providing rich protein, iron, zinc, calcium, but also the best source of the B vitamins you need every day, including folate, B vitamins, and riboflavin. Eating fat beef can be combined with seafood and green vegetables, seafood is rich in protein, iron and vitamins, more nutrient-rich, and easier for the human body to absorb.', 1, 1, 0, 31, 4, '酸汤肥牛.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g4'),
(58, '3b8f5a55-52f0-11ee-8d71-b48c9d1b3686', '铁板鱿鱼', 'sizzling squid', '铁板鱿鱼是一道街边小吃，是用铁板把鱿鱼煎熟后，再用铁铲将鱿鱼切段，然后撒上特制酱做成。其主要原料是鱿鱼、洋葱、辣椒面，味道咸辣。铁板烧起源于日本,已经有40年的悠久历史,市场比较火。', 'Teppanyaki squid is a street food made by frying squid on an iron plate, cutting it into pieces with a shovel and sprinkling it with a special sauce. Its main ingredients are squid, onion, chili noodles, which have a salty and spicy taste. Teppanyaki originated in Japan and has a long history of 40 years, and the market is relatively popular.', 0, 0, 1, 12, 2, '铁板鱿鱼.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g4'),
(59, '3b8f9d9f-52f0-11ee-8d71-b48c9d1b3686', '狼牙土豆', 'Hot Potato Phips', '狼牙土豆是四川地区-四川省-乐山市的一种川菜风味小吃，由四川小吃“天蚕土豆”改进而来，多在街头巷尾摆摊设点，现炸现卖，在乐山是家喻户晓的饭后小食。 [1] 在其他地区也称之为炸洋芋，口味也不尽相同。\r\n主料为土豆，用特制刀具将土豆切成波浪外型，因恰似犬齿而得名，再配以其他时令蔬菜一起炸后再佐以其他香辛料拌食，香味四起，满街飘香，有很高的营养价值。因制作简单，价格便宜，深受当地市民的喜爱', 'Wolf tooth potato is a Sichuan cuisine style snack in Sichuan region - Sichuan Province - Leshan City, improved from Sichuan snack \"Tianjian potato\", mostly set up in the streets and alleys, fried and sold, in Leshan is a well-known after-dinner snack. [1] Also known as fried artichoke in other regions, the taste varies.\r\nThe main ingredient is potatoes, with a special knife to cut the potatoes into a wavy shape, named because it resembles canine teeth, and then fried with other seasonal vegetables and then mixed with other spices, the aroma is everywhere, the street is fragrant, and it has high nutritional value. Because of its simple production and low price, it is loved by local citizens', 1, 0, 0, 15, 2, '狼牙土豆.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g4'),
(60, '3b8fd4e9-52f0-11ee-8d71-b48c9d1b3686', '松子桂鱼', 'Pine nut cinnamon', '松子桂鱼是一道经典的地方名菜。此菜酸甜咸适口，营养丰富。以桂鱼、松仁、玉米、青豆、番茄沙司、白糖、食盐为主要原料制作而成，具有开胃助消化之功效。', 'Pine nut cinnamon is a classic local dish. This dish is sweet, sour, salty and nutritious. It is made with cinnamon fish, pine nuts, corn, green beans, tomato sauce, sugar, and salt as the main raw materials, which has the effect of appetizing and aiding digestion', 0, 0, 1, 38, 1, '松子桂鱼.jpeg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g4'),
(61, '3b902b93-52f0-11ee-8d71-b48c9d1b3686', 'burger', 'burger', 'burger have meat and vegetarian', 'burger have meat and vegetarian', 0, 1, 0, 20, 3, 'burger.jpg', '0', 'g5'),
(62, '3b90608a-52f0-11ee-8d71-b48c9d1b3686', 'nachos', 'nachos', 'nachos have vegetarian', 'nachos have vegetarian', 1, 0, 0, 11, 2, 'nachos.jpg', '0', 'g5'),
(63, '3b90a049-52f0-11ee-8d71-b48c9d1b3686', 'Grilled fish', 'Grilled fish', 'Grilled fish have all', 'Grilled fish have all', 0, 0, 1, 22, 3, 'Grilled fish.png', '0', 'g5'),
(64, '3b90db3c-52f0-11ee-8d71-b48c9d1b3686', 'Green  salad ', 'Green  salad ', 'Green  salad have vegetarian', 'Green  salad have vegetarian', 1, 0, 0, 12, 0, 'Green  salad.png', '49f51333-f47f-11ed-b7a0-a4badbfbb15c', 'g5'),
(65, '3b91179e-52f0-11ee-8d71-b48c9d1b3686', 'Turkey leg', 'Turkey leg', 'Turkey leg have meat', 'Turkey leg have meat', 0, 1, 0, 20, 1, 'Turkey leg.png', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g5'),
(66, '3b915142-52f0-11ee-8d71-b48c9d1b3686', 'steak', 'steak ', 'steak have meat', 'steak have meat', 0, 1, 0, 45, 2, 'steak.png', '0', 'g5'),
(67, '3b9194f6-52f0-11ee-8d71-b48c9d1b3686', 'Fried duck', 'Fried duck', 'Fried duck have meat', 'Fried duck have meat', 0, 1, 0, 34, 2, 'Fried duck.png', '0', 'g5'),
(68, '3b91d011-52f0-11ee-8d71-b48c9d1b3686', 'Fish and chips\r\n', 'Fish and chips', 'Fish and chips have fish', 'Fish and chips have fish', 0, 0, 1, 20, 3, 'Fish and chips.png', '0', 'g5'),
(69, '3b920e38-52f0-11ee-8d71-b48c9d1b3686', 'Lamb chop', 'Lamb chop', 'Lamb chop have meat\r\n', 'Lamb chop have meat', 0, 1, 0, 45, 4, 'Lamb chop.png', '0', 'g5'),
(70, '3b924020-52f0-11ee-8d71-b48c9d1b3686', 'Boiled broccoli ', 'Boiled broccoli ', 'Boiled broccoli have vegetarian', 'Boiled broccoli have vegetarian', 1, 0, 0, 10, 0, 'Boiled broccoli.png', '0', 'g5'),
(71, '3b9280a9-52f0-11ee-8d71-b48c9d1b3686', 'bouillabaisse ', 'bouillabaisse ', 'bouillabaisse have meat', 'bouillabaisse have meat', 0, 1, 0, 34, 4, 'bouillabaisse.png', '0', 'g5'),
(72, '3b92ba83-52f0-11ee-8d71-b48c9d1b3686', 'Cream of mushroom soup ', 'Cream of mushroom soup ', 'Cream of mushroom soup have vegetarian', 'Cream of mushroom soup have vegetarian', 1, 0, 0, 23, 0, 'Cream of mushroom soup.png', '0', 'g5'),
(73, '3b92f86c-52f0-11ee-8d71-b48c9d1b3686', '红烧肉', 'braised pork in brown sauce', '红烧肉', 'braised pork in brown sauce', 0, 1, 0, 60, 1, 'hsr.jpg', '0', 'g6'),
(74, '3b932d92-52f0-11ee-8d71-b48c9d1b3686', '粉蒸肉', 'Steamed Pork with Rice Flour', '粉蒸肉', 'Steamed Pork with Rice Flour', 0, 1, 0, 60, 1, 'fzr.jpg', '0', 'g6'),
(75, '3b935d30-52f0-11ee-8d71-b48c9d1b3686', '糖醋里脊', 'Sweet and sour pork tenderloin', '糖醋里脊', 'Sweet and sour pork tenderloin', 0, 1, 0, 55, 1, 'tclj.jpg', '0', 'g6'),
(76, '3b938c70-52f0-11ee-8d71-b48c9d1b3686', '红烧狮子头', 'Stewed Pork Ball in Brown Sauce in brown sauce', '红烧狮子头', 'Stewed Pork Ball in Brown Sauce in brown sauce', 0, 1, 0, 35, 1, 'hsszt.jpg', '0', 'g6'),
(77, '3b93bbe4-52f0-11ee-8d71-b48c9d1b3686', '白切鸡', 'white cut chicken', '白切鸡', 'white cut chicken', 0, 1, 0, 70, 1, 'bqj.jpg', '0', 'g6'),
(78, '3b93f0b0-52f0-11ee-8d71-b48c9d1b3686', '开水白菜', 'Boiled cabbage', '水煮白菜', 'Boiled cabbage', 1, 0, 0, 25, 1, 'ksbc.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g6'),
(79, '3b942118-52f0-11ee-8d71-b48c9d1b3686', '文思豆腐', 'Wensi Tofu', '文思豆腐为扬州名菜', 'Wensi Tofu', 1, 0, 0, 35, 1, 'wsdf.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g6'),
(80, '3b945117-52f0-11ee-8d71-b48c9d1b3686', '西芹百合炒腰果', 'Fried Cashew with Celery and Lily', '西芹百合炒腰果', 'Fried Cashew with Celery and Lily', 1, 0, 0, 30, 1, 'xqbccyg.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g6'),
(81, '3b9481bf-52f0-11ee-8d71-b48c9d1b3686', '地三鲜', 'Ground three fresh vegetables', '地三鲜', 'Ground three fresh vegetables', 1, 0, 0, 32, 1, 'dsx.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g6'),
(82, '3b94b836-52f0-11ee-8d71-b48c9d1b3686', '炝黄瓜条', 'Stir fried cucumber strips', '炝黄瓜条', 'Stir fried cucumber strips', 1, 0, 0, 15, 1, 'qhgt.jpg', '0', 'g6'),
(83, '3b94f1a3-52f0-11ee-8d71-b48c9d1b3686', '软兜鳝鱼', 'Braised Eel in Brown Sauce', '软兜鳝鱼', 'Braised Eel in Brown Sauce', 0, 0, 1, 80, 1, 'rdsy.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g6'),
(84, '3b95206f-52f0-11ee-8d71-b48c9d1b3686', '松鼠鳜鱼', 'Squirrel Mandarin Fish', '松鼠鳜鱼', 'Squirrel Mandarin Fish', 0, 0, 1, 125, 1, 'ssgy.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g6'),
(85, '3b954fa3-52f0-11ee-8d71-b48c9d1b3686', '酸菜鱼', 'Pickled Chinese cabbage Fish', '酸菜鱼', 'Pickled Chinese cabbage Fish', 0, 0, 1, 90, 3, 'scy.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g6'),
(86, '3b9580d8-52f0-11ee-8d71-b48c9d1b3686', '红烧鲫鱼', 'Braised crucian carp in brown sauce', '红烧鲫鱼', 'Braised crucian carp in brown sauce', 0, 0, 1, 80, 1, 'hsjy.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g6'),
(87, '3b95afca-52f0-11ee-8d71-b48c9d1b3686', '水煮鱼片', 'Boiled Fish Fillet in Water', '水煮鱼片', 'Boiled Fish Fillet in Water', 0, 0, 1, 100, 4, 'szyp.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g6'),
(88, '3b95dd4f-52f0-11ee-8d71-b48c9d1b3686', '轻食', 'Light Meals', '减肥', 'a good choice to lose weight!', 1, 0, 0, 25, 1, '0.jpg', '0', 'g7'),
(89, '3b960e7d-52f0-11ee-8d71-b48c9d1b3686', '轻食2', 'LightMeals2', '减肥增肌', 'lose weight and strength body', 1, 1, 0, 30, 2, '4.jpg', '0', 'g7'),
(90, '3b963ee7-52f0-11ee-8d71-b48c9d1b3686', '煎蛋', 'fry egg', '煎蛋', 'fry egg by oil，delicious！~\r\n', 0, 1, 0, 5, 1, '3.jpg', '0', 'g7'),
(91, '3b966e19-52f0-11ee-8d71-b48c9d1b3686', '狮子头/肉丸', 'large meatball', '由猪肉做成，包裹着浓郁的汤汁', 'large meatball is made of pork,wrapped in a rich broth', 0, 1, 0, 15, 1, '6.jpg', '0', 'g7'),
(92, '3b96a5c5-52f0-11ee-8d71-b48c9d1b3686', '烤串', 'kebab', '烧烤各种蔬菜，肉等', 'Grilled vegetables and meat', 0, 0, 1, 20, 2, '2.jpg', '0', 'g7'),
(93, '3b96d66f-52f0-11ee-8d71-b48c9d1b3686', '芒果小蛋糕', 'mango cake', '由水果，奶油，面包胚做成的小蛋糕', 'The cake made of fruit,cream,and bread embray', 1, 0, 0, 123, 5, '8.jpg', '0', 'g7'),
(94, '3b9706b0-52f0-11ee-8d71-b48c9d1b3686', '水果', 'Fruit', '香蕉，猕猴桃，芒果', 'banana， kiwi fruit，mango', 1, 0, 0, 10, 1, '11.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g7'),
(95, '3b973555-52f0-11ee-8d71-b48c9d1b3686', '火锅', 'hot pot', '聚餐好选择', 'hot pot，all people eat together', 0, 1, 1, 50, 5, '9.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g7'),
(96, '3b97714c-52f0-11ee-8d71-b48c9d1b3686', '寿司', 'Arctic sushi', '寿司由米饭和鱼肉做成', 'sushi is made of rice and fish', 0, 1, 1, 10, 2, '10.jpg', '0', 'g7'),
(97, '3b97a569-52f0-11ee-8d71-b48c9d1b3686', '小龙虾', 'lobsters', '清蒸小龙虾，蘸取酱汁食用', 'steamed crayfish,edible when dipped in a sauce', 0, 1, 0, 50, 3, '7.jpg', '0', 'g7'),
(98, '3b97cee4-52f0-11ee-8d71-b48c9d1b3686', '红烧鱼', 'Braised fish in brown sauce', '红烧鱼', 'Braised fish is made of a whole fish', 0, 0, 1, 30, 2, '5.jpg', '0', 'g7'),
(99, '3b97fcd6-52f0-11ee-8d71-b48c9d1b3686', '水果捞', 'fruit', '水果加酸奶', 'All kinds of fruits and yogurt', 1, 0, 0, 25, 1, '12.jpg', '0', 'g7'),
(100, '3b983640-52f0-11ee-8d71-b48c9d1b3686', '辣子鸡', 'Spicy Chicken', '辣子鸡是一道具有中国传统口味的川菜，将鸡肉切成小块后用干辣椒和花椒等辣香料炒制而成。这道菜香辣可口，口感酥脆，是许多人喜爱的美食之一。', 'Spicy diced chicken, or \"La Zi Ji\" in Chinese, is a traditional Sichuan dish that features diced chicken stir-fried with dried red chili peppers and Sichuan peppercorns. It is known for its spicy and crispy taste, and is a beloved dish among many people.', 0, 1, 0, 56, 5, '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', '0', 'g11'),
(101, '3b986824-52f0-11ee-8d71-b48c9d1b3686', '红烧肉', 'Braised Pork Belly', '红烧肉是中国菜肴中的一道经典名菜，主要材料是猪五花肉，口味偏咸甜，色泽呈红褐色，肉质酥烂入味，香气扑鼻。', 'Braised Pork Belly is a classic Chinese dish made primarily with pork belly. It has a salty-sweet flavor, a reddish-brown color, and its meat is tender and flavorful with an aromatic scent.', 0, 1, 0, 48, 2, '0a3b3288-3446-4420-bbff-f263d0c02d8e.jpg', '0', 'g11'),
(102, '3b989fa8-52f0-11ee-8d71-b48c9d1b3686', '鱼香肉丝', 'shredded pork with garlic sauce', '鱼香肉丝是一道川菜，由瘦肉和蔬菜切成丝状，加入豆瓣酱、甜面酱、辣椒酱等多种调料，翻炒制成，口味咸、酸、甜、辣、鲜美。', '\"Yuxiang rou si\" is a Sichuan cuisine dish made by stir-frying thin-sliced meat and vegetables with various seasonings such as doubanjiang, tianmianjiang, and chili sauce. The dish has a salty, sour, sweet, spicy, and savory taste.', 0, 1, 0, 28, 2, '0f252364-a561-4e8d-8065-9a6797a6b1d3.jpg', 'a028a409-fada-11ed-a0bf-002b67cb6b82', 'g11'),
(103, '3b98dcfc-52f0-11ee-8d71-b48c9d1b3686', '松鼠鳜鱼', 'Squirrel mandarin fish', '松鼠鳜鱼，又名松鼠桂鱼，为苏帮菜中色香味兼具的代表之作，相传乾隆皇帝下江南，微服至苏州松鹤楼菜馆用膳，厨师用鲤鱼出骨，在鱼肉上刻花纹，加调味稍腌后，拖上蛋黄糊，入热油锅嫩炸成熟后，浇上熬热的糖醋卤汁，形状似鼠，外脆里嫩，酸甜可口，乾隆皇帝吃后很满意，后名扬苏州。', 'Squirrel mandarin fish, also known as Squirrel Guiyu, is a representative dish of Su-style cuisine that combines color, fragrance, and taste. The chef removes the bones from carp meat, carves patterns on the fish, adds seasoning and marinates it slightly. Then the fish is coated with egg yolk and deep-fried until tender. Finally, it is coated with hot sweet and sour sauce and shaped like a squirrel with a crispy exterior and tender interior. It is deliciously sweet and sour.', 0, 0, 1, 108, 1, '20230525_191515.png', '0', 'g11'),
(104, '3b991df0-52f0-11ee-8d71-b48c9d1b3686', '文思豆腐', 'Tofu of Artistic Conception', '文思豆腐起源于扬州，淮安。是江苏省的一道传统特色名菜，属于苏菜系-淮扬菜，该菜品拥有悠久的历史，其选料极严，刀工精细，软嫩清醇，入口即化，同时具有调理营养不良、补虚养身等功效。', '\"Wensidoufu\" originated from Yangzhou and Huai\'an, and is a traditional and characteristic dish in Jiangsu Province, belonging to the Huaiyang cuisine. This dish has a long history, extremely strict ingredient selection, fine knife work, soft and tender texture, melts in the mouth, and has the effects of nourishing the body and supplementing deficiencies. It is also effective in regulating nutrition and improving health.', 1, 0, 0, 38, 1, '屏幕截图_20230525_193414.png', 'a028a409-fada-11ed-a0bf-002b67cb6b82', 'g11'),
(105, '3b996247-52f0-11ee-8d71-b48c9d1b3686', '麻辣兔头', 'Spicy Rabbit Head', '麻辣兔头是一道以兔头为主料，干辣椒为辅料，香料、精炼油等为调料制作的菜品，是四川成都特色名小吃之一。', 'Spicy Rabbit Head is a specialty snack in Chengdu, Sichuan, which is made of rabbit head as the main ingredient, accompanied by dried chili peppers as the secondary ingredient and seasoned with various spices and refined oil.', 0, 1, 0, 9, 4, '2a2e9d66-b41d-4645-87bd-95f2cfeed218.jpg', 'a028a409-fada-11ed-a0bf-002b67cb6b82', 'g11'),
(106, '3b999e3b-52f0-11ee-8d71-b48c9d1b3686', '临高烤乳猪', 'Lingao Roasted Suckling Pig', '临高烤乳猪是一道广东传统美食，主要原材料为乳猪，并以临高烤制方法为名。将乳猪去毛、去内脏后，再从肚子切开填入调料，放入大炉中烤制，直到皮酥肉嫩、香味四溢。这道菜肴色泽金黄，脆皮外酥里嫩，是一道集烤、蒸、煮、炸等多种方式于一体的高难度传统烹饪技艺。', 'Lingao Roasted Suckling Pig is a traditional Cantonese delicacy made with suckling pig using the Lingao roasting method. The pig is first prepared by removing its fur and internal organs, then seasoned and stuffed before being roasted in a large oven until the skin is crispy, the meat is tender, and the aroma is fragrant. This dish has a golden color and a crispy skin with tender meat inside, showcasing a high-degree of traditional cooking techniques that involve roasting, steaming, boiling, frying, and more.', 0, 1, 0, 258, 1, '2e96a7e3-affb-438e-b7c3-e1430df425c9.jpeg', 'a028a409-fada-11ed-a0bf-002b67cb6b82', 'g11'),
(107, '3b99e211-52f0-11ee-8d71-b48c9d1b3686', '白切鸡', 'White cut chicken', '白切鸡是一道广受欢迎的中华菜肴，主要食材为鸡肉，烹制后色泽洁白、口感嫩滑，通常搭配姜葱油、酱油等调料食用。', 'White cut chicken is a popular Chinese dish. It is mainly made from chicken and has a white color and tender texture after cooking. It is usually served with condiments such as ginger and scallion oil, soy sauce, etc.', 0, 1, 0, 48, 1, '9ec6fc2d-50d2-422e-b954-de87dcd04198.jpeg', 'a028a409-fada-11ed-a0bf-002b67cb6b82', 'g11'),
(108, '3b9a2d44-52f0-11ee-8d71-b48c9d1b3686', '清补凉', 'sweet mung bean soup with rice balls', '清补凉是一种传统的中国甜品，它由绿豆汤和糯米球组成。绿豆汤是用绿豆熬制而成的甜汤，常常加入冰块来食用。糯米球则是用糯米粉制作成的小圆球，通常搭配绿豆汤一起食用，口感QQ软糯，甜而不腻，是夏季清凉解暑的好选择。', 'a traditional Chinese sweet soup made with mung bean and rice balls. The mung bean soup is a sweet soup made from boiled mung beans and is often served cold with ice cubes. The rice balls are small, chewy balls made from glutinous rice flour and are typically served together with the mung bean soup. Qing Bu Liang is sweet but not too heavy, and makes for a refreshing summer dessert that can help relieve heat and cool down the body.', 1, 0, 0, 18, 1, '屏幕截图_20230525_220123.png', 'a028a409-fada-11ed-a0bf-002b67cb6b82', 'g11'),
(109, '3b9aa2e4-52f0-11ee-8d71-b48c9d1b3686', '血肠', 'Blood sausage', '血肠是北方人的传统食品，宰猪（羊）时，用大盆装些盐水接血，然后搅拌血液，使其不凝固，拌上剁碎的猪（羊）肉和洋葱末、盐、姜粉、胡椒粉等调料后灌肠，扎紧捆实，放入锅中煮制即成。\r\n切片趁热食用，或做酸菜时血肠白肉同时放入，血肠味道浓香，油而不腻。', 'Blood sausage is a traditional food of northern people. When slaughtering pigs (sheep), a large basin is filled with salt water to collect the blood, and then the blood is stirred to prevent it from solidifying. Chopped pig (sheep) meat and seasonings such as onion powder, salt, ginger powder, and pepper are mixed with the sausage, tightly tied, and cooked in a pot.\r\nSlice and eat while hot, or add the blood sausage and white meat at the same time when making pickled Chinese cabbage. The blood sausage has a strong flavor and is not greasy.', 0, 1, 0, 36, 2, '2a50628e-7758-4c51-9fbb-d37c61cdacad.jpg', 'a028a409-fada-11ed-a0bf-002b67cb6b82', 'g11'),
(110, '3b9af1a1-52f0-11ee-8d71-b48c9d1b3686', '炒菠菜', 'stir-fried spinach', '炒菠菜是一道常见的中式家常菜，将新鲜或者解冻的菠菜叶子洗净后，用油热锅爆香蒜末和姜丝，加入菠菜略炒，最后加适量盐、味精等调料，再翻炒数下即可。这道菜口感嫩绿，清香可口，富含多种维生素，是一道营养丰富的素菜。', 'This is a common Chinese home-cooked dish. Fresh or thawed spinach leaves are washed, then fried briefly with hot oil and fragrant minced garlic and grated ginger. Finally, add appropriate amounts of salt, MSG, and other spices, and stir-fry for a few more seconds. This dish has a tender green texture, a refreshing taste, and is rich in various vitamins. It\'s a nutritious vegetable dish.', 1, 0, 0, 18, 1, '屏幕截图_20230525_223033.png', 'a028a409-fada-11ed-a0bf-002b67cb6b82', 'g11'),
(111, '3b9b3012-52f0-11ee-8d71-b48c9d1b3686', '西湖醋鱼', 'West Lake Fish in Vinegar Gravy', '西湖醋鱼主以草鱼等食材用料烹制，色泽红亮，肉质鲜嫩，酸甜清香，口感软嫩，带有蟹味。', 'West Lake Fish in Vinegar Sauce is mainly cooked with grass carp and other ingredients. It is bright red in color, fresh and tender in meat, sweet and sour in fragrance, soft and tender in taste, with a crab flavor.', 0, 0, 1, 188, 1, '屏幕截图_20230525_223353.png', 'a028a409-fada-11ed-a0bf-002b67cb6b82', 'g11'),
(112, '3b9b6b69-52f0-11ee-8d71-b48c9d1b3686', '回锅肉', 'twice-cooked pork', '非常好吃', 'very dilicious', 0, 1, 0, 12, 1, 'QQ图片20230528220310.jpg', '0', 'g12'),
(113, '3b9ba615-52f0-11ee-8d71-b48c9d1b3686', '闷鸡腿', 'Stewed Chicken Leg', '非常好吃', 'very dilicious', 0, 1, 0, 12, 1, 'QQ图片20230528220306.jpg', '0', 'g12'),
(114, '3b9bde26-52f0-11ee-8d71-b48c9d1b3686', '红烧肉', 'braised pork in brown sauce', '非常好吃', 'very dilicious', 0, 1, 0, 15, 1, 'QQ图片20230528220302.jpg', '0', 'g12'),
(115, '3b9c1ad7-52f0-11ee-8d71-b48c9d1b3686', '青椒肉丝', 'shredded pork with green pepper', '非常好吃', 'very dilicious', 0, 1, 0, 12, 2, 'QQ图片20230528220257.jpg', '0', 'g12'),
(116, '3b9c5593-52f0-11ee-8d71-b48c9d1b3686', '青椒炒鸡蛋', 'Green Pepper Eggs', '非常好吃', 'very dilicious', 1, 0, 0, 12, 2, 'QQ图片20230528220253.jpg', '0', 'g12'),
(117, '3b9c8fa2-52f0-11ee-8d71-b48c9d1b3686', '金玉满堂', 'gold and jade fill the hall', '非常好吃', 'very dilicious', 1, 0, 0, 15, 1, 'QQ图片20230528220248.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g12'),
(118, '3b9cbcf5-52f0-11ee-8d71-b48c9d1b3686', '秋葵鸡蛋', 'Okra eggs', '非常好吃', 'very dilicious', 1, 0, 0, 15, 1, 'QQ图片20230528220242.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g12'),
(119, '3b9ced3d-52f0-11ee-8d71-b48c9d1b3686', '西红柿土豆', 'Tomatoes and potatoes', '非常好吃', 'very dilicious', 1, 0, 0, 12, 1, 'b729-hpinryc9399003.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g12'),
(120, '3b9d21b9-52f0-11ee-8d71-b48c9d1b3686', '红烧鱼', 'red-cooked fish', '非常好吃', 'very dilicious', 0, 0, 1, 12, 1, 'QQ图片20230528220237.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g12'),
(121, '3b9d55f2-52f0-11ee-8d71-b48c9d1b3686', '清蒸鱼', 'steamed fish', '非常好吃', 'very dilicious', 0, 0, 1, 12, 1, 'QQ图片20230528220232.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g12'),
(122, '3b9d87ab-52f0-11ee-8d71-b48c9d1b3686', '麻辣鱼片', 'Spicy Fish Fillet', '非常好吃', 'very dilicious', 0, 0, 1, 12, 5, 'QQ图片20230528220224.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g12'),
(123, '3b9dc81d-52f0-11ee-8d71-b48c9d1b3686', '烤鱼', 'grill', '非常好吃', 'very dilicious', 0, 0, 1, 12, 4, 'QQ图片20230528220217.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g12'),
(124, '3b9e03fd-52f0-11ee-8d71-b48c9d1b3686', '黄山臭桂鱼', 'Huangshan stinky Mandarin fish', '当年某徽商坐船回家探亲，因为路远天热，携带的桂鱼未保存好发臭了，妻子舍不得丢弃，用浓油赤酱处理了一下，没想到歪打正着，味道竟然好极了。徽商借此推广，这道菜竟然成了徽菜经典', 'When a Hui merchant went home by ship to visit relatives, because the road was far away and the day was hot, the osmanthus fish he carried was not preserved and stinky. His wife did not want to discard it, so he treated it with thick red sauce. Hui merchants take this promotion, this dish has become a classic of Hui cuisine', 1, 0, 1, 40, 3, '微信图片_20230526115550.png', '0', 'g13'),
(125, '3b9e464e-52f0-11ee-8d71-b48c9d1b3686', '佛跳墙', 'Steamed Abalone with Shark‘s Fin and Fish Maw inBroth', '佛跳墙，又名“满坛香”、“福寿全”，是福州的首席名菜，原料有18种之多：海参、鲍鱼、鱼翅、干贝、鱼唇、花胶、蛏子、火腿、猪肚、羊肘、蹄尖、蹄筋、鸡脯、鸭脯、鸡肫、鸭肫、冬菇、冬笋等，具有补气养血、清肺润肠、防治虚寒等功效。', 'Fo Tiao wall, also known as \"Man Tan Xiang\", \"Fu Shou whole\", is the chief food in Fuzhou, raw materials have 18 kinds of: sea cucumber, abalone, shark fin, scallop, fish lip, flower gum, razor clam, ham, pig maw, lamb\'s elbow, hoof tip, tendon, chicken breast, duck breast, chicken gizzard, duck gizzard, mushroom, bamboo shoots, with qi nourishing blood, clear lung run intestine, prevention and treatment of virtual cold effect.', 0, 1, 1, 70, 2, '微信图片_20230526115913.png', '0', 'g13'),
(126, '3b9e8168-52f0-11ee-8d71-b48c9d1b3686', '河西羊羔肉', 'Hexi lamb', '河西羊羔，体大，肉鲜嫩，肥美而不膻，滋补效用极佳。', 'Hexi Lamb, large body, tender meat, fat and not mutton, nourishing effect is excellent.', 0, 1, 0, 60, 3, '微信图片_20230526120112.png', '0', 'g13'),
(127, '3b9ec129-52f0-11ee-8d71-b48c9d1b3686', '剁椒鱼头', 'Chopped fish head with pepper', '以鱼头的“味鲜”和剁椒的“辣”为一体，风味独具一格。菜品色泽红亮，肉质细嫩，鲜辣适口', 'To fish head \"taste fresh\" and chop pepper \"hot\" as one, unique flavor. Dishes bright red color, tender meat, fresh spicy palpable', 0, 0, 1, 30, 5, '微信图片_20230526120259.png', '0', 'g13'),
(128, '3b9f018c-52f0-11ee-8d71-b48c9d1b3686', '红烧肉', 'Braised Pork', '红烧肉的原料选用的是猪五花三层，经过制作之后，美味不可用言语来形容，肥而不腻，堪称中华美食中的一道经典菜式。', 'The raw material of braised pork is three layers of pork belly. After production, it is delicious without words to describe, fat but not greasy. It is a classic dish in Chinese cuisine.', 0, 1, 0, 40, 2, '联想截图_20230526120419.png', '0', 'g13'),
(129, '3b9f3b2c-52f0-11ee-8d71-b48c9d1b3686', '北京烤鸭', 'Beijing Roast Duck', '北京烤鸭被誉为“天下美味”。它以色泽红艳，肉质细嫩，味道醇厚，肥而不腻的特色驰名中外', 'Beijing Roast duck is known as \"the world\'s delicious\". It is famous at home and abroad for its red color, tender meat, mellow taste, fat but not greasy characteristics', 0, 1, 0, 50, 3, '微信图片_20230526115215.png', '0', 'g13'),
(130, '3b9f7833-52f0-11ee-8d71-b48c9d1b3686', '麻婆豆腐', 'Mapo tofu', '主要原料由豆腐构成，其特色在于“麻、辣、烫、香、酥、嫩、鲜、活”八字，称之为八字箴言', 'The main raw material is made of tofu, which is characterized by \"numbing, spicy, hot, fragrant, crisp, tender, fresh and alive\". It is called the eight-character motto', 1, 0, 0, 10, 3, '联想截图_20230526120618.png', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g13'),
(131, '3b9fb381-52f0-11ee-8d71-b48c9d1b3686', '辣子鸡', 'Sautéed Diced Chicken with Chili Pepper', '辣椒中夹杂着干粑粑的鸡肉块，上面撒上了芝麻，看起来很有食欲，吃起来鸡肉外酥里嫩，还有芝麻的清香，辣中带麻。', 'The chicken pieces with dried papa mixed with chilies and sprinkled with sesame seeds look appetising, and the chicken tastes crisp on the outside and tender on the inside, with the fragrance of sesame, hot and numbing.', 0, 1, 0, 30, 3, '联想截图_20230526121108.png', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g13'),
(132, '3b9ff8d9-52f0-11ee-8d71-b48c9d1b3686', '香菇油菜', 'Mushroom rape', '香菇素有蘑菇皇后的美称，香菇中富含18种氨基酸，具有易吸收的特点，活性非常高，18种氨基酸中含有人体必备的七种氨基酸。油菜这道菜具有低脂肪的特点，富含丰富的膳食纤维，具有降血脂通肠便的效果，香菇油菜这道菜是两种高营养蔬菜的结合体，口感爽口解腻。', 'Lentinus has the reputation of the queen of mushrooms. Lentinus edodes are rich in 18 kinds of amino acids, which are easy to absorb and have very high activity. The 18 kinds of amino acids contain seven kinds of amino acids necessary for human body. Rape this dish has the characteristics of low fat, rich in dietary fiber, has the effect of lowering blood fat and bowel bowel stool, mushroom rape this dish is the combination of two kinds of high nutrition vegetables, refreshing taste and greasy.', 1, 0, 0, 10, 3, '联想截图_20230526121344.png', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g13'),
(133, '3ba04044-52f0-11ee-8d71-b48c9d1b3686', '蔬菜沙拉', 'Green salad', '蔬菜沙拉是一道 以圆白菜、番茄、黄瓜等作为主要食材制作而成的美食。蔬菜沙拉是一种非常营养健康的饮食方法。首先它大多不必加热，这样会最大限度的保持住蔬菜中的各种营养不至于被破坏或流失', 'Vegetable salad is a dish made of cabbage, tomato, cucumber and other main ingredients. Vegetable salad is a very nutritious and healthy way to eat. First of all, most vegetables do not need to be heated, which maximizes the ability to keep the various nutrients in the vegetables from being destroyed or lost', 1, 0, 0, 10, 3, '联想截图_20230526121713.png', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g13'),
(134, '3ba087a0-52f0-11ee-8d71-b48c9d1b3686', '红烧狮子头', 'Braised Pork Ball in Brown Sauce', '红烧狮子头，是中国逢年过节常吃的一道菜，有肥有瘦的肉红润油亮，配上翠绿青菜掩映，醇香味浓，也称四喜丸子，取其吉祥之意。', 'Braised lion\'s head is a dish often eaten during Chinese New Year festivals. The fat and lean meat is red and bright, and accompanied by green vegetables, mellow and rich taste. It is also called Sixi meatballs, which means auspiciousness.', 1, 1, 0, 30, 3, '联想截图_20230526121934.png', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g13'),
(135, '3ba0c5ca-52f0-11ee-8d71-b48c9d1b3686', '过油肉', 'Oily meat', '最初它是一个官府名菜，后来传到了太原一带，并逐渐在山西传播开来。此菜以色泽金黄鲜艳，味道咸鲜闻有醋意，质感外软里嫩，汁芡适量透明，稍有明油为特色', 'At first, it was a famous dish of the government. Later, it spread to the Taiyuan area and gradually spread in Shanxi. This dish with bright yellow color, taste salty smell of vinegar, soft texture, tender juice thicken appropriate transparent, a little bright oil for the characteristics', 1, 1, 0, 20, 3, '联想截图_20230526122119.png', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g13'),
(136, '3ba10c17-52f0-11ee-8d71-b48c9d1b3686', '炸鱼薯条', 'Fish and chips', '炸鱼薯条是一道热菜，由面糊炸鱼和薯条组成。这道菜起源于英国，这两种成分是从不同的移民文化中引入的；不知道是谁结合了它们。通常被认为是英国的国菜，鱼和薯条是许多其他国家的常见外卖食品，尤其是英语国家和英联邦国家。', 'Fish and chips is a hot dish consisting of fried fish in batter, served with chips. The dish originated in England, where these two components had been introduced from separate immigrant cultures; it is not known who combined them. Often considered Britain\'s national dish, fish and chips is a common takeaway food in numerous other countries, particularly English-speaking and Commonwealth nations.', 0, 0, 1, 8, 1, 'Fish_and_chips_blackpool.jpg', '0', 'g14'),
(137, '3ba14968-52f0-11ee-8d71-b48c9d1b3686', '牧羊人派', 'Shepherd\'s Pie', '牧羊人派是一顿丰盛的大餐,底层是肉——通常 是剁碎的或切块的羊肉——与洋葱和其他蔬菜一起在浓郁的肉汁中烹制。然后在上面放上一层厚厚的土豆泥并烘烤。\r\n', 'Shepherd\'s Pie is a hearty meal containing a bottom layer of meat一usually minced or diced lamb - cooked with onions and other vegetables in a rich gravy. It\'s then topped with a thick layer of mashed potato and baked.', 0, 1, 0, 11, 1, 'Shepherd Pie.png', '0', 'g14'),
(138, '3ba1aa91-52f0-11ee-8d71-b48c9d1b3686', '卡伦石龙子', 'Cullen Skink', '它的名字可能听起来没有吸引力，但卡伦石龙子是一种非常美味的苏格兰鱼汤。 它由烟熏黑线鳕、土豆和洋葱以及牛奶或奶油混合而成。', 'lIts name may sound unappealing but Cullen Skink is a very delicious Scottish fish soup. It\'s made from a mixture of smoked haddock, potatoes, and onions, along with milk or cream.', 0, 0, 1, 15, 1, 'Cullen Skink.png', '0', 'g14'),
(139, '3ba1e497-52f0-11ee-8d71-b48c9d1b3686', '紫菜面包', 'Laverbread', '制作紫菜面包时，将从威尔:士海岸收集的海藻(紫菜) 煮沸，然后在油炸前捣成泥或切碎。有时在油炸之前加入燕麦片。', 'To make laverbread, seaweed (laver) gathered from the Welsh coast is boiled, then pureed or minced before being fried. Sometimes oatmeal is added prior to frying.', 1, 0, 0, 7, 1, 'Laverbread.png', '0', 'g14'),
(140, '3ba214e2-52f0-11ee-8d71-b48c9d1b3686', '全套英式早餐', 'Full English Breakfast', '包括您喜欢的鸡蛋、烤豆、培根、蘑菇、西红柿和炸面包，难怪为什么他们称全套英式早餐为油炸食品。它已被复制但未被复制，没有比这更好的方式来开始您的早晨了', 'One traditional British food you would have come across prior is the full English breakfast. Served around the world, you still can’t beat the original. Just be prepared for an epic cooked breakfast spread that will tie you over well past lunch.', 0, 1, 0, 20, 1, 'Full English Breakfast.jpg', '0', 'g14'),
(141, '3ba24dfa-52f0-11ee-8d71-b48c9d1b3686', '果酱不倒翁', 'Jam roly-poly', '它的成分很简单:用羊脂制成的面团涂上大量果酱,像瑞土卷-样卷起来, 然后蒸或烤。Jam roly-poly 配上大量热气腾腾的蛋奶冻，与果酱- -起提供甜味。 面团完全不含糖。', 'Its ingredients are simple: a dough made from suet is spread liberally with jam, rolled up like a Swiss roll, then steamed or baked. Jam roly-poly is served topped with plenty of steaming custard, which一along with the jam一provides the sweetness. The dough contains no sugar at all.', 0, 1, 0, 10, 5, 'jam roly-poly.png', '0', 'g14'),
(142, '3ba27ed3-52f0-11ee-8d71-b48c9d1b3686', '埃克尔斯蛋糕', 'Eccles Cakes', '每次路过一家英国面包店时，一 定要进去吃一 块Eccles 蛋糕犒劳自己!这些黄油烤点心看起来像一个小圆饼。它们含有醋栗、蜜饯柑橘皮和肉桂、肉豆蔻、多香果和丁香等香料。然后将这种甜馅包裹在顶部撒有demerara糖的甜脆糕点中。', 'Any time you pass a British bakery, be sure to pop in and treat yourself to an Eccles Cake! These buttery baked treats look like a small round pie. They contain currants, mixed with candied citrus peel and spices like cinnamon, nutmeg, allspice, and cloves. This sweet flling is then encased in a sweet, flaky pastry topped with demerara sugar.', 1, 0, 0, 11, 1, 'Eccles cakes.png', '0', 'g14'),
(143, '3ba2b063-52f0-11ee-8d71-b48c9d1b3686', '五香胡萝卜扁豆汤', 'Spiced carrot & lentil soup', '一种美味、辛辣的混合物，富含铁且低脂肪。不到半小时就做好了，或者可以用慢炖锅做', 'A delicious, spicy blend packed full of iron and low in fat to boot. It\'s ready in under half an hour, or can be made in a slow cooker', 1, 0, 0, 7, 2, 'Spiced carrot & lentil soup.png', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g14'),
(144, '3ba2e002-52f0-11ee-8d71-b48c9d1b3686', '蒜蓉小龙虾', 'Crawfish with garlic sauce', '盱眙小龙虾', 'Crayfish from Xuyi', 0, 1, 0, 25, 2, 'Crawfish with garlic sauce.jpg', '0', 'g14'),
(145, '3ba31079-52f0-11ee-8d71-b48c9d1b3686', '地锅鸡', 'Ground pot chicken', '徐州地锅鸡', 'Xuzhou ground pot chicken', 0, 1, 0, 30, 5, 'Ground pot chicken.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g14'),
(146, '3ba34017-52f0-11ee-8d71-b48c9d1b3686', '盐水鸭', 'Salted duck', '南京盐水鸭', 'Nanjing Salted duck', 0, 1, 0, 20, 1, 'Salted duck.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g14'),
(147, '3ba3704f-52f0-11ee-8d71-b48c9d1b3686', '银丝面', 'silver noodles', '常州银丝面', 'Changzhou silver noodles', 1, 0, 0, 5, 1, 'silver noodles.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g14'),
(148, '3ba39d4d-52f0-11ee-8d71-b48c9d1b3686', '红烧肉', 'braised pork in brown sauce', '红烧肉', 'braised pork in brown sauce', 0, 1, 0, 60, 1, 'hsr.jpg', '0', 'g15'),
(149, '3ba3d1a5-52f0-11ee-8d71-b48c9d1b3686', '粉蒸肉', 'Steamed Pork with Rice Flour', '粉蒸肉', 'Steamed Pork with Rice Flour', 0, 1, 0, 60, 1, 'fzr.jpg', '0', 'g15'),
(150, '3ba40820-52f0-11ee-8d71-b48c9d1b3686', '糖醋里脊', 'Sweet and sour pork tenderloin', '糖醋里脊', 'Sweet and sour pork tenderloin', 0, 1, 0, 55, 1, 'tclj.jpg', '0', 'g15'),
(151, '3ba43200-52f0-11ee-8d71-b48c9d1b3686', '红烧狮子头', 'Stewed Pork Ball in Brown Sauce in brown sauce', '红烧狮子头', 'Stewed Pork Ball in Brown Sauce in brown sauce', 0, 1, 0, 35, 1, 'hsszt.jpg', '0', 'g15'),
(152, '3ba45cb0-52f0-11ee-8d71-b48c9d1b3686', '白切鸡', 'white cut chicken', '白切鸡', 'white cut chicken', 0, 1, 0, 70, 1, 'bqj.jpg', '0', 'g15'),
(153, '3ba48a0f-52f0-11ee-8d71-b48c9d1b3686', '开水白菜', 'Boiled cabbage', '水煮白菜', 'Boiled cabbage', 1, 0, 0, 25, 1, 'ksbc.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g15'),
(154, '3ba4b89a-52f0-11ee-8d71-b48c9d1b3686', '文思豆腐', 'Wensi Tofu', '文思豆腐为扬州名菜', 'Wensi Tofu', 1, 0, 0, 35, 1, 'wsdf.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g15'),
(155, '3ba4f0d5-52f0-11ee-8d71-b48c9d1b3686', '西芹百合炒腰果', 'Fried Cashew with Celery and Lily', '西芹百合炒腰果', 'Fried Cashew with Celery and Lily', 1, 0, 0, 30, 1, 'xqbccyg.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g15'),
(156, '3ba524b2-52f0-11ee-8d71-b48c9d1b3686', '地三鲜', 'Ground three fresh vegetables', '地三鲜', 'Ground three fresh vegetables', 1, 0, 0, 32, 1, 'dsx.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g15'),
(157, '3ba5537a-52f0-11ee-8d71-b48c9d1b3686', '炝黄瓜条', 'Stir fried cucumber strips', '炝黄瓜条', 'Stir fried cucumber strips', 1, 0, 0, 15, 1, 'qhgt.jpg', '0', 'g15'),
(158, '3ba581e7-52f0-11ee-8d71-b48c9d1b3686', '软兜鳝鱼', 'Braised Eel in Brown Sauce', '软兜鳝鱼', 'Braised Eel in Brown Sauce', 0, 0, 1, 80, 1, 'rdsy.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g15'),
(159, '3ba5ac49-52f0-11ee-8d71-b48c9d1b3686', '松鼠鳜鱼', 'Squirrel Mandarin Fish', '松鼠鳜鱼', 'Squirrel Mandarin Fish', 0, 0, 1, 125, 1, 'ssgy.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g15'),
(160, '3ba5dc69-52f0-11ee-8d71-b48c9d1b3686', '酸菜鱼', 'Pickled Chinese cabbage Fish', '酸菜鱼', 'Pickled Chinese cabbage Fish', 0, 0, 1, 90, 3, 'scy.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g15'),
(161, '3ba60c75-52f0-11ee-8d71-b48c9d1b3686', '红烧鲫鱼', 'Braised crucian carp in brown sauce', '红烧鲫鱼', 'Braised crucian carp in brown sauce', 0, 0, 1, 80, 1, 'hsjy.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g15'),
(162, '3ba64296-52f0-11ee-8d71-b48c9d1b3686', '水煮鱼片', 'Boiled Fish Fillet in Water', '水煮鱼片', 'Boiled Fish Fillet in Water', 0, 0, 1, 100, 4, 'szyp.jpg', '7cf5e580-fd14-11ed-9aba-8c16457921dc', 'g15');
INSERT INTO `shop` (`item_id`, `guid`, `title_zh`, `item_name`, `description_zh`, `item_desc`, `vegetarian`, `hasMeat`, `hasFish`, `item_price`, `spiciness`, `item_img`, `fk_guid`, `restaurant`) VALUES
(163, '3ba674e9-52f0-11ee-8d71-b48c9d1b3686', '东坡肉', 'Dongpo Pork', '东坡肉的主料都是半肥半瘦的猪肉，加入配料焖制而成，成品菜都是码得整整齐齐的麻将块儿，红得透亮，色如玛瑙，入口软而不烂，肥而不腻。', 'The main ingredient of Dongpo Braised Pork is half fat and half thin pork, which is braised with ingredients. The finished dishes are all mahjong pieces with neat yards. They are bright red, as red as agate, soft but not rotten, fat but not greasy.', 0, 1, 0, 58, 1, 'QQ图片20230529005410.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g16'),
(164, '3ba6abfd-52f0-11ee-8d71-b48c9d1b3686', '红烧狮子头', 'Braised Pork Ball In Brown Sauce', '红烧狮子头是一道淮扬名菜。将有肥有瘦的肉配上荸荠，香菇等材料，做成丸子，然后先炸后煮。', 'Braised pork ball in brown sauce is a famous Huaiyang dish. Mix the fat and lean meat with ingredients such as water chestnuts and mushrooms to make meatballs, then fry and cook.', 0, 1, 0, 48, 1, 'QQ图片20230529005600.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g16'),
(165, '3ba6df67-52f0-11ee-8d71-b48c9d1b3686', '宫保鸡丁', 'Kung Pao Chicken', '宫保鸡丁选用鸡肉为主料，佐以花生米、辣椒等辅料烹制而成；红而不辣、辣而不猛、香辣味浓、肉质滑脆；其入口鲜辣，鸡肉的鲜嫩可以配合花生的香脆。', 'Kung Pao chicken is made with chicken as the main ingredient, peanuts, peppers and other auxiliary ingredients; Red but not spicy, spicy but not fierce, with a strong spicy flavor, and smooth and crispy meat; Its taste is fresh and spicy, and the freshness of chicken can match the crispness of peanuts.', 0, 1, 0, 48, 2, 'QQ图片20230529005604.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g16'),
(166, '3ba7149c-52f0-11ee-8d71-b48c9d1b3686', '鱼香肉丝', 'Fish-flavored Shredded Pork', '鱼香肉丝选料精细，成菜色泽红润、富鱼香味，吃起来具有咸甜酸辣兼备的特点，肉丝质地柔滑软嫩。', 'The selection of fish-flavored shredded meat is fine, and the finished dish has a rosy color and rich fish flavor. It tastes salty, sweet, sour, and spicy, and the texture of the shredded meat is soft and tender.', 0, 1, 0, 38, 3, 'QQ图片20230529005606.jpg', '0', 'g16'),
(167, '3ba749d1-52f0-11ee-8d71-b48c9d1b3686', '虎皮青椒', 'Pan-Seared Green Chili Pepper', '虎皮青椒是以青椒为主要材料制作的一道川菜系菜品，因青椒表面炒得略微焦糊，斑驳的焦糊点如同老虎的花纹而得名。', 'Pan-Seared Green Chili Pepper is a Sichuan cuisine mainly made of green pepper. It is named after the slightly burnt surface of the green pepper, with mottled burnt spots resembling tiger patterns.', 1, 0, 0, 25, 3, 'QQ图片20230529005608.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g16'),
(168, '3ba77d96-52f0-11ee-8d71-b48c9d1b3686', '清炒茭白', 'Sir-fried wild rice stem', '茭白最常见的一种吃法就是把它炒着吃，而且是单独的炒着吃，称之为清炒茭白，茭白质地鲜嫩，味甘实，被视为蔬菜中的佳品。', 'The most common way to eat water bamboo is to stir fry it and eat it separately, known as stir fried water bamboo. The water bamboo has a fresh and tender texture, a sweet and solid taste, and is considered a good choice among vegetables.', 1, 0, 0, 23, 1, 'QQ图片20230529005611.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g16'),
(169, '3ba7be0e-52f0-11ee-8d71-b48c9d1b3686', '韭菜炒鸡蛋', 'Scrambled egg with leek', '韭菜炒鸡蛋是以鸡蛋、韭菜、虾皮为主料制作的菜品。 更多的时候韭菜炒鸡蛋的配料以韭菜、鸡蛋为主，南方不放或很少放虾皮，加入葱段，调料等炒至而成。', 'Stir fried eggs with leeks are dishes made with eggs, leeks, and shrimp skin as the main ingredients. More often, the ingredients for stir frying eggs with leeks are mainly leeks and eggs, while in the south, shrimp skin is not or rarely added, and scallions, seasonings, and other ingredients are added until fried.', 1, 0, 0, 18, 1, 'QQ图片20230529005613.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g16'),
(170, '3ba80d6a-52f0-11ee-8d71-b48c9d1b3686', '干煸豆角', 'Stir-fried Spicy Green Beans', '干煸豆角是用四季豆制作作为主要食材，以酱油、香油、味精、醋作为调料制作而成的一道家常菜。口味咸香辣，色泽嫩绿，口感脆嫩，营养丰富。', 'Stir-fried Spicy Green Beans is a home cooked dish made from green beans as the main ingredient and seasoned with soy sauce, sesame oil, monosodium glutamate, and vinegar. The taste is salty, fragrant, and spicy, with a light green color, a crispy and tender taste, and rich nutrition.', 1, 0, 0, 28, 2, 'QQ图片20230529005615.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g16'),
(171, '3ba8538e-52f0-11ee-8d71-b48c9d1b3686', '水煮鱼片', 'Boiled Fish Fillet', '水煮鱼片以品种丰富的鱼类资源和品质优良的调味料辣椒、花椒为物质基础，通过两种导热介质、两次加热成熟的烹饪方法，不仅使鱼肉成熟，也使鱼肉能够更好地吸收辣椒、花椒等调料的味道，从而形成了麻、辣、香、嫩兼备的独特风味，口感清爽，肉质鲜嫩，食后有回甘之感。', 'Boiled fish fillets are based on a rich variety of fish resources and high-quality seasonings such as chili and pepper. Through two types of heat transfer media and two times of heating and ripening, the cooking method not only ripens the fish, but also allows it to better absorb the taste of chili, pepper and other seasonings, forming a unique flavor that combines juicy, spicy, fragrant, and tender. The taste is refreshing, the meat is fresh and tender, and there is a sweet feeling after eating.', 0, 0, 1, 68, 5, 'QQ图片20230529005617.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g16'),
(172, '3ba89ef5-52f0-11ee-8d71-b48c9d1b3686', '白切鸡', 'Sliced Boiled Chicken', '白斩鸡形状美观，皮黄肉白，肥嫩鲜美，滋味异常鲜美，十分可口，肉色洁白皮带黄油，具有葱油香味，葱段打花镶边，食时佐以姜蓉、蒜泥、酱油，保持了鸡肉的鲜美、原汁原味，食之别有风味。', 'Boiled -sliced cold chicken is beautiful in shape, yellow in skin and white in meat, tender and delicious in fat, extremely delicious in taste. The meat color is white, and the belt is buttered, with the smell of onion oil. The scallion section is decorated with flowers and edges. When eating, it is accompanied by ginger, garlic paste, and soy sauce, which maintains the delicious and original taste of the chicken. The food has a different flavor.', 0, 1, 0, 48, 1, 'QQ图片20230529010034.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g16'),
(173, '3ba8f152-52f0-11ee-8d71-b48c9d1b3686', '酸菜鱼', 'Boiled Fish with Pickled Cabbage and Chili', '酸菜鱼以草鱼为主料，配以泡菜等食材煮制而成，口味酸辣可口；鱼含丰富优质蛋白，能提供人丰富的蛋白质、矿物质等营养；酸菜中的乳酸可以促进人体对铁元素的吸收，还可以增加人的食欲。', 'Pickled Chinese cabbage Fish is cooked with grass carp as the main ingredient, together with pickles and other ingredients. It tastes hot and sour; Fish contains rich and high-quality protein, which can provide people with rich nutrients such as protein and minerals; The lactic acid in pickled Chinese cabbage can promote the absorption of iron by the human body, and can also increase the appetite of people.', 0, 0, 1, 68, 4, 'QQ图片20230529010459.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g16'),
(174, '3ba92221-52f0-11ee-8d71-b48c9d1b3686', '清蒸鲈鱼', 'Steamed Perch', '清蒸鲈鱼是一道色香味俱全的传统名菜，倒一些黄酒，就能除区鱼的腥味，并能使鱼滋味鲜美；鲜鱼剖开洗净，在牛奶中泡一会儿既可除腥，又能增加鲜味，鱼肉呈白色，刺少，肉质细嫩、爽滑，鲜味突出。\r\n', 'Steamed perch is a traditional dish with a complete range of colors, flavors, and flavors. Pouring some yellow wine can eliminate the fishy smell and make the fish taste delicious; Fresh fish is sliced open and washed. Soaking it in milk for a while can not only remove the fishy smell but also increase its freshness. The fish meat is white with few bones, and the meat is tender, smooth, and has a prominent fresh taste.', 0, 0, 1, 58, 1, 'QQ图片20230529010509.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g16'),
(175, '3ba952f1-52f0-11ee-8d71-b48c9d1b3686', '红烧肉', 'Braised Pork', '猪肉红烧', 'Pork cooked in brown sauce', 0, 1, 0, 45, 1, 'BraisedPork.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g17'),
(176, '3ba98100-52f0-11ee-8d71-b48c9d1b3686', '松鼠桂鱼', 'Squirrel mandarin fish', '没有松鼠', 'No squirrels', 0, 0, 1, 70, 1, 'Squirrel mandarin fish.jpeg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g17'),
(177, '3ba9acd2-52f0-11ee-8d71-b48c9d1b3686', '土豆丝', 'shredded potatoes', '土豆切丝然后炒', 'Shred the potatoes and fry them', 1, 0, 0, 15, 2, 'shredded potatoes.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g17'),
(178, '3ba9da75-52f0-11ee-8d71-b48c9d1b3686', '狮子头', 'meatball', '肉泥捏成球状然后红烧', 'The meat puree is shaped into balls and braised', 0, 1, 0, 40, 1, 'meatball.jpeg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g17'),
(179, '3baa10f1-52f0-11ee-8d71-b48c9d1b3686', '炒青菜', 'Stir-fried greens', '油炒新鲜青菜', 'Saute fresh vegetables in oil', 1, 0, 0, 15, 1, 'Stir-fried greens.jpeg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g17'),
(180, '3baa3ecb-52f0-11ee-8d71-b48c9d1b3686', '清蒸白鱼', 'Steamed white fish', '在锅里蒸白鱼', 'Steam white fish in a pot', 0, 0, 1, 50, 1, 'Steamed white fish.jpeg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g17'),
(181, '3baa6e72-52f0-11ee-8d71-b48c9d1b3686', '虎皮辣椒', 'Tiger skin chili', '辣椒干煸', 'Chili dry stir-fry', 1, 0, 0, 20, 4, 'Tiger skin chili.jpeg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g17'),
(182, '3baa9f09-52f0-11ee-8d71-b48c9d1b3686', '北京烤鸭', 'Beijing Roast Duck', '烤处理好的鸭子', 'Roast the prepared duck', 0, 1, 0, 70, 1, 'Beijing Roast Duck.jpeg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g17'),
(183, '3baacd29-52f0-11ee-8d71-b48c9d1b3686', '红烧蹄膀', 'Braised pork hock in brown sauce', '红烧蹄膀', 'Braised pork hock in brown sauce', 0, 1, 0, 70, 1, 'Braised pork hock in brown sauce.jpeg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g17'),
(184, '3baafedc-52f0-11ee-8d71-b48c9d1b3686', '红烧茄子', 'Braised eggplant', '茄子红烧', 'Braised eggplant', 1, 0, 0, 25, 1, 'Braised eggplant.jpeg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g17'),
(185, '3bab2e6b-52f0-11ee-8d71-b48c9d1b3686', '西红柿炒蛋', 'Scrambled eggs with tomatoes', '把蛋和西红柿一起炒', 'Fry the eggs and tomatoes together', 1, 0, 0, 15, 1, 'Scrambled eggs with tomatoes.jpeg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g17'),
(186, '3bab6026-52f0-11ee-8d71-b48c9d1b3686', '红烧排骨', 'Braised spare ribs in brown sauce', '把排骨红烧', 'Braised spare ribs in brown sauce', 0, 1, 0, 50, 1, 'Braised spare ribs in brown sauce.jpeg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g17'),
(187, '3bab9254-52f0-11ee-8d71-b48c9d1b3686', '牛排', 'Steak', '牛排内部为区域粉红可见且夹杂着熟肉的浅灰和综褐色，整个牛排温度口感均衡', 'The inside of the steak is a regional pink visible with light gray and brown color of cooked meat, and the temperature and taste of the whole steak are balanced', 0, 1, 0, 15, 3, '牛排.jpg', '0', 'g18'),
(188, '3babc449-52f0-11ee-8d71-b48c9d1b3686', '烤肉', 'BBQ', '这种烤肉是熏肉,保持一定的温度，然后用特定的木材烧出来的烟来赋予烤肉特殊的味道。', 'This roast is smoked meat, maintained at a certain temperature, and then smoked with specific wood to give the roast a special taste.', 0, 1, 0, 15, 2, 'bbq.jpg', '0', 'g18'),
(189, '3babf373-52f0-11ee-8d71-b48c9d1b3686', '红烧狮子头', 'Braised lion\'s head ', '红烧狮子头是一道淮扬名菜。将有肥有瘦的肉配上荸荠，香菇等材料，做成丸子，然后先炸后煮', 'Braised lion\'s head is a famous dish in Huaiyang. Fat and lean meat is served with water chestnuts, shiitake mushrooms and other ingredients to make meatballs, then fried and then cooked', 0, 1, 0, 15, 3, '狮子头.jpg', '0', 'g18'),
(190, '3bac213b-52f0-11ee-8d71-b48c9d1b3686', '松鼠鳜鱼', 'Squirrel mandarin fish', '厨师用鲤鱼出骨，在鱼肉上刻花纹，加调味稍腌后，拖上蛋黄糊，入热油锅嫩炸成熟后，浇上熬热的糖醋卤汁。', 'The chef uses carp to bone, carves patterns on the fish, seasoning and marinating slightly, dragging the egg yolk paste, frying it in a hot oil pan and pouring it with hot sweet and sour marinade.', 0, 0, 1, 20, 5, '松鼠鳜鱼.jpg', '0', 'g18'),
(191, '3bac4e27-52f0-11ee-8d71-b48c9d1b3686', '汉堡', 'Hamburger', '普通的汉堡', 'an ordinary hamburger', 0, 1, 0, 7, 2, '汉堡.jpg', '0', 'g18'),
(192, '3bac84bc-52f0-11ee-8d71-b48c9d1b3686', '沙拉', 'Salad', '沙拉作为冷头盘，以清凉蔬菜为主，如生菜、西红柿、芦笋、茄子、青椒', 'Salad as a cold headdish with cool vegetables such as lettuce, tomatoes, asparagus, eggplant, green peppers', 1, 0, 0, 5, 3, '沙拉.jpg', '0', 'g18'),
(193, '3bacb4de-52f0-11ee-8d71-b48c9d1b3686', '德国香肠', 'Sausage', '德国香肠最大的特点就是用新鲜肉糜制作，做好的香肠保质期非常短，要尽快做完。', 'The biggest feature of German sausages is that they are made with fresh minced meat, and the shelf life of the prepared sausages is very short, so they should be finished as soon as possible.', 0, 1, 0, 10, 3, '香肠jpg.jpg', 'bbb68eda-fd6a-11ed-9454-82dabc2273dc', 'g18'),
(194, '3bace593-52f0-11ee-8d71-b48c9d1b3686', '火腿', 'Ham', '宣威火腿的猪来源于高原乌金黑猪，以玉米、土豆和野草为饲料，奔跑于林地间，喝的是山泉水，生长1-2年，其品质优良，足以代表云南火腿，故常称“云腿”。', 'The pig of Xuanwei ham comes from the plateau Wujin black pig, with corn, potatoes and wild grass as feed, running in the woodland, drinking mountain spring water, ', 0, 1, 0, 16, 3, '火腿.jpg', 'bbb68eda-fd6a-11ed-9454-82dabc2273dc', 'g18'),
(195, '3bad15d3-52f0-11ee-8d71-b48c9d1b3686', '鸡腿', 'Grilled chicken', '烤鸡腿是餐桌上的一道美味，制作原料主要有棒棒腿、柠檬、酱油、酒等，因其肉质鲜嫩，酱香味道而深受欢迎。', 'Grilled chicken thighs are a delicacy on the table, mainly made with stick legs, lemon, soy sauce, sake, etc.,', 0, 1, 0, 9, 3, '鸡腿.jpg', '0', 'g18'),
(196, '3bad4967-52f0-11ee-8d71-b48c9d1b3686', '肘子', 'elbows', '肘子会先在蔬菜高汤里熬煮入味，再放入烤炉中煎烤至流油，最后通过高温炙烤将猪皮烤得焦香酥脆。', 'The elbows are first boiled in vegetable broth to taste, then frying in the oven until the oil runs.', 0, 1, 0, 15, 3, '肘子.jpg', 'bbb68eda-fd6a-11ed-9454-82dabc2273dc', 'g18'),
(197, '3bad7837-52f0-11ee-8d71-b48c9d1b3686', '鱼子酱', 'caviar', '鱼子酱绵软柔滑，自取卵一刻起，历经搓卵、沥水、挑卵、拌盐、装罐、压罐等10多道纯手工程序，需要在15分钟内全部完成，才能保证其吹弹可破的形态，及原滋原味与鲜美的口感。所以它真的很珍贵。价格也异常昂贵。', 'The caviar is soft and silky, and from the moment of egg retrieval, it has gone through more than 10 purely manual procedures such as egg rubbing, draining。', 0, 1, 1, 20, 3, '鱼子酱.jpg', 'bbb68eda-fd6a-11ed-9454-82dabc2273dc', 'g18'),
(198, '3bada7d4-52f0-11ee-8d71-b48c9d1b3686', '佛跳墙', 'The Mad Monk', '“佛跳墙”曾被列为清宫廷御宴满汉全席中首推的极品美味，烧热一百多年过去了，可它仍是闽菜系中的佼佼者，享有“中华第一汤”的美誉。', '\"Buddha jumping over the wall\" was once listed as the first delicious dish in the banquet of the Qing court full of Han, and it has been heated for more than 100 years.', 0, 1, 1, 20, 3, '佛跳墙.jpg', 'bbb68eda-fd6a-11ed-9454-82dabc2273dc', 'g18'),
(199, '3badd975-52f0-11ee-8d71-b48c9d1b3686', '小龙虾', 'Cary', '小龙虾是一种淡水甲壳动物，也是淡水经济虾类，因肉味鲜美广受人们欢迎，是中国的特产美食之一。', 'Crayfish is a freshwater crustacean and also a freshwater economic shrimp. It is widely popular due to its delicious meat taste and is one of China\'s specialty delicacies.', 0, 1, 0, 50, 3, '070FC06360CB86C859636F5DE6EDBC74.jpg', '0', 'g19'),
(200, '3bae0a4c-52f0-11ee-8d71-b48c9d1b3686', '糖醋排骨', 'Sweet and Sour Pork Ribs', '糖醋排骨是一道大众喜爱的特色传统名菜。它选用新鲜猪子排作主料，肉质鲜嫩，成菜色泽红亮油润。', 'Sweet and sour pork ribs are a popular traditional dish. It uses fresh pork chops as the main ingredient, with fresh and tender meat and a bright red and oily finish.', 0, 1, 0, 50, 1, '1BDB9BCAD0C1D95E06CC0ED408673E96.jpg', '0', 'g19'),
(201, '3bae400c-52f0-11ee-8d71-b48c9d1b3686', '火锅', 'Hot Pot', '火锅是中国独创的美食之一，也是一种老少皆宜的食物。火锅不仅是一种烹饪方式，也是一种文化的象征。', 'Hot pot is one of China\'s unique cuisines and a suitable food for all ages. Hot pot is not only a cooking method, but also a symbol of culture.', 1, 1, 1, 100, 3, '24C15721DA7A649DB71710CD20877238.jpg', '0', 'g19'),
(202, '3bae72ab-52f0-11ee-8d71-b48c9d1b3686', '肉蟹煲', 'Meat Crab Pot', '肉蟹煲是一道由肉蟹、鸡爪、辣酱做成的美食。肉蟹，味道鲜、嫩，蟹肉味浓香。可与生姜搭配来降低寒气。加上年糕，蟹棒增加配料，色泽十足，味道鲜美。', 'Meat crab pot is a delicacy made from crab, chicken feet, and spicy sauce. Meat crab, fresh and tender in taste, with a strong and fragrant crab meat flavor. Can be paired with ginger to reduce cold. With the addition of rice cakes and crab sticks as ingredients, the color is full and the taste is delicious.', 1, 1, 0, 150, 2, '75F790A5223C5546232DC2680D98D0B7.jpg', '0', 'g19'),
(203, '3baea3b2-52f0-11ee-8d71-b48c9d1b3686', '酸菜鱼', 'Pickled Cabbage Fish', '酸菜鱼以草鱼为主料，配以泡菜等食材煮制而成，口味酸辣可口；鱼含丰富优质蛋白，能提供人丰富的蛋白质、矿物质等营养。', 'Pickled cabbage Fish is cooked with grass carp as the main ingredient, together with pickles and other ingredients. It tastes hot and sour; Fish contains rich and high-quality protein, which can provide people with rich nutrients such as protein and minerals', 0, 0, 1, 80, 3, '3EFE59CFAB834756A6FC625C2B506E1B.jpg', '0', 'g19'),
(204, '3baed46d-52f0-11ee-8d71-b48c9d1b3686', '烤肉', 'Barbecue', '烤肉是中国久负盛名的特色菜肴，独具风味，历史悠久。制作原料有猪肉、牛肉、蔬菜等。现代烤肉与刀耕火种时的烤肉并不相同。', 'Barbecue is a renowned specialty dish in China, with a unique flavor and a long history. The raw materials for production include pork, beef, vegetables, etc. Modern barbecue is not the same as barbecue during slash and burn cultivation.', 1, 1, 0, 100, 2, 'EBB51C144D9F44EC7AEEE90AEE46B734.jpg', '0', 'g19'),
(205, '3baf05af-52f0-11ee-8d71-b48c9d1b3686', '地锅鸡', 'Ground Cooked Chicken', '地锅鸡汤汁较少，口味鲜醇，饼借菜味，菜借饼香，具有软滑与干香并存的特点。', 'Ground pot chicken soup has less juice and a fresh and mellow taste. The cake borrows the flavor of vegetables, while the vegetables borrow the aroma of cakes. It has the characteristics of coexisting soft and smooth with dry aroma.', 1, 1, 0, 110, 3, '7C51F15562431D389DBA7EF3A84F58B6.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g19'),
(206, '3baf3687-52f0-11ee-8d71-b48c9d1b3686', '花甲', 'Clam', '花蛤是一道美食，主要材料有花蛤、大葱、蒜头、姜、红辣椒、酱油等。该菜味道超常，香味可口，咸鲜味十足。', 'Clams are a delicacy, mainly made with ingredients such as flower clams, scallions, garlic, ginger, chili peppers, soy sauce, etc. This dish has an extraordinary taste, a delicious aroma, and a strong salty taste.', 0, 1, 0, 20, 3, 'mmexport1685287782073.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g19'),
(207, '3baf86c9-52f0-11ee-8d71-b48c9d1b3686', '蔬菜沙拉', 'Vegetable Salad', '蔬菜沙拉是一道 以圆白菜、番茄、黄瓜等作为主要食材制作而成的美食。蔬菜沙拉是一种非常营养健康的饮食方法。', 'Vegetable salad is a delicacy made with cabbage, tomatoes, cucumbers, and other main ingredients. Vegetable salad is a very nutritious and healthy dietary method.', 1, 0, 0, 35, 1, '0BEB6AB282A210DE13B1A9360FE15ADC.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g19'),
(208, '3bafc00a-52f0-11ee-8d71-b48c9d1b3686', '三文鱼', 'Salmon', '三文鱼属于冷水性的高度洄游鱼类，被国际美食界誉为“冰海之皇”。研究表明，三文鱼肉质鲜美，营养丰富，并且富含EPA和DHA等生物活性物质。', 'Salmon is a highly migratory cold water fish, known as the \"King of the Ice Sea\" in the international food industry. Research has shown that salmon meat is delicious, nutritious, and rich in bioactive substances such as EPA and DHA.', 0, 0, 1, 138, 2, 'CAA57B06AEEB5B98578EC362DC7E6998.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g19'),
(209, '3bb067ba-52f0-11ee-8d71-b48c9d1b3686', '红烧肉', 'Braised Pork in Brown Sauce', '红烧肉是一道著名的大众菜肴，其以五花肉为制作主料，最好选用肥瘦相间的三层肉来做，做出来的肉肥瘦相间，香甜松软，营养丰富，入口即化。', 'Braised pork belly in Brown Sauce is a famous popular dish. It is mainly made of streaky pork. It is best to choose three layers of meat with fat and thin. The meat is fat and thin, sweet and soft, rich in nutrition, and easy to eat.', 0, 1, 0, 50, 2, '890D10E384E2D57A791D679B832540ED.jpg', '0', 'g19'),
(210, '3bb18099-52f0-11ee-8d71-b48c9d1b3686', '清炒时蔬', 'Stir Fried Seasonal Vegetables', '清炒时蔬是一道由白菜等食材制成的美食。此菜清淡爽口，不宜添加多种调味品。', 'Stir fried seasonal vegetables are a delicacy made from ingredients such as cabbage. This dish is light and refreshing, and it is not suitable to add multiple seasonings.', 1, 0, 0, 15, 1, 'Camera_XHS_16852912634191000g00821jtbnjkfi00g5oh2phc41miqonrr0ug.jpg', '109db12b-f496-11ed-91ca-a4badbfbb15c', 'g19');

--
-- Triggers `shop`
--
DELIMITER $$
CREATE TRIGGER `insert_guid` BEFORE INSERT ON `shop` FOR EACH ROW SET NEW.guid = UUID()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `email` varchar(60) NOT NULL,
  `pass` char(40) NOT NULL,
  `reg_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_contents`
--
ALTER TABLE `order_contents`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `forum`
--
ALTER TABLE `forum`
  MODIFY `post_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_contents`
--
ALTER TABLE `order_contents`
  MODIFY `content_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
