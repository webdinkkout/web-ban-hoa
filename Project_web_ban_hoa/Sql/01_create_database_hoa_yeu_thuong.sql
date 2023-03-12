IF EXISTS(SELECT name FROM master.dbo.sysdatabases WHERE name = 'hoa_yeu_thuong_db')
BEGIN
    ALTER DATABASE [hoa_yeu_thuong_db] SET OFFLINE WITH ROLLBACK IMMEDIATE;
    ALTER DATABASE [hoa_yeu_thuong_db] SET ONLINE;
    DROP DATABASE [hoa_yeu_thuong_db];
    PRINT 'Deleted database successed!'
END

CREATE DATABASE [hoa_yeu_thuong_db];
PRINT 'Created database successed!'
