USE hoa_yeu_thuong_db
GO

--Proc chung
DROP PROC dbo.proc_pagination
GO

-- Xóa các proc category
DROP PROC dbo.proc_get_one_category
GO

DROP PROC dbo.proc_insert_category
GO

DROP PROC dbo.proc_update_category
GO

DROP PROC dbo.proc_delete_category
GO


--Xóa các proc product
DROP PROC dbo.proc_get_one_product
GO

DROP PROC dbo.proc_get_products_with_category_id
GO

DROP PROC dbo.proc_delete_product
GO


