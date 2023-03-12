USE hoa_yeu_thuong_db
GO

-- CHUNG
CREATE PROC proc_search
@table_name VARCHAR(50),
@result NVARCHAR(255)
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX)
	SET @sql = 'Select * from ' + QUOTENAME(@table_name) + ' WHERE Name LIKE ''%' + @result + '%'''
    EXEC sp_executesql @sql
END
GO	


CREATE PROCEDURE proc_pagination
@table_name VARCHAR(50),
@page_number INT,
@page_size INT
AS
BEGIN
		SET NOCOUNT ON;

    DECLARE @start_row int, @end_row int
    SET @start_row = (@page_number - 1) * @page_size + 1
    SET @end_row = @start_row + @page_size - 1

    DECLARE @sql nvarchar(max)
    SET @sql = N'SELECT * FROM (
        SELECT ROW_NUMBER() OVER (ORDER BY Created_At DESC) as rownum, *
        FROM ' + QUOTENAME(@table_name) + '
    ) as rows
    WHERE rownum BETWEEN ' + CAST(@start_row AS nvarchar(10)) + ' AND ' + CAST(@end_row AS nvarchar(10))

    EXEC sp_executesql @sql
END
GO

CREATE PROCEDURE proc_pagination_category
@page_number INT,
@page_size INT
AS
BEGIN
		SET NOCOUNT ON;

		DECLARE @start_row int, @end_row int
		SET @start_row = (@page_number - 1) * @page_size + 1
		SET @end_row = @start_row + @page_size - 1

		SELECT *
		FROM (
		  SELECT ROW_NUMBER() OVER (ORDER BY Created_At DESC) as rownum, *
		  FROM dbo.Categories
		) as rows
		WHERE rows.rownum BETWEEN @start_row AND @end_row
END
GO



--PROC CATEGORIES
CREATE PROC proc_insert_category
	@name nvarchar(50),
	@seo_name varchar(50),
	@thumbnail nvarchar(255)
AS
BEGIN
	INSERT INTO	dbo.Categories
		(Name, Seo_Name,Thumbnail)
	values
		(@name, @seo_name, @thumbnail)
END
GO

CREATE PROC proc_update_category
	@id int,
	@name nvarchar(50) = null,
	@seo_name varchar(50) = null,
	@thumbnail nvarchar(255) = NULL
AS
BEGIN
	UPDATE dbo.Categories
		SET
			Name = ISNULL(@name, Name),
			Seo_Name = ISNULL(@seo_name, Seo_Name),
			Thumbnail = ISNULL(@thumbnail, Thumbnail),
			updated_at = GETDATE()
		WHERE
			Id = @id
END
GO

CREATE PROC proc_get_one_category
	@id int
AS
BEGIN
	SELECT *
	FROM dbo.Categories
	WHERE Id = @id

END
GO

CREATE PROC proc_delete_category
	@id int
AS
BEGIN
    IF NOT EXISTS(SELECT * FROM dbo.Products WHERE Category_Id = @id) AND NOT EXISTS (SELECT * FROM dbo.Products WHERE Category_Id = @id) 
    	DELETE FROM dbo.Categories WHERE Id = @id
END
GO


--PROC PRODUCTS
CREATE PROC proc_get_one_product_by_id
	@id int
as
begin
	select *
	from dbo.Products
	where Id = @id
    UPDATE dbo.Products SET View_Count = View_Count + 1 WHERE Id = @id
end
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

-- NGƯỜI DÙNG
CREATE PROC proc_login
@gmail VARCHAR(255),
@password VARCHAR(255)
AS
BEGIN
	SELECT * FROM dbo.Users WHERE Email = @gmail AND Password = @password
END
GO	

CREATE PROC proc_register
@first_name NVARCHAR(50),
@last_name NVARCHAR(50),
@email VARCHAR(255),
@password VARCHAR(255)
AS
BEGIN
	INSERT INTO dbo.Users
	(
	    First_Name,
	    Last_Name,
	    Email,
	    Password,
	    Role_Id,
	    Created_at,
	    updated_at
	)
	VALUES
	(  @first_name,     -- First_Name - nvarchar(50)
	    @last_name,     -- Last_Name - nvarchar(50)
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



-- CHỨC NĂNG ADMIN
CREATE PROC proc_delete_user_admin
@id INT
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.Users WHERE Id = @id)
		DELETE dbo.Users WHERE Id = @id
END
GO	

CREATE PROC proc_update_user_admin
@id INT,
@first_name NVARCHAR(50) = NULL,
@last_name NVARCHAR(50) = NULL,
@email VARCHAR(255) = NULL,
@password VARCHAR(255) = NULL,
@role_id INT = NULL
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.Users WHERE Id = @id)
		UPDATE dbo.Users 
			SET
				First_Name = ISNULL(@first_name, First_Name),
				Last_Name = ISNULL(@last_name, Last_Name),
				Email = ISNULL(@email, Email),
				Password = ISNULL(@password, Password),
				Role_Id = ISNULL(@role_id, Role_Id),
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