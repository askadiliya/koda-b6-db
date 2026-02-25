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