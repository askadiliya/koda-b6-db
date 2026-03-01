CREATE TABLE users (
    id_user SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    photo TEXT,
    role VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO users (name, email, phone, address, photo, role) VALUES
('Andi Pratama', 'andi@email.com', '0811111111', 'Jakarta', 'andi.jpg', 'customer'),
('Budi Santoso', 'budi@email.com', '0811111112', 'Bandung', 'budi.jpg', 'customer'),
('Citra Lestari', 'citra@email.com', '0811111113', 'Surabaya', 'citra.jpg', 'customer'),
('Dewi Anggraini', 'dewi@email.com', '0811111114', 'Yogyakarta', 'dewi.jpg', 'customer'),
('Eko Saputra', 'eko@email.com', '0811111115', 'Semarang', 'eko.jpg', 'customer'),
('Fajar Nugroho', 'fajar@email.com', '0811111116', 'Malang', 'fajar.jpg', 'admin'),
('Gina Maharani', 'gina@email.com', '0811111117', 'Bekasi', 'gina.jpg', 'customer'),
('Hadi Wijaya', 'hadi@email.com', '0811111118', 'Depok', 'hadi.jpg', 'customer'),
('Intan Permata', 'intan@email.com', '0811111119', 'Bogor', 'intan.jpg', 'customer'),
('Joko Susilo', 'joko@email.com', '0811111120', 'Tangerang', 'joko.jpg', 'customer');


CREATE TABLE category (
    id_category SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO category (category_name) VALUES
('Coffee'),
('Non Coffee'),
('Snack'),
('Dessert'),
('Signature');


CREATE TABLE product (
    id_product SERIAL PRIMARY KEY,
    id_category INT NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    base_price NUMERIC(12,2) NOT NULL,
    description TEXT,
    stock INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,                                                                                                                                                                                      
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_product_category
        FOREIGN KEY (id_category)
        REFERENCES category(id_category)
        ON DELETE CASCADE
);
INSERT INTO product (id_category, product_name, base_price, description, stock) VALUES
(1, 'Espresso', 20000, 'Strong black coffee', 100),
(1, 'Cappuccino', 25000, 'Coffee with milk foam', 80),
(1, 'Latte', 27000, 'Smooth milk coffee', 90),
(2, 'Matcha Latte', 30000, 'Japanese green tea latte', 70),
(2, 'Chocolate', 28000, 'Hot chocolate drink', 60),
(3, 'French Fries', 22000, 'Crispy fries', 50),
(3, 'Chicken Wings', 35000, 'Spicy wings', 40),
(4, 'Cheesecake', 32000, 'Creamy cheesecake', 30),
(4, 'Brownies', 25000, 'Chocolate brownies', 45),
(5, 'Caramel Macchiato', 33000, 'Sweet caramel coffee', 75);

INSERT INTO product (id_category, product_name, base_price, description, stock) VALUES
(3, 'Beef Burger', 45000, 'Juicy grilled beef burger with lettuce and cheese', 55),
(3, 'Spaghetti Bolognese', 40000, 'Pasta with rich beef tomato sauce', 48),
(3, 'Grilled Chicken Sandwich', 38000, 'Toasted sandwich with grilled chicken and mayo', 60),
(3, 'Fish and Chips', 42000, 'Crispy fried fish with potato chips', 35),
(3, 'Beef Kebab', 39000, 'Middle eastern style beef kebab wrap', 50),
(4, 'Tiramisu', 34000, 'Italian coffee-flavored dessert', 25),
(4, 'Apple Pie', 30000, 'Classic baked apple pie with cinnamon', 28),
(4, 'Pancakes', 27000, 'Fluffy pancakes with maple syrup', 45),
(4, 'Garlic Bread', 20000, 'Toasted bread with garlic butter', 70),
(4, 'Onion Rings', 23000, 'Crispy deep-fried onion rings', 65);

INSERT INTO product (id_category, product_name, base_price, description, stock) VALUES
(2, 'Orange Juice', 24000, 'Fresh squeezed orange juice', 70),
(2, 'Mango Juice', 26000, 'Sweet tropical mango juice', 65),
(2, 'Avocado Juice', 28000, 'Creamy blended avocado juice', 60),
(2, 'Strawberry Juice', 25000, 'Fresh strawberry blended drink', 68),
(2, 'Watermelon Juice', 23000, 'Refreshing watermelon juice', 75),
(2, 'Pineapple Juice', 24000, 'Tangy pineapple juice', 72),
(2, 'Guava Juice', 22000, 'Sweet pink guava juice', 66),
(2, 'Apple Juice', 23000, 'Fresh apple pressed juice', 64),
(2, 'Dragon Fruit Juice', 27000, 'Vibrant dragon fruit juice', 58),
(2, 'Mixed Berry Juice', 29000, 'Blend of assorted berries', 50);

INSERT INTO product (id_category, product_name, base_price, description, stock) VALUES
(2, 'Green Detox Smoothie', 32000, 'Blend of spinach, apple, and banana for detox', 40),
(2, 'Chia Seed Drink', 28000, 'Refreshing drink with soaked chia seeds and honey', 55),
(2, 'Lemon Honey Water', 18000, 'Warm lemon water with natural honey', 80),
(2, 'Ginger Turmeric Shot', 22000, 'Immunity booster with ginger and turmeric', 60),
(2, 'Cucumber Mint Infused Water', 20000, 'Fresh cucumber and mint infused drink', 75),
(2, 'Almond Milk', 26000, 'Dairy-free homemade almond milk', 50),
(2, 'Oat Milk Latte', 30000, 'Healthy latte made with oat milk', 45),
(2, 'Herbal Tea Mix', 24000, 'Blend of natural herbs for relaxation', 65),
(2, 'Beetroot Juice', 27000, 'Fresh beetroot juice rich in antioxidants', 48),
(2, 'Celery Detox Drink', 29000, 'Pure celery juice for body cleansing', 35);

INSERT INTO product (id_category, product_name, base_price, description, stock) VALUES
(3, 'Nachos Cheese', 30000, 'Crispy tortilla chips with melted cheese sauce', 55),
(3, 'Chicken Nuggets', 28000, 'Golden fried chicken nuggets', 70),
(3, 'Mozzarella Sticks', 32000, 'Fried mozzarella sticks with marinara sauce', 50),
(3, 'Mini Sausage Roll', 26000, 'Bite-sized sausage wrapped in pastry', 60),
(3, 'Popcorn Chicken', 29000, 'Crunchy bite-sized fried chicken', 65),
(3, 'Spring Rolls', 25000, 'Crispy vegetable spring rolls', 58),
(3, 'Potato Wedges', 24000, 'Seasoned baked potato wedges', 62),
(3, 'Chicken Quesadilla', 35000, 'Grilled tortilla filled with chicken and cheese', 45),
(3, 'Mini Pizza', 33000, 'Small pizza with assorted toppings', 40),
(3, 'Fried Tofu Bites', 22000, 'Crispy fried tofu with dipping sauce', 75);


CREATE TABLE product_variant (
    id_variant SERIAL PRIMARY KEY,
    id_product INT NOT NULL,
    variant_name VARCHAR(100) NOT NULL,
    additional_price NUMERIC(12,2) DEFAULT 0,

    CONSTRAINT fk_variant_product
        FOREIGN KEY (id_product)
        REFERENCES product(id_product)
        ON DELETE CASCADE
);
INSERT INTO product_variant (id_product, variant_name, additional_price) VALUES
(1, 'Hot', 0),
(1, 'Ice', 2000),
(2, 'Hot', 0),
(2, 'Ice', 2000),
(3, 'Hot', 0),
(4, 'Ice', 0),
(5, 'Hot', 0),
(10, 'Large', 5000),
(10, 'Medium', 2000),
(3, 'Large', 4000);

CREATE TABLE product_image (
    id_image SERIAL PRIMARY KEY,
    id_product INT NOT NULL,
    image_path TEXT NOT NULL,

    CONSTRAINT fk_image_product
        FOREIGN KEY (id_product)
        REFERENCES product(id_product)
        ON DELETE CASCADE
);
INSERT INTO product_image (id_product, image_path) VALUES
(1, 'espresso.jpg'),
(2, 'cappuccino.jpg'),
(3, 'latte.jpg'),
(4, 'matcha.jpg'),
(5, 'chocolate.jpg'),
(6, 'fries.jpg'),
(7, 'wings.jpg'),
(8, 'cheesecake.jpg'),
(9, 'brownies.jpg'),
(10, 'macchiato.jpg');


CREATE TABLE cart (
    id_cart SERIAL PRIMARY KEY,
    id_user INT UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_cart_user
        FOREIGN KEY (id_user)
        REFERENCES users(id_user)
        ON DELETE CASCADE
);
INSERT INTO cart (id_user) VALUES
(1),(2),(3),(4),(5);


CREATE TABLE cart_item (
    id_cart_item SERIAL PRIMARY KEY,
    id_cart INT NOT NULL,
    id_product INT NOT NULL,
    id_variant INT,
    quantity INT NOT NULL CHECK (quantity > 0),

    CONSTRAINT fk_cartitem_cart
        FOREIGN KEY (id_cart)
        REFERENCES cart(id_cart)
        ON DELETE CASCADE,

    CONSTRAINT fk_cartitem_product
        FOREIGN KEY (id_product)
        REFERENCES product(id_product)
        ON DELETE CASCADE,

    CONSTRAINT fk_cartitem_variant
        FOREIGN KEY (id_variant)
        REFERENCES product_variant(id_variant)
        ON DELETE SET NULL
);
INSERT INTO cart_item (id_cart, id_product, id_variant, quantity) VALUES
(1, 1, 1, 2),
(1, 2, 3, 1),
(2, 3, 5, 1),
(2, 4, 6, 2),
(3, 5, 7, 1),
(3, 6, NULL, 3),
(4, 7, NULL, 1),
(4, 8, NULL, 2),
(5, 9, NULL, 1),
(5, 10, 8, 1);


CREATE TABLE orders (
    id_order SERIAL PRIMARY KEY,
    id_user INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    subtotal NUMERIC(12,2) NOT NULL,
    total_amount NUMERIC(12,2) NOT NULL,
    status VARCHAR(50) NOT NULL,

    CONSTRAINT fk_order_user
        FOREIGN KEY (id_user)
        REFERENCES users(id_user)
        ON DELETE CASCADE
);
INSERT INTO orders (id_user, subtotal, total_amount, status) VALUES
(1, 45000, 47000, 'Paid'),
(2, 30000, 32000, 'Paid'),
(3, 35000, 37000, 'Pending'),
(4, 32000, 34000, 'Paid'),
(5, 33000, 35000, 'Paid');


CREATE TABLE detail_order (
    id_detail_order SERIAL PRIMARY KEY,
    id_order INT NOT NULL,
    id_product INT NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    variant_name VARCHAR(100),
    quantity INT NOT NULL CHECK (quantity > 0),
    price NUMERIC(12,2) NOT NULL,

    CONSTRAINT fk_detailorder_order
        FOREIGN KEY (id_order)
        REFERENCES orders(id_order)
        ON DELETE CASCADE,

    CONSTRAINT fk_detailorder_product
        FOREIGN KEY (id_product)
        REFERENCES product(id_product)
        ON DELETE SET NULL
);
INSERT INTO detail_order (id_order, id_product, product_name, variant_name, quantity, price) VALUES
(1, 1, 'Espresso', 'Hot', 1, 20000),
(1, 2, 'Cappuccino', 'Ice', 1, 27000),
(2, 4, 'Matcha Latte', 'Ice', 1, 30000),
(3, 7, 'Chicken Wings', NULL, 1, 35000),
(4, 8, 'Cheesecake', NULL, 1, 32000),
(5, 10, 'Caramel Macchiato', 'Large', 1, 38000),
(2, 3, 'Latte', 'Hot', 1, 27000),
(3, 5, 'Chocolate', 'Hot', 1, 28000),
(4, 9, 'Brownies', NULL, 1, 25000),
(5, 6, 'French Fries', NULL, 1, 22000);


CREATE TABLE payment (
    id_payment SERIAL PRIMARY KEY,
    id_order INT UNIQUE NOT NULL,
    method VARCHAR(50) NOT NULL,
    amount NUMERIC(12,2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    paid_at TIMESTAMP,

    CONSTRAINT fk_payment_order
        FOREIGN KEY (id_order)
        REFERENCES orders(id_order)
        ON DELETE CASCADE
);
INSERT INTO payment (id_order, method, amount, status, paid_at) VALUES
(1, 'QRIS', 47000, 'Success', NOW()),
(2, 'Cash', 32000, 'Success', NOW()),
(3, 'Transfer', 37000, 'Pending', NULL),
(4, 'Debit Card', 34000, 'Success', NOW()),
(5, 'QRIS', 35000, 'Success', NOW());


CREATE TABLE review (
    id_review SERIAL PRIMARY KEY,
    id_user INT NOT NULL,
    id_product INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_review_user
        FOREIGN KEY (id_user)
        REFERENCES users(id_user)
        ON DELETE CASCADE,

    CONSTRAINT fk_review_product
        FOREIGN KEY (id_product)
        REFERENCES product(id_product)
        ON DELETE CASCADE
);
INSERT INTO review (id_user, id_product, rating, comment) VALUES
(1, 1, 5, 'Espresso sangat enak!'),
(2, 2, 4, 'Cappuccino creamy banget'),
(3, 3, 5, 'Latte favorit saya'),
(4, 4, 4, 'Matcha nya mantap'),
(5, 5, 5, 'Chocolate hangat nikmat'),
(6, 6, 3, 'Fries cukup oke'),
(7, 7, 5, 'Wings pedas mantap'),
(8, 8, 4, 'Cheesecake lembut'),
(9, 9, 4, 'Brownies legit'),
(10, 10, 5, 'Macchiato terbaik!');