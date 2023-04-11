USE hoa_yeu_thuong_db
GO

-- CHUNG
Create PROC proc_search
@table_name VARCHAR(50),
@result NVARCHAR(255),
@num_sort Int = 999
AS
BEGIN
	declare @sort varchar(50)
	If (@num_sort = 0)
	begin
		SET @sort = 'ORDER BY current_price DESC' --giá từ cao tới thấp
	end
	else if(@num_sort = 1)
	begin
		SET @sort = 'ORDER BY current_price'
	end	
	else if(@num_sort = 2)
	begin
		SET @sort = 'ORDER BY Name DESC'
	end	
	else if(@num_sort = 3)
	begin
		SET @sort = 'ORDER BY Name'
	end	
	else 
	begin
		set	 @sort = ''
	end

	DECLARE @sql NVARCHAR(MAX)
		SET @sql = 'Select * from ' + QUOTENAME(@table_name) + ' WHERE Name LIKE N''%' + @result + '%'' ' + @sort
		EXEC sp_executesql @sql
END
GO	

Create PROC proc_sort_by_category_id
@table_name VARCHAR(50),
@category_ids varchar(max),
@num_sort Int = 999
AS
BEGIN
	declare @sort varchar(50)
	If (@num_sort = 0)
	begin
		SET @sort = 'ORDER BY current_price DESC' --giá từ cao tới thấp
	end
	else if(@num_sort = 1)
	begin
		SET @sort = 'ORDER BY current_price'
	end	
	else if(@num_sort = 2)
	begin
		SET @sort = 'ORDER BY Name DESC'
	end	
	else if(@num_sort = 3)
	begin
		SET @sort = 'ORDER BY Name'
	end	
	else 
	begin
		set	 @sort = ''
	end

	DECLARE @sql NVARCHAR(MAX)
		IF @category_ids = ''
		BEGIN
			SET @Sql = 'SELECT * FROM Products';
		END
		ELSE
		BEGIN
			SET @Sql = 'SELECT * FROM Products WHERE Category_Id IN (' + @category_ids + ')' + @sort;
		END

		EXECUTE sp_executesql @Sql;
END
GO	


--PROC CATEGORIES
CREATE PROCEDURE proc_pagination_category
@page_number INT,
@page_size INT,
@level INT = 1
AS
BEGIN

    DECLARE @start_row int, @end_row int
    SET @start_row = (@page_number - 1) * @page_size + 1
    SET @end_row = @start_row + @page_size - 1

	SELECT * FROM ( SELECT ROW_NUMBER() OVER (ORDER BY Created_At DESC) as rownum, * FROM  Categories where Level = @level) as rows
    WHERE rownum BETWEEN CAST(@start_row AS nvarchar(10)) AND  CAST(@end_row AS nvarchar(10))
END
GO

create proc proc_count_product_by_category_parent_id
@parent_id int
as
begin
	select count(products.id) as 'Product_count' from Products inner join Categories on Products.Category_Id = Categories.Id where Categories.Parent_Id = @parent_id
end
go

Create PROC proc_insert_category_level_1 -- Thêm danh mục
	@name nvarchar(50),
	@seo_name varchar(50),
	@thumbnail nvarchar(255),
	@parent_id int
AS
BEGIN
	INSERT INTO	dbo.Categories
		(Name,Seo_Name,Thumbnail, Parent_Id,Level)
	values
		(@name, @seo_name, @thumbnail,@parent_id,1)
END
GO

CREATE PROC proc_update_category -- Cập nhật danh mục
	@id int,
	@name nvarchar(50) = null,
	@seo_name varchar(50) = null,
	@thumbnail nvarchar(255) = NULL,
	@parent_id int = null
AS
BEGIN
	UPDATE dbo.Categories
		SET
			Name = ISNULL(@name, Name),
			Seo_Name = ISNULL(@seo_name, Seo_Name),
			Thumbnail = ISNULL(@thumbnail, Thumbnail),
			Parent_Id = ISNULL(@parent_id, Parent_Id),
			updated_at = GETDATE()
		WHERE
			Id = @id
END
GO

CREATE PROC proc_get_one_category --Lấy 1 danh mục với mã danh mục
	@id int
AS
BEGIN
	SELECT *
	FROM dbo.Categories
	WHERE Id = @id

END
GO

CREATE PROC proc_get_categories_by_level
@level INT
AS
BEGIN
	SELECT * FROM Categories WHERE Level = @level ORDER BY Created_At desc
END
GO

CREATE PROC proc_get_category_by_parent_id_and_level
@parent_id INT,
@level INT = 1
AS
BEGIN
	SELECT * FROM Categories WHERE Parent_Id = @parent_id and Level = @level
