use hoa_yeu_thuong_db
GO

CREATE PROC proc_insert_category
@name nvarchar(50),
@seo_name varchar(50),
@thumbnail nvarchar(255)
AS
BEGIN
	insert into categories (Name, Seo_Name,Thumbnail) values (@name,@seo_name,@thumbnail)
END
GO

create PROC proc_get_all_categories
AS
BEGIN
	SELECT * FROM Categories order by Created_at desc
END
GO

CREATE PROC proc_update_category
@id int,
@name nvarchar(50) = null,
@seo_name varchar(50) = null,
@thumbnail nvarchar(255) = null
AS
BEGIN
	UPDATE Categories
		SET
			Name = ISNULL(@name, Name),
			Seo_Name = ISNULL(@seo_name, Seo_Name),
			Thumbnail = ISNULL(@thumbnail, Thumbnail)
		WHERE
			Id = @id

END
GO

CREATE PROC proc_get_one_category
@id int
AS
BEGIN
	SELECT * FROM Categories WHERE Id = @id
END
GO

CREATE PROC proc_delete_category
@id int
AS
BEGIN
	DELETE FROM Categories WHERE Id = @id
END
GO


CREATE PROC proc_get_one_product
@id int
as
begin
	select * from Products where Id = @id 
end
go

create proc proc_get_all_products
as
begin
	select * from Products order by Created_at desc
end
go

create proc proc_delete_product
@id int
as
begin
	delete from Products where Id = @id
end
go

create proc proc_get_products_with_category_id
@category_id int
as
begin
	select * from Products where Category_Id = @category_id order by Created_at desc
end
go