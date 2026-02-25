```mermaid
erDiagram

    USER ||--o{ ORDER : membuat
    USER ||--|| CART : memiliki
    USER ||--o{ REVIEW : memberi
    USER {
        int id_user PK
        string name
        string email
        string phone
        string address
        string photo
        string role
        timestamp created_at
    }

    CATEGORY ||--o{ PRODUCT : memiliki
    CATEGORY {
        int id_category PK
        string category_name
        timestamp created_at
    }

    PRODUCT ||--o{ PRODUCT_VARIANT : memiliki
    PRODUCT ||--o{ PRODUCT_IMAGE : memiliki
    PRODUCT ||--o{ DETAIL_ORDER : dipesan
    PRODUCT ||--o{ CART_ITEM : ditambahkan
    PRODUCT ||--o{ REVIEW : menerima
    PRODUCT {
        int id_product PK
        int id_category FK
        string product_name
        decimal base_price
        string description
        int stock
        boolean is_active
        timestamp created_at
    }

    PRODUCT_VARIANT {
        int id_variant PK
        int id_product FK
        string variant_name
        decimal additional_price
    }

    PRODUCT_IMAGE {
        int id_image PK
        int id_product FK
        string image_path
    }

    CART ||--o{ CART_ITEM : berisi
    CART {
        int id_cart PK
        int id_user FK
        timestamp created_at
    }

    CART_ITEM {
        int id_cart_item PK
        int id_cart FK
        int id_product FK
        int id_variant FK
        int quantity
    }

    ORDER ||--o{ DETAIL_ORDER : memiliki
    ORDER ||--|| PAYMENT : dibayar_dengan
    ORDER {
        int id_order PK
        int id_user FK
        timestamp order_date
        decimal subtotal
        decimal total_amount
        string status
    }

    DETAIL_ORDER {
        int id_detail_order PK
        int id_order FK
        int id_product FK
        string product_name
        string variant_name
        int quantity
        decimal price
    }

    PAYMENT {
        int id_payment PK
        int id_order FK
        string method
        decimal amount
        string status
        timestamp paid_at
    }

    REVIEW {
        int id_review PK
        int id_user FK
        int id_product FK
        int rating
        string comment
        timestamp created_at
    }
    
```