END
GO


CREATE PROC proc_delete_category -- Xóa danh mục bằng mã danh mục
	@id int
AS
BEGIN
    IF NOT EXISTS(SELECT * FROM dbo.Products WHERE Category_Id = @id) AND NOT EXISTS (SELECT * FROM dbo.Products WHERE Category_Id = @id) 
    	DELETE FROM dbo.Categories WHERE Id = @id
END
GO


--PROC PRODUCTS
CREATE PROCEDURE proc_pagination_product
@page_number INT,
@page_size INT
AS
BEGIN
    DECLARE @start_row int, @end_row int
    SET @start_row = (@page_number - 1) * @page_size + 1
    SET @end_row = @start_row + @page_size - 1

    SELECT * FROM ( SELECT ROW_NUMBER() OVER (ORDER BY Created_At DESC) as rownum, * FROM Products ) as rows
    WHERE rownum BETWEEN  CAST(@start_row AS nvarchar(10))  AND  CAST(@end_row AS nvarchar(10))
END
GO

Create PROCEDURE proc_get_products_by_array_category_id
    @category_ids nvarchar(max) = NULL
AS
BEGIN
    DECLARE @Sql nvarchar(max);

    IF @category_ids = ''
    BEGIN
        SET @Sql = 'SELECT * FROM Products';
    END
    ELSE
    BEGIN
        SET @Sql = 'SELECT * FROM Products WHERE Category_Id IN (' + @category_ids + ')';
    END

    EXECUTE sp_executesql @Sql;
END
go

create PROC proc_get_reletionship_pruduct
@category_id int,
@id int
AS
BEGIN
	select * from Products where Category_Id = @category_id and Id != @id order by Updated_at desc
END
GO


CREATE PROC proc_get_one_product_by_seo_name
	@seo_name VARCHAR(50)
as
begin
	select *
	from dbo.Products
	where Seo_Name = @seo_name
    UPDATE dbo.Products SET View_Count = View_Count + 1 WHERE Seo_Name = @seo_name
end
go

CREATE PROC proc_get_one_product_by_id
@id int
as
begin
select *
	from dbo.Products
	where Id= @id
    UPDATE dbo.Products SET View_Count = View_Count + 1 WHERE id= @id
end
go


CREATE proc proc_delete_product
	@id int
as
BEGIN
        IF EXISTS (SELECT * FROM dbo.Products WHERE Id = @id)
	        DELETE from dbo.Products where Id = @id
end
GO

CREATE PROC proc_get_products_with_category_id
	@category_id int
AS
BEGIN
	select *
	from dbo.Products
	where Category_Id = @category_id
	order by Created_at desc
END
GO  

CREATE PROC proc_update_produt
@id INT,
@name NVARCHAR(50) = NULL,
@seo_name NVARCHAR(50) = NULL,
@desc NVARCHAR(MAX) = NULL,
@view_count INT = NULL,
@old_price FLOAT = NULL,
@current_price FLOAT = NULL,
@quantity INT = NULL,
@sold INT = NULL,
@thumbnail NVARCHAR(MAX) = NULL,
@category_id INT = NULL
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.Products WHERE Id = @id)
		UPDATE
			dbo.Products
		SET
			Name = ISNULL(@name,Name),
			Seo_Name = ISNULL(@seo_name,Seo_Name),
			Description = ISNULL(@desc, Description),
			View_Count = ISNULL(@view_count, View_Count),
			Old_Price = ISNULL(@old_price,Old_Price),
			Current_Price = ISNULL(@current_price,Current_Price),
			Quantity = ISNULL(@quantity, Quantity),
			Sold = ISNULL(@sold, Sold),
			Thumbnail = ISNULL(@thumbnail,Thumbnail),
			Category_Id = ISNULL(@category_id, Category_Id),
			updated_at = GETDATE()
		WHERE
			Id = @id
END
GO	

CREATE PROC proc_insert_product
@name NVARCHAR(50),
@seo_name NVARCHAR(50),
@desc NVARCHAR(MAX),
@old_price FLOAT,
@current_price FLOAT,
@quantity INT,
@thumbnail NVARCHAR(255),
@category_id INT
AS
BEGIN
		INSERT INTO dbo.Products
		(
		    Name,
		    Seo_Name,
		    Description,
		    View_Count,
		    Old_Price,
		    Current_Price,
		    Quantity,
		    Thumbnail,
		    Category_Id
		)
		VALUES
		(  @name,     -- Name - nvarchar(100)
		    @seo_name,      -- Seo_Name - varchar(50)
		    @desc,     -- Description - nvarchar(500)
		    DEFAULT, -- View_Count - int
		    @old_price,    -- Old_Price - decimal(12, 2)
		    @current_price,    -- Current_Price - decimal(12, 2)
		    @quantity, -- Quantity - int
		    @thumbnail,     -- Thumbnail - nvarchar(255)
		    @category_id       -- Category_Id - int
		    )
