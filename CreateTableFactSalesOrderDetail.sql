USE MyBdDw;
IF OBJECT_ID('FactSalesOrderDetail', 'U') IS NOT NULL
	DROP TABLE FactSalesOrderDetail;
CREATE TABLE FactSalesOrderDetail (
	[SalesOrderID] [int],
	[OrderQty] [smallint],
	[ProductID] [int] ,
	[UnitPrice] [money] ,
	[UnitPriceDiscount] [money] ,
	[LineTotal]   [money]
)