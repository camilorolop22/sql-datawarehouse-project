/*

================================================================================================
Load Script: Loading Bronze Layer (Source -> Bronze)
================================================================================================
Script Purpose:
	Loads data into the 'Bronze' Schema from external CSV files.
	This is then condensed into an Stored Procedure. 

================================================================================================
*/

-- Defining the Store Procedure
CREATE OR ALTER PROCEDURE Bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @initial_time DATETIME -- Declaring Variables
	BEGIN TRY
		SET @initial_time = GETDATE();
		PRINT '========================================';
		PRINT 'Loading Bronze Layer';
		PRINT '========================================';

		PRINT '----------------------------------------';
		PRINT 'Loading CRM Tables'
		PRINT '----------------------------------------';

		-- Bulk Insert of cust_info Table
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: crm_custinfo';
		TRUNCATE TABLE Bronze.crm_custinfo; -- Eliminating all rows in Table before Inserting.
		PRINT '>> Inserting Data into Table: crm_custinfo';
		BULK INSERT Bronze.crm_custinfo
		FROM 'D:\Desktop\Cursos y certificaciones\Cursos - Profesional\Building a Modern Data Warehouse - Data Engineer Bootcamp - Udemy\Project\sql-datawarehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',  -- Equals to Separator.
			TABLOCK  -- Locking the Table while loading to improve performance
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(millisecond, @start_time, @end_time) AS NVARCHAR) + ' milliseconds'
		PRINT '----------------------------------------';

		-- Bulk Insert of prd_info Table
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: crm_prdinfo';
		TRUNCATE TABLE Bronze.crm_prdinfo; -- Eliminating all rows in Table before Inserting.
		PRINT '>> Inserting Data into Table: crm_prdinfo';
		BULK INSERT Bronze.crm_prdinfo
		FROM 'D:\Desktop\Cursos y certificaciones\Cursos - Profesional\Building a Modern Data Warehouse - Data Engineer Bootcamp - Udemy\Project\sql-datawarehouse-project\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',  -- Equals to Separator.
			TABLOCK  -- Locking the Table while loading to improve performance
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(millisecond, @start_time, @end_time) AS NVARCHAR) + ' milliseconds'
		PRINT '----------------------------------------';

		-- Bulk Insert of prd_info Table
        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: crm_salesdetails';
		TRUNCATE TABLE Bronze.crm_salesdetails; -- Eliminating all rows in Table before Inserting.
		PRINT '>> Inserting Data into Table: crm_salesdetails';
		BULK INSERT Bronze.crm_salesdetails
		FROM 'D:\Desktop\Cursos y certificaciones\Cursos - Profesional\Building a Modern Data Warehouse - Data Engineer Bootcamp - Udemy\Project\sql-datawarehouse-project\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',  -- Equals to Separator.
			TABLOCK  -- Locking the Table while loading to improve performance
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(millisecond, @start_time, @end_time) AS NVARCHAR) + ' milliseconds'

		PRINT '----------------------------------------';
		PRINT 'Loading ERP Tables'
		PRINT '----------------------------------------';

		-- Bulk Insert of cust_az12 Table
        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: erp_custaz12';
		TRUNCATE TABLE Bronze.erp_custaz12; -- Eliminating all rows in Table before Inserting.
		PRINT '>> Inserting Data into Table: erp_custaz12';
		BULK INSERT Bronze.erp_custaz12
		FROM 'D:\Desktop\Cursos y certificaciones\Cursos - Profesional\Building a Modern Data Warehouse - Data Engineer Bootcamp - Udemy\Project\sql-datawarehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',  -- Equals to Separator.
			TABLOCK  -- Locking the Table while loading to improve performance
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(millisecond, @start_time, @end_time) AS NVARCHAR) + ' milliseconds'
		PRINT '----------------------------------------';

		-- Bulk Insert of loc_a101 Table
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: erp_loca101';
		TRUNCATE TABLE Bronze.erp_loca101; -- Eliminating all rows in Table before Inserting.
		PRINT '>> Inserting Data into Table: erp_loca101';
		BULK INSERT Bronze.erp_loca101
		FROM 'D:\Desktop\Cursos y certificaciones\Cursos - Profesional\Building a Modern Data Warehouse - Data Engineer Bootcamp - Udemy\Project\sql-datawarehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',  -- Equals to Separator.
			TABLOCK  -- Locking the Table while loading to improve performance
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(millisecond, @start_time, @end_time) AS NVARCHAR) + ' milliseconds'
		PRINT '----------------------------------------';

		-- Bulk Insert of PX_CAT_G1V2 Table
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: erp_pxcatg1v2';
		TRUNCATE TABLE Bronze.erp_pxcatg1v2; -- Eliminating all rows in Table before Inserting.
		PRINT '>> Inserting Data into Table: erp_pxcatg1v2';
		BULK INSERT Bronze.erp_pxcatg1v2
		FROM 'D:\Desktop\Cursos y certificaciones\Cursos - Profesional\Building a Modern Data Warehouse - Data Engineer Bootcamp - Udemy\Project\sql-datawarehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',  -- Equals to Separator.
			TABLOCK  -- Locking the Table while loading to improve performance
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(millisecond, @start_time, @end_time) AS NVARCHAR) + ' milliseconds'

		PRINT '========================================';
		PRINT 'Loading Bronze Layer is completed'
		PRINT '>> Complete Bronze Layer Load Duration: ' + CAST(DATEDIFF(millisecond, @initial_time, @end_time) AS NVARCHAR) + ' milliseconds'
		PRINT '========================================';

	END TRY
	BEGIN CATCH
		PRINT '========================================';
		PRINT 'Error ocurred during Bronze Layer Loading';
		PRINT 'Error Message:' + ERROR_MESSAGE();
		PRINT 'Error Number:' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error State:' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '========================================';
	END CATCH
END