END
GO	

CREATE PROC proc_search_product_by_min_max_price
@min int,
@max int,
 @category_ids nvarchar(max) = ''
AS
BEGIN
	DECLARE @Sql nvarchar(max);

    IF @category_ids = ''
    BEGIN
        SET @Sql = 'SELECT * FROM Products WHERE Current_Price >= ' + CAST(@min as varchar(20)) + ' AND Current_Price <= ' + CAST(@max as varchar(20));
    END
    ELSE
    BEGIN
        SET @Sql = 'SELECT * FROM Products WHERE Category_Id IN (' + @category_ids + ') AND Current_Price >= ' + CAST(@min as varchar(20)) + ' AND Current_Price <= ' + CAST(@max as varchar(20));
    END

    EXECUTE sp_executesql @Sql;
END
GO


-- NGƯỜI DÙNG
CREATE PROC proc_get_user
@gmail VARCHAR(255)
AS
BEGIN
	SELECT * FROM Users WHERE Email= @gmail
END
GO

CREATE PROC proc_get_one_user_by_id
@id int
as
begin
	select * from Users where id = @id
end
go

CREATE PROC proc_register
@first_name NVARCHAR(50),
@last_name NVARCHAR(50),
@email VARCHAR(255),
@address NVARCHAR(255),
@password VARCHAR(255)
AS
BEGIN
	INSERT INTO dbo.Users
	(
	    First_Name,
	    Last_Name,
		Address,
	    Email,
	    Password,
	    Role_Id,
	    Created_at,
	    updated_at
	)
	VALUES
	(  @first_name,     -- First_Name - nvarchar(50)
	    @last_name,     -- Last_Name - nvarchar(50)
		@address,
	    @email,      -- Email - varchar(100)
	    @password,      -- Password - varchar(255)
		2,       -- Role_Id - int
	    DEFAULT, -- Created_at - datetime2(7)
	    DEFAULT  -- updated_at - datetime2(7)
	    )
END
GO

CREATE PROC proc_update_user
@id INT,
@first_name NVARCHAR(50) = NULL,
@last_name NVARCHAR(20) = NULL
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.Users WHERE Id = @id)
	BEGIN
		UPDATE dbo.Users
		SET
			First_Name = ISNULL(@first_name,
			First_Name), Last_Name=ISNULL(@last_name,Last_Name)
		WHERE Id = @id
	END
END
GO

CREATE PROC proc_swap_password
@id INT,
@old_password VARCHAR(255),
@new_password VARCHAR(255)
AS
BEGIN
		IF EXISTS (SELECT * FROM dbo.Users WHERE Password = @old_password AND Id = @id)
				UPDATE dbo.Users SET Password = @new_password WHERE Id = @id
END
GO

CREATE PROC proc_get_all_users
as
begin
	select * from Users
end
go

CREATE PROC proc_get_users_by_role_id
@role_id int
as
begin
	select * from Users where Role_Id = @role_id
end
go

-- CHỨC NĂNG ADMIN
CREATE PROC proc_delete_user_admin
@id INT
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.Users WHERE Id = @id)
		DELETE dbo.Users WHERE Id = @id
END
GO	

create PROC proc_update_user_admin
@id INT,
@first_name NVARCHAR(50) = NULL,
@last_name NVARCHAR(50) = NULL,
@email VARCHAR(255) = NULL,
@avatar Nvarchar(255) = null,
@address nvarchar(255) = null,
@role_id INT = NULL
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.Users WHERE Id = @id)
		UPDATE dbo.Users 
			SET
				First_Name = ISNULL(@first_name, First_Name),
				Last_Name = ISNULL(@last_name, Last_Name),
				Email = ISNULL(@email, Email),
				Role_Id = ISNULL(@role_id, Role_Id),
				Avatar = ISNULL(@avatar, Avatar),
				Address = ISNULL(@address,Address),
				updated_at = GETDATE()
			WHERE Id = @id
END
GO

CREATE PROC proc_get_one_product_by_id_admin
@id INT
AS
BEGIN
    SELECT * FROM dbo.Products WHERE Id = @id
END
GO



--ROLES
CREATE PROC proc_get_all_roles
as
begin
	select * from Roles
end
go

