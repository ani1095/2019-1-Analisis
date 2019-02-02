USE MyBdDw;
IF OBJECT_ID('FactSalesOrderHeader', 'U') IS NOT NULL
	DROP TABLE FactSalesOrderHeader;
CREATE TABLE FactSalesOrderHeader (
	[SalesOrderID] [int],
	[OrderDate] [datetime] ,
	[DueDate] [datetime] ,
	[ShipDate] [datetime] ,
	[Status] [tinyint] ,
	[StatusDescription] [varchar] (20),
	[OnlineOrderFlag] [bit] ,
	[CustomerID] [int] ,
	[SalesPersonID] [int] ,
	[TerritoryID] [int] ,
	[ShipToAddressID] [int] ,
	[ShipMethodID] [int] ,
	[SubTotal] [money] ,
	[TaxAmt] [money] ,
	[Freight] [money] ,
	[TotalDue] [money],
	[NombreEstratoSubTotal] varchar (50) ,
	[NombreEstratoTax] varchar (50) ,
	[NombreEstratoFreight] varchar (50),
	[NombreEstratoTotalDue] varchar (50)  
);
 