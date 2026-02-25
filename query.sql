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