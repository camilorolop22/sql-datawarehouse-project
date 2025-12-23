/* -- For starting a Block comment in SQL
=========================================
Creating Database and Schemas
=========================================
Script Purpose: 
	This scripts creates a new Database named 'DataWarehouse' after checking if it already exists.
	If the Database exists, it's dropped and recreated. Additionally, the script sets up three Schemas, 
	for each defined Layer in the Medallion Architecture: Bronze, Silver and Gold. 

WARNING: 
	If 'DataWarehouse' already exists, running this script will drop the entire Database. All Data will be 
	permamently deleted.
*/ -- For finishing Block comment in SQL 


-- Switching to Master
USE master;
GO				-- GO: Separates batches when working with multiple SQL statements.

-- Drop and recreate the 'DataWarehouse' Database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Creating Database
CREATE DATABASE DataWarehouse;
GO

-- Switching to the Created Database
USE DataWarehouse;
GO

-- Creating Bronze, Silver and Gold Schemas
CREATE SCHEMA Bronze;
GO					
CREATE SCHEMA Silver;
GO					
CREATE SCHEMA Gold;
GO