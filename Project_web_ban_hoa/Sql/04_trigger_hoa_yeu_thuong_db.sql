USE hoa_yeu_thuong_db
GO

CREATE TRIGGER trig_add_id_in_seo_name_category
ON Categories
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @id INT
    DECLARE @name NVARCHAR(255)
    DECLARE @seo_name NVARCHAR(255)
    DECLARE @update_flag BIT
    DECLARE @new_seo_name NVARCHAR(255);

    SELECT @id = Id, @name = Name, @seo_name = Seo_Name FROM inserted
    SET @update_flag = 0

    IF UPDATE(Name)
    BEGIN
        SET @update_flag = 1
		SET @new_seo_name = CONCAT(@id, '-', @seo_name)
		UPDATE Categories
		SET Seo_Name = @new_seo_name
		WHERE Id = @id;
		RETURN
    END

    IF @update_flag = 0
    BEGIN
		SET @new_seo_name = CONCAT(@id, '-', @seo_name)
		UPDATE Categories
		SET Seo_Name = @new_seo_name
		WHERE Id = @id;
		RETURN
    END
END
GO


-- PRODUCT --
CREATE TRIGGER trig_add_id_in_seo_name_product
ON Products
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @id INT
    DECLARE @name NVARCHAR(255)
    DECLARE @seo_name NVARCHAR(255)
    DECLARE @update_flag BIT
    DECLARE @new_seo_name NVARCHAR(255);

    SELECT @id = Id, @name = Name, @seo_name = Seo_Name FROM inserted
    SET @update_flag = 0

    IF UPDATE(Name)
    BEGIN
        SET @update_flag = 1
		SET @new_seo_name = CONCAT(@id, '-', @seo_name)
		UPDATE Products
		SET Seo_Name = @new_seo_name
		WHERE Id = @id;
    END

	IF UPDATE(View_Count)
	BEGIN
        SET @update_flag = 1
		RETURN
	END

    IF @update_flag = 0 
    BEGIN
		SET @new_seo_name = CONCAT(@id, '-', @seo_name)
		UPDATE Products
		SET Seo_Name = @new_seo_name
		WHERE Id = @id;
		RETURN
    END
END
GO
