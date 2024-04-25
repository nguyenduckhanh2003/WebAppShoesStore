Create database PrjShoes;
Use PrjShoes

-- Tạo bảng Categories
CREATE TABLE Categories (
    category_id INT PRIMARY KEY IDENTITY(1,1),
    category_name NVARCHAR(255) NOT NULL
);

-- Tạo bảng Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    product_name NVARCHAR(255) NOT NULL,
    category_id INT,
    price DECIMAL(10, 2) NOT NULL,
    link NVARCHAR(1000),
	description NVARCHAR(2000),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Size (
    size_id INT PRIMARY KEY IDENTITY(1,1),
    product_id INT,
    size_name NVARCHAR(50),
    quantity INT NOT NULL, -- Thêm cột quantity
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Tạo bảng Users
CREATE TABLE Users (
    users_id INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(255) NOT NULL,
    password NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) NOT NULL,
    role INT NOT NULL,
    CONSTRAINT UC_Username UNIQUE (username), -- Đảm bảo không có hai user nào có cùng username
    CONSTRAINT UC_Email UNIQUE (email) -- Đảm bảo không có hai user nào có cùng email
);

CREATE TABLE Cart (
	cart_id INT PRIMARY KEY IDENTITY(1,1),
    users_id INT,
    product_id INT,
	productname NVARCHAR(100),
    size_name NVARCHAR(50),
    quantity INT NOT NULL, -- Thêm cột quality
	totalprice Decimal(10,2),
    FOREIGN KEY (users_id) REFERENCES Users(users_id),
	FOREIGN KEY (product_id) REFERENCES Products(product_id),
);



-- Tạo bảng OrderDetails
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY IDENTITY(1,1),
	users_id int,
	name nvarchar(30),
	address nvarchar(100),
	phonenumber nvarchar(10),
	productname nvarchar(100),
	orderdate Datetime,
	size_name nvarchar(10),
	quantity int,
	totalprice Decimal(10,2),
	payment nvarchar(30),
	status nvarchar(30),
	FOREIGN KEY (users_id) REFERENCES Users(users_id)

);

-- Chèn dữ liệu vào bảng Categories
INSERT INTO Categories (category_name) VALUES
(N' Giày Nam'),
(N' Giày Nữ');

