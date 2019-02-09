use MyBdDw
declare @misOrdenesProcesadas as 
	TABLE (SalesOrderID int PRIMARY KEY);
declare @miFechaInicial as datetime;
declare @miFechaFinal as datetime;
set @miFechaInicial = '2010-09-07';
set @miFechaFinal = '2012-12-18';
insert into @misOrdenesProcesadas (SalesOrderID) 
SELECT h.SalesOrderID
FROM AdventureWorks2017.Sales.SalesOrderHeader h 
WHERE 
@miFechaInicial <= h.OrderDate and h.OrderDate < @miFechaFinal
;
delete FactSalesOrderHeader 
where SalesOrderID IN 
	(select mop.SalesOrderID from @misOrdenesProcesadas mop)
;
/*  OPCIÓN B!!!! 
delete FactSalesOrderHeader 
FROM FactSalesOrderHeader fsoh
	inner join @misOrdenesProcesadas mop
		on mop.SalesOrderID = fsoh.SalesOrderID;
*/

/* LA MISMA OPERATIVA, PERO PARA LA TABLA DE DETAILS !!! */
delete FactSalesOrderDetail 
where SalesOrderID IN 
	(select mop.SalesOrderID from @misOrdenesProcesadas mop)
;
/*  OPCIÓN B!!!! 
delete FactSalesOrderDetail 
FROM FactSalesOrderDetail fsod
	inner join @misOrdenesProcesadas mop
		on mop.SalesOrderID = fsod.SalesOrderID;
*/



insert into FactSalesOrderHeader (	[SalesOrderID] ,
	[OrderDate]  ,	[DueDate]  ,	[ShipDate]  ,
	[Status]  ,	[StatusDescription] ,	[OnlineOrderFlag]  ,
	[CustomerID]  ,	[SalesPersonID]  ,	[TerritoryID]  ,
	[ShipToAddressID]  ,	[ShipMethodID]  ,
	[SubTotal]  ,	[TaxAmt]  ,	[Freight]  ,
	[TotalDue], 	[NombreEstratoSubTotal]  ,
	[NombreEstratoTax]  ,
	[NombreEstratoFreight] ,
	[NombreEstratoTotalDue]   
	 )
select 
	h.[SalesOrderID] ,
	[OrderDate]  ,
	[DueDate]  ,
	[ShipDate]  ,
	[Status]  ,
	null ,
	[OnlineOrderFlag]  ,
	[CustomerID]  ,
	[SalesPersonID]  ,
	[TerritoryID]  ,
	[ShipToAddressID]  ,
	[ShipMethodID]  ,
	[SubTotal]  ,
	[TaxAmt]  ,
	[Freight]  ,
	[TotalDue] ,
	null, null, null, null
from AdventureWorks2017.Sales.SalesOrderHeader h
	inner join @misOrdenesProcesadas mop
	on mop.SalesOrderID = h.SalesOrderID;
;

INSERT INTO FactSalesOrderDetail (
	[SalesOrderID] ,
	[OrderQty] ,
	[ProductID]  ,
	[UnitPrice]  ,
	[UnitPriceDiscount]  ,
	[LineTotal]   
)
SELECT
	sod.[SalesOrderID] ,
	sod.[OrderQty] ,
	sod.[ProductID]  ,
	sod.[UnitPrice]  ,
	sod.[UnitPriceDiscount]  ,
	sod.[LineTotal]   
FROM AdventureWorks2017.Sales.SalesOrderDetail sod
inner join @misOrdenesProcesadas mop
	on mop.SalesOrderID = sod.SalesOrderID
;