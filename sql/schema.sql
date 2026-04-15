CREATE TABLE if not exists Customers (
    customer_id TEXT NOT NULL,
    customer_unique_id TEXT NOT NULL,
    customer_zip_code TEXT NOT NULL,
    customer_city TEXT NOT NULL,
    customer_state TEXT NOT NULL,

    PRIMARY KEY(customer_id)
);


CREATE TABLE IF NOT EXISTS Geolocation (
    geolocation_zip_code TEXT NOT NULL,
    geolocation_lat REAL NOT NULL,
    geolocation_lon REAL NOT NULL,
    geolocation_city TEXT NOT NULL,
    geolocation_state TEXT NOT NULL
);


CREATE TABLE IF NOT EXISTS Orders (
    order_id TEXT NOT NULL,
    customer_id TEXT NOT NULL,
    order_status TEXT NOT NULL,
    order_purchased_timestamp TEXT NOT NULL,
    order_approved_at TEXT NOT NULL,
    order_delivered_carrier_date TEXT,
    order_delivered_customer_date TEXT,
    order_estimated_deliver_date TEXT NOT NULL,

    PRIMARY KEY(order_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    );


CREATE TABLE IF NOT EXISTS Products (
    product_id TEXT NOT NULL,
    product_category_name TEXT NOT NULL,
    product_name_length INT NOT NULL,
    product_description_length INT NOT NULL,
    product_photos_qty INT,
    product_weight_g INT NOT NULL,
    product_length_cm INT NOT NULL,
    product_height_cm INT NOT NULL,
    product_width_cm INT NOT NULL,

    PRIMARY KEY(product_id)
);


CREATE TABLE IF NOT EXISTS Seller (
   seller_id TEXT NOT NULL,
   seller_zip_code_prefix TEXT NOT NULL,
   seller_city TEXT NOT NULL,
   seller_state TEXT NOT NULL,

   PRIMARY KEY(seller_id)
);


CREATE TABLE IF NOT EXISTS Order_items (
    order_id TEXT NOT NULL,
    order_item_id INT NOT NULL,
    product_id TEXT NOT NULL,
    seller_id TEXT NOT NULL,
    shipping_limit_date TEXT NOT NULL,
    price REAL NOT NULL,
    freight_value REAL NOT NULL,

    PRIMARY KEY(order_id, order_item_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id)
);


CREATE TABLE IF NOT EXISTS Order_payments(
   order_id TEXT NOT NULL,
   payment_sequential INT NOT NULL,
   payment_type TEXT NOT NULL,
   payment_installment INT NOT NULL,
   payment_value REAL NOT NULL,

   FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);



CREATE TABLE IF NOT EXISTS Order_reviews(
   review_id TEXT NOT NULL,
   order_id TEXT NOT NULL,
   review_score INT,
   review_comment_title TEXT,
   review_comment_message TEXT,
   review_creation_date TEXT NOT NULL,
   review_answer_timestamp TEXT NOT NULL,

   PRIMARY KEY(review_id),
   FOREIGN KEY(order_id) REFERENCES Orders(order_id)
);


CREATE TABLE IF NOT EXISTS Product_name_trans(
   product_category_name TEXT NOT NULL,
   product_category_name_english TEXT NOT NULL,

   PRIMARY KEY(product_category_name)
);