-- Chèn dữ liệu vào bảng Products
INSERT INTO Products (product_name, category_id, price, link , description) VALUES
(N'Giày nam Dior x Air Jordan 1 High CN8607-002', 1, 79.99, 'img/sneakermale/jordandior.webp',N'Dior x Air Jordan 1 High CN8607-002 là một phiên bản độc đáo của giày thể thao kết hợp giữa thương hiệu thời trang cao cấp Dior và nhãn hiệu giày thể thao nổi tiếng Air Jordan.
Thiết kế này thường có màu sắc sang trọng và độc đáo, với logo của cả hai thương hiệu được tích hợp một cách tinh tế trên sản phẩm.
Chúng thường được ưa chuộng bởi sự kết hợp độc đáo giữa phong cách thời trang và thể thao, cũng như sự hiếm có của sản phẩm, làm nên giá trị đặc biệt của chúng đối với các đơn vị sưu tập giày.'),
(N'Giày Nike Air Jordan 1 Retro High OG ‘Yellow Toe’ (GS) 575441-711', 1, 49.99, 'img/sneakermale/jordanyellow.webp',N'Nike Air Jordan 1 Retro High OG Yellow Toe (GS) 575441-711 là một phiên bản đặc biệt của dòng giày thể thao Air Jordan 1, được thiết kế dành cho trẻ em và thanh thiếu niên (GS - Grade School). Mẫu giày này nổi bật với màu sắc vàng chủ đạo trên phần đầu của giày (Yellow Toe),
kết hợp với các chi tiết màu đen và trắng. Đây là một trong những phiên bản phổ biến trong cộng đồng sneakerhead với sự kết hợp màu sắc độc đáo và chất liệu chất lượng cao của Air Jordan 1 OG.'),
(N'Adidas Forum Low CL', 1, 99.99, 'img/sneakermale/forumlowcl.avif',N'Adidas Forum Low CL là một phiên bản của dòng giày thể thao Adidas Forum, thiết kế với phần trên thấp hơn so với phiên bản cao cổ truyền thống của Forum. "CL" có thể được hiểu là "Classic" - 
một cách chỉ những phiên bản mang phong cách cổ điển, hoặc có thể có ý nghĩa khác tùy thuộc vào ngữ cảnh.'),
(N'Giày Air Jordan 4 Retro ‘Metallic Gold’ AQ9129-170', 1, 79.99, 'img/sneakermale/jordan4.webp',N'Giày Air Jordan 4 Retro Metallic Gold AQ9129-170 là một phiên bản đặc biệt của dòng giày thể thao Air Jordan 4 Retro, với điểm nhấn chính là màu sắc vàng kim loại (Metallic Gold). Đây là một phiên bản thu hút sự chú ý của cộng đồng sneakerhead và người yêu thời trang với sự kết hợp độc đáo giữa màu vàng lấp lánh và các chi tiết thiết kế đặc trưng của Air Jordan 4.'),
(N'Nike Jordan 1 Low', 1, 49.99, 'img/sneakermale/jordan1low.webp',N'Giày Nike Jordan 1 Low là một phiên bản thấp hơn của biểu tượng thể thao Air Jordan 1, một trong những mẫu giày thể thao nổi tiếng và kinh điển của Nike. Jordan 1 Low thường giữ nguyên phần thân giày và thiết kế của Air Jordan 1 cao cổ, nhưng được cắt thấp hơn ở phần mắt cá chân, tạo ra một phong cách hiện đại và thoải mái hơn.'),
(N'Nike Air Force 1', 1, 99.99, 'img/sneakermale/airforce1.png',N'Nike Air Force 1 là một trong những biểu tượng không thể phủ nhận trong thế giới giày thể thao, được ra mắt lần đầu vào năm 1982. Được thiết kế bởi Bruce Kilgore, đôi giày này đã trở thành một trong những dòng sản phẩm bán chạy nhất của Nike và có mặt ở mọi nơi từ sân thể thao cho đến các sự kiện thời trang và đời sống hàng ngày.'),
(N'Vans Old School', 1, 79.99, 'img/sneakermale/van.webp',N'Vans Old Skool là một trong những mẫu giày kinh điển và phổ biến nhất của thương hiệu Vans. Được ra mắt lần đầu vào năm 1977, Old Skool nhanh chóng trở thành một biểu tượng của văn hóa skateboarding và thời trang đường phố.'),
(N'Converse', 1, 49.99, 'img/sneakermale/converseblack.webp',N'Những đôi giày này không chỉ được biết đến với tính biểu tượng mà còn với sự đa dạng trong màu sắc và kiểu dáng, phù hợp với nhiều phong cách và dịp sự kiện khác nhau. Converse Chuck Taylor All Star High Top thường là một lựa chọn phổ biến cho những người yêu thích thể thao, đặc biệt là skateboard và thời trang đường phố.'),
(N'Adidas SuperStar', 1, 99.99, 'img/sneakermale/adidassuper.webp',N'Adidas Superstar là một trong những mẫu giày kinh điển và phổ biến nhất của thương hiệu Adidas. Được ra mắt lần đầu vào năm 1969, Superstar nhanh chóng trở thành biểu tượng của văn hóa đường phố và thể thao, đặc biệt là trong cộng đồng hip-hop và skateboard.'),
(N'Giày nữ Nike Flex 2020 RN CJ0217-200', 2, 99.99, 'img/sneakerfemale/giaynunike.jpg',N'Nike Flex 2020 RN CJ0217-200 là một đôi giày chạy bộ phù hợp cho phụ nữ, thiết kế để mang lại sự thoải mái và hỗ trợ trong mọi hoạt động. Đôi giày này thuộc dòng sản phẩm Nike Flex, nổi tiếng với độ linh hoạt và khả năng co dãn.'),
(N'Giày nữ Puma Smash Vulc ‘Pink’ 359622-15', 2, 99.99, 'img/sneakerfemale/Giaynu2.jpg',N'Giày nữ Puma Smash Vulc Pink 359622-15 là một phiên bản của dòng giày thể thao Puma Smash Vulc, với điểm nhấn chính là màu hồng đặc trưng. Đây là một lựa chọn phổ biến trong thế giới thời trang đường phố và đời sống hàng ngày, với sự kết hợp giữa phong cách thời trang và tính thoải mái.'),
(N'Giày nữ New Balance 550 ‘White Pink’ BBW550WP', 2, 99.99, 'img/sneakerfemale/Giaynu3.jpg',N'Giày nữ New Balance 550 White PinkBBW550WP là một phiên bản đặc biệt của dòng giày New Balance 550, với sự kết hợp màu trắng và hồng tinh tế. Đây là một trong những mẫu giày phổ biến của New Balance, thường được ưa chuộng trong cộng đồng sneakerhead và người yêu thời trang đường phố.'),
(N'Giày nữ FILA Ray ‘Prism’ 1RM01148-956', 2, 99.99, 'img/sneakerfemale/Giaynu4.jpg',N'Giày nữ FILA Ray Prism 1RM01148-956 là một phiên bản đặc biệt của dòng giày FILA Ray, với sự kết hợp màu sắc độc đáo và phong cách hiện đại. FILA Ray thường được biết đến với thiết kế chunky và phong cách retro, mang lại sự thoải mái và phong cách cho người mang.'),
(N'Giày nữ Puma X-Ray Jr ‘Multi’ 372920-03', 2, 99.99, 'img/sneakerfemale/Giaynu5.png',N'Giày nữ Puma X-Ray Jr Multi 372920-03 là một phiên bản đặc biệt của dòng giày Puma X-Ray, được thiết kế đặc biệt cho trẻ em và thanh thiếu niên. Đây là một trong những mẫu giày thể thao phổ biến của Puma, với sự kết hợp màu sắc đa dạng và thiết kế hiện đại.');

-- Chèn các kích cỡ của sản phẩm vào bảng Size
INSERT INTO Size (product_id, size_name, quantity)
VALUES
(1, '39', 50),
(1, '40', 55),
(1, '41', 40),
(2, '39', 50),
(2, '40', 55),
(2, '41', 40),
(3, '39', 50),
(3, '40', 55),
(3, '41', 40),
(4, '39', 50),
(4, '40', 55),
(4, '41', 40),
(5, '39', 50),
(5, '40', 55),
(6, '41', 40),
(6, '42', 50),
(7, '40', 55),
(7, '41', 50),
(8, '40', 55),
(8, '32', 50),
(9, '40', 55),
(9, '43', 50),
(10, '37', 55),
(10, '38', 40),
(11, '37', 55),
(11, '38', 50),
(12, '37', 55),
(12, '38', 50),
(13, '37', 55),
(13, '38', 50),
(14, '37', 55),
(14, '38', 50);

-- Chèn dữ liệu vào bảng Users
INSERT INTO Users (username, password,email,role) VALUES
('john_doe', '12345','john@gmail.com',0),
('jane_smith', '123','jane@gmail.com',0),
('bob_johnson', 'abc','bob@gmail.com',0),
('admin', 'admin','admin@gmail.com',1);
-- Chèn dữ liệu vào bảng Orders

INSERT INTO Cart(users_id,product_id,productname,size_name,quantity,totalprice) VALUES
	(1,1,N'Giày nam Dior x Air Jordan 1 High CN8607-002',39,1,79.99);

	INSERT INTO Cart(users_id,product_id,productname,size_name,quantity,totalprice) VALUES
	(1,2,N'Giày Nike Air Jordan 1 Retro High OG ‘Yellow Toe’ (GS) 575441-711',39,1,49.99);

select*from Cart;
select*from Size;
select* from Users;
select*from Categories;
Select*from Products;
select*from OrderDetails;	

/*SELECT *from OrderDetails where order_detail_id='1';
UPDATE OrderDetails SET  status = 'Đang giao' WHERE order_detail_id= '1' ;

SELECT c.quantity, (SELECT s.quantity from Size s join Products p on s.product_id = p.product_id join Cart c on s.product_id=c.product_id
WHERE c.users_id = '1' AND s.size_id='1' AND c.product_id = '1' AND c.size_name = '39') AS [StockQuality] from Size s join Products p on s.product_id = p.product_id join Cart c on s.product_id=c.product_id
WHERE c.users_id = '1' AND s.size_id='1' AND c.product_id = '1' AND c.size_name = '39';

SELECT c.quantity, s.quantity AS StockQuantity 
                     FROM Size s JOIN Products p ON s.product_id = p.product_id JOIN Cart c ON s.product_id = c.product_id 
                     WHERE c.users_id = '1' AND s.size_id = '1' AND c.product_id ='1' AND c.size_name = '39';

SELECT P.product_id, P.product_name, Ca.category_id, P.price, P.link, Ca.category_name 
                    FROM Products P INNER JOIN Categories Ca ON P.category_id = Ca.category_id

					Select*from Users where users_id ='1';


					select* FROM PRODUCTS p, Categories c where p.category_id = c.category_id;

					SELECT s.quantity from Size s where s.product_id = 1 and s.size_name = '39';
					select*from Cart WHERE users_id = 1 AND product_id = 1;

					UPDATE Cart SET size_name = '39', quantity = 2, totalprice = 159.98 WHERE users_id = 1 AND product_id = 1;
					UPDATE Size SET quantity = 51 WHERE size_id= 1;

					INSERT INTO OrderDetails (users_id, name, address, phonenumber,productname, orderdate, size_name,quantity,totalprice,payment,status) 
					VALUES('2','khanh','hanoi','0123','aaaa','2022-03-04','39',1,100,'tra sau','ok')

					UPDATE Size SET  quantity = quantity - 1 WHERE product_id = 1 AND size_name='39' ;
					Select* from Users u where u.role=0 and u.role=2

drop table Categories;
drop table Products;
drop table Users;
drop table Size;
drop table Cart;
drop table OrderDetails;*/
