import pandas as pd
import sqlite3

conn = sqlite3.connect('data/database/ecommerce_data.db')

with open('sql/schema.sql', 'r') as file:
    content = file.read()

cursor = conn.cursor()
cursor.executescript(content)

# Loading CSV into Tables

# Customers Table
df_customers = pd.read_csv('data/raw/olist_customers_dataset.csv')
df_customers.to_sql('Customers', conn, if_exists = 'replace', index = False)

# Geolocation Table
df_geolocation = pd.read_csv('data/raw/olist_geolocation_dataset.csv')
df_geolocation.to_sql('Geolocation', conn, if_exists='replace', index = False)


#Order Table:
df_orders = pd.read_csv('data/raw/olist_orders_dataset.csv')
df_orders.to_sql('Orders',conn, if_exists= 'replace', index = False)


#Products:
df_products = pd.read_csv('data/raw/olist_products_dataset.csv')
df_products.to_sql('Products', conn, if_exists= 'replace', index = False)


#Seller Table
df_seller = pd.read_csv('data/raw/olist_sellers_dataset.csv')
df_seller.to_sql('Seller', conn, if_exists= 'replace', index = False)


#Order_Item Table:
df_order_item = pd.read_csv('data/raw/olist_order_items_dataset.csv')
df_order_item.to_sql('Order_items', conn, if_exists='replace', index=False)


#Order Payment:
df_order_payment = pd.read_csv('data/raw/olist_order_payments_dataset.csv')
df_order_payment.to_sql('Order_payments',conn, if_exists='replace', index=False)


#Order Reviews:
df_order_reviews = pd.read_csv('data/raw/olist_order_reviews_dataset.csv')
df_order_reviews.to_sql('Order_reviews', conn, if_exists='replace', index = False)


# Product Name Trans:
df_product_name_trans = pd.read_csv('data/raw/product_category_name_translation.csv')
df_product_name_trans.to_sql('Product_name_trans', conn, if_exists='replace', index = False)


conn.commit()

conn.close()