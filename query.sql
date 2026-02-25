SELECT 
    p.id_product, 
    p.product_name, 
    p.base_price, 
    c.category_name,
    ARRAY_AGG(DISTINCT v.variant_name) FILTER (WHERE v.variant_name IS NOT NULL) AS "available_variants"
FROM product p
LEFT JOIN category c ON p.id_category = c.id_category
LEFT JOIN product_variant v ON p.id_product = v.id_product
WHERE p.id_product = 1 
GROUP BY p.id_product, c.category_name;

SELECT 
    SUM(
        (
            p.base_price + COALESCE(v.additional_price, 0)
        ) * ci.quantity
    ) AS sub_total
FROM cart_item ci
JOIN cart c ON c.id_cart = ci.id_cart
JOIN product p ON p.id_product = ci.id_product
LEFT JOIN product_variant v ON v.id_variant = ci.id_variant
WHERE c.id_user = 1;


-- Section Product (Landing Page)
SELECT 
    p.id_product,
    p.product_name,
    p.description,
    p.base_price,
    pi.image_path
FROM product p
LEFT JOIN product_image pi 
    ON pi.id_product = p.id_product
WHERE p.is_active = TRUE
GROUP BY 
    p.id_product, 
    p.product_name, 
    p.description, 
    p.base_price,
    pi.image_path
LIMIT 4;

-- Section Testimonial
SELECT 
    u.name,
    r.comment,
    r.rating,
    r.created_at
FROM review r
JOIN users u 
    ON u.id_user = r.id_user
ORDER BY r.created_at DESC
LIMIT 5;