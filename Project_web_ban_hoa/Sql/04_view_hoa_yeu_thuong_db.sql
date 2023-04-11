CREATE VIEW vw_user_carts AS
SELECT User_id, Product_id, Product_name,Price,SUM(quantity) AS total_quantity, SUM(price) AS total_price
FROM carts
GROUP BY User_id, Product_id, Product_name,Price;