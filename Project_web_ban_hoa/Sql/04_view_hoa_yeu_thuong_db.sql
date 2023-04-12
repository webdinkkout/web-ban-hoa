use hoa_yeu_thuong_db
go

CREATE VIEW vw_user_carts AS
SELECT User_id,Thumbnail,Category_Id ,Product_id, Product_name,Price,carts.Quantity,SUM(Carts.quantity) AS total_quantity, SUM(price) AS total_price
FROM carts inner join Products on Products.Id=Carts.Product_Id
GROUP BY User_id, Product_id, Product_name,Price,Thumbnail,Category_Id,carts.Quantity

