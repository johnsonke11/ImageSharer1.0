-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               Microsoft SQL Server 2016 (CTP2.2) - 13.0.400.91
-- Server OS:                    Windows 10 Home 6.3 <X64> (Build 10586: )
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for ImageSharer
CREATE DATABASE IF NOT EXISTS "ImageSharer";
USE "ImageSharer";


-- Dumping structure for table ImageSharer.Accounts
CREATE TABLE IF NOT EXISTS "Accounts" (
	"Username" VARCHAR(max) NOT NULL,
	"Email" VARCHAR(max) NOT NULL,
	"Password" VARCHAR(max) NULL DEFAULT NULL
);

-- Data exporting was unselected.


-- Dumping structure for table ImageSharer.Comments
CREATE TABLE IF NOT EXISTS "Comments" (
	"CommentID" INT(10,0) NOT NULL,
	"Commenter" VARCHAR(max) NOT NULL,
	"ImageID" INT(10,0) NOT NULL,
	"CommentText" VARCHAR(max) NULL DEFAULT NULL,
	PRIMARY KEY ("CommentID")
);

-- Data exporting was unselected.


-- Dumping structure for table ImageSharer.Favorites
CREATE TABLE IF NOT EXISTS "Favorites" (
	"FavoriteID" INT(10,0) NOT NULL,
	"CurrentUser" NCHAR(10) NULL DEFAULT NULL,
	"FavoriteUser" NCHAR(10) NULL DEFAULT NULL,
	PRIMARY KEY ("FavoriteID")
);

-- Data exporting was unselected.


-- Dumping structure for table ImageSharer.Images
CREATE TABLE IF NOT EXISTS "Images" (
	"ImageId" INT(10,0) NOT NULL,
	"Uploader" VARCHAR(max) NOT NULL,
	"ImageURL" VARCHAR(max) NULL DEFAULT NULL,
	PRIMARY KEY ("ImageId")
);

-- Data exporting was unselected.


-- Dumping structure for view ImageSharer.PhotosOfYou
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE "PhotosOfYou" (
	"ImageId" INT NOT NULL,
	"Uploader" VARCHAR(max) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"AccountShared" VARCHAR(max) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"ImageURL" VARCHAR(max) NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS'
) ENGINE=MyISAM;


-- Dumping structure for table ImageSharer.Share
CREATE TABLE IF NOT EXISTS "Share" (
	"ShareID" INT(10,0) NOT NULL,
	"ImageID" INT(10,0) NOT NULL,
	"AccountShared" VARCHAR(max) NOT NULL,
	PRIMARY KEY ("ShareID")
);

-- Data exporting was unselected.


-- Dumping structure for procedure ImageSharer.instpdw
DELIMITER //

CREATE PROCEDURE [pdw].[instpdw]
    @DatabaseName NVARCHAR(MAX)
AS
BEGIN
    DECLARE @Sql nvarchar(max);
    SET @Sql = 'USE ' + QUOTENAME(@DatabaseName) + ';    
    PRINT ''Create schema pdw...''
    IF (SCHEMA_ID(''pdw'') IS NULL)
    BEGIN
      DECLARE @sql nvarchar(128)
      SET @sql = ''CREATE SCHEMA pdw''
      EXEC sp_executesql @sql
    END'
	EXEC sp_executesql @Sql;

    SET @Sql = 'USE ' + QUOTENAME(@DatabaseName) + ';
    PRINT ''Create schema QTables...''
    IF (SCHEMA_ID(''QTables'') IS NULL)
    BEGIN
      DECLARE @sql nvarchar(128)
      SET @sql = ''CREATE SCHEMA QTables''
      EXEC sp_executesql @sql
    END'
	EXEC sp_executesql @Sql

    EXECUTE sp_executesql @Sql
END
//
DELIMITER ;


-- Dumping structure for view ImageSharer.PhotosOfYou
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS "PhotosOfYou";
CREATE VIEW dbo.PhotosOfYou
AS
SELECT dbo.Images.ImageId, dbo.Images.Uploader, dbo.Share.AccountShared, dbo.Images.ImageURL
FROM     dbo.Images INNER JOIN
                  dbo.Share ON dbo.Images.ImageId = dbo.Share.ImageID
;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
