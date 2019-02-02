USE MyBdDw;
IF OBJECT_ID('DimProduct', 'U') IS NOT NULL
	DROP TABLE DimProduct;
CREATE TABLE DimProduct (
	[ProductID] [int] ,
	[ProductName] [nvarchar](50) ,
	[MakeFlag] bit ,
	[FinishedGoodsFlag] bit ,
	[Color] [nvarchar](15) ,
	[StandardCost] [money] ,
	[ListPrice] [money] ,
	[Size] [nvarchar](5) ,
	[SizeUnitMeasureCode] [nchar](3) ,
	[WeightUnitMeasureCode] [nchar](3) ,
	[Weight] [decimal](8, 2) ,
	[Class] [nchar](2) ,
	[Style] [nchar](2) ,
	[ProductSubcategoryName] [nvarchar](50) ,
	[ProductCategoryName] [nvarchar](50) ,
	[ProductModelName] [nvarchar](50),
	[NombreEstratoStandardCost] varchar (50) ,
	[NombreEstratoListPrice] varchar (50),
	[NombreEstratoWeight] varchar (50)
);