/*

================================================================================================
DDL Script: Create Bronze Tables
================================================================================================
Script Purpose:
	Creates tables in the 'Bronze' Schema, dropping existing tables if
	they already exist.
	Running this script will re-define the DDL Structure of 'Bronze' tables.
================================================================================================
*/

-- Selecting DataWarehouse Database
USE DataWarehouse;

-- ################### Creation of Source CRM Tables: ################# 

-- Creation of cust_info Table
IF OBJECT_ID ('Bronze.crm_custinfo', 'U') IS NOT NULL
	DROP TABLE Bronze.crm_custinfo;
CREATE TABLE Bronze.crm_custinfo (
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_material_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);

-- Creation of prd_info Table
IF OBJECT_ID ('Bronze.crm_prdinfo', 'U') IS NOT NULL
	DROP TABLE Bronze.crm_prdinfo;
CREATE TABLE Bronze.crm_prdinfo (
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50), 
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
);

-- Creation of sales_details Table
IF OBJECT_ID ('Bronze.crm_salesdetails', 'U') IS NOT NULL
	DROP TABLE Bronze.crm_salesdetails;
CREATE TABLE Bronze.crm_salesdetails (
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);

-- ################### Creation of Source ERP Tables: ################# 

-- Creation of CUST_AZ12 Table
IF OBJECT_ID ('Bronze.erp_custaz12', 'U') IS NOT NULL
	DROP TABLE Bronze.erp_custaz12;
CREATE TABLE Bronze.erp_custaz12 (
	cid NVARCHAR(50),
	bdate DATE,
	gen NVARCHAR(50)
);

-- Creation of LOC_A101 Table
IF OBJECT_ID ('Bronze.erp_loca101', 'U') IS NOT NULL
	DROP TABLE Bronze.erp_loca101;
CREATE TABLE Bronze.erp_loca101 (
	cid NVARCHAR(50),
	cntry NVARCHAR(50)
);

-- Creation of PX_CAT_G1V2 Table
IF OBJECT_ID ('Bronze.erp_pxcatg1v2', 'U') IS NOT NULL
	DROP TABLE Bronze.erp_pxcatg1v2;
CREATE TABLE Bronze.erp_pxcatg1v2 (
	id NVARCHAR(50),
	cat NVARCHAR(50),
	subcat NVARCHAR(50),
	maintenance NVARCHAR(50)
);