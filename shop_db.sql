SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO"; 
START TRANSACTION;
SET time_zone = "+00:00";

-- Database: shop_db

-- Table structure for table admins
CREATE TABLE admins (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(20) NOT NULL,
  password varchar(50) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table admins
INSERT INTO admins (id, name, password) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- Table structure for table users
CREATE TABLE users (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(20) NOT NULL,
  email varchar(50) NOT NULL,
  password varchar(50) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table products
CREATE TABLE products (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  details varchar(500) NOT NULL,
  price int NOT NULL,
  image_01 varchar(100) NOT NULL,
  image_02 varchar(100) NOT NULL,
  image_03 varchar(100) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table cart
CREATE TABLE cart (
  id int NOT NULL AUTO_INCREMENT,
  user_id int NOT NULL,
  pid int NOT NULL,
  name varchar(100) NOT NULL,
  price int NOT NULL,
  quantity int NOT NULL,
  image varchar(100) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (pid) REFERENCES products(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table messages
CREATE TABLE messages (
  id int NOT NULL AUTO_INCREMENT,
  user_id int NOT NULL,
  name varchar(100) NOT NULL,
  email varchar(100) NOT NULL,
  number varchar(12) NOT NULL,
  message varchar(500) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table orders
CREATE TABLE orders (
  id int NOT NULL AUTO_INCREMENT,
  user_id int NOT NULL,
  name varchar(20) NOT NULL,
  number varchar(10) NOT NULL,
  email varchar(50) NOT NULL,
  method varchar(50) NOT NULL,
  address varchar(500) NOT NULL,
  total_products varchar(1000) NOT NULL,
  total_price int NOT NULL,
  placed_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  payment_status varchar(20) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table wishlist
CREATE TABLE wishlist (
  id int NOT NULL AUTO_INCREMENT,
  user_id int NOT NULL,
  pid int NOT NULL,
  name varchar(100) NOT NULL,
  price int NOT NULL,
  image varchar(100) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (pid) REFERENCES products(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

COMMIT;