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


CREATE TABLE category (
    id_category SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


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


CREATE TABLE product_image (
    id_image SERIAL PRIMARY KEY,
    id_product INT NOT NULL,
    image_path TEXT NOT NULL,

    CONSTRAINT fk_image_product
        FOREIGN KEY (id_product)
        REFERENCES product(id_product)
        ON DELETE CASCADE
);


CREATE TABLE cart (
    id_cart SERIAL PRIMARY KEY,
    id_user INT UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_cart_user
        FOREIGN KEY (id_user)
        REFERENCES users(id_user)
        ON DELETE CASCADE
);


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