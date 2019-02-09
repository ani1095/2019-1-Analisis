USE MyBdDw;
IF OBJECT_ID('DimAddress', 'U') IS NOT NULL
	DROP TABLE DimAddress;

CREATE TABLE DimAddress(
	[AddressID] [int] NULL,
	[City] [nvarchar](30) NULL,
	[SpatialLocation] [geography] NULL,
	[StateProvinceCode] [nchar](3) NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[CountryRegionName] [nvarchar](50) NULL,
	[SalesTerritoryName] [nvarchar](50) NULL
);


