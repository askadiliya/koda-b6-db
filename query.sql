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
