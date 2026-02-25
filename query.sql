SELECT 
    p.product_name,
    pv.variant_name,
    (p.base_price + pv.additional_price) AS final_price
FROM product p
JOIN product_variant pv 
    ON pv.id_product = p.id_product
WHERE p.id_product = 4
AND pv.id_variant = 6;


SELECT 
    product_name,
    variant_name,
    quantity,
    price
FROM (
    SELECT 
        p.product_name,
        pv.variant_name,
        10 AS quantity,
        ((p.base_price + pv.additional_price) * 10) AS price
    FROM product p
    JOIN product_variant pv 
        ON pv.id_product = p.id_product
    WHERE p.id_product = 4 
        AND pv.id_variant = 7

    UNION ALL

    SELECT 
        p.product_name,
        pv.variant_name,
        10 AS quantity,
        ((p.base_price + pv.additional_price) * 10) AS price
    FROM product p
    JOIN product_variant pv 
        ON pv.id_product = p.id_product
    WHERE p.id_product = 2 
        AND pv.id_variant = 4

    UNION ALL

    SELECT 
        p.product_name,
        pv.variant_name,
        10 AS quantity,
        ((p.base_price + pv.additional_price) * 10) AS price
    FROM product p
    JOIN product_variant pv 
        ON pv.id_product = p.id_product
    WHERE p.id_product = 1 
        AND pv.id_variant = 2

    UNION ALL

    SELECT 
        p.product_name,
        pv.variant_name,
        10 AS quantity,
        ((p.base_price + pv.additional_price) * 10) AS price
    FROM product p
    JOIN product_variant pv 
        ON pv.id_product = p.id_product
    WHERE p.id_product = 5 
        AND pv.id_variant = 9
) AS order_items;


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