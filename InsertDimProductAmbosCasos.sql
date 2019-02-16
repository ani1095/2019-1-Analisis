declare @hacerLookup as bit = 0;
truncate table DimProduct;
if @hacerLookup = 0
begin
	insert into DimProduct (
		[ProductID]  , 	[ProductName]  , 	[MakeFlag]  ,
		[FinishedGoodsFlag]  , 	[Color]  , 	[StandardCost] ,
		[ListPrice] , 	[Size]  , 	[SizeUnitMeasureCode]  ,
		[WeightUnitMeasureCode] ,	[Weight]  ,
		[Class]  ,	[Style]  ,
		[ProductSubcategoryName]  , 	[ProductCategoryName]  ,
		[ProductModelName] , 		[NombreEstratoStandardCost]  ,
		[NombreEstratoListPrice] , 	[NombreEstratoWeight] 
	)
	select 
		p.[ProductID]  , 	p.Name  , 	p.[MakeFlag]  ,
		p.[FinishedGoodsFlag]  , 	p.[Color]  , 	p.[StandardCost] ,
		p.[ListPrice] , 	p.[Size]  , 	p.[SizeUnitMeasureCode]  ,
		p.[WeightUnitMeasureCode] , 	p.[Weight]  , 	p.[Class]  ,
		p.[Style]  , 	null  ,	null  ,
		null , 		null  , 	null,
		null

	from AdventureWorks2017.Production.Product as p;
end;
else
begin
	insert into DimProduct (
		[ProductID]  , 	[ProductName]  , 	[MakeFlag]  ,
		[FinishedGoodsFlag]  , 	[Color]  , 	[StandardCost] ,
		[ListPrice] , 	[Size]  , 	[SizeUnitMeasureCode]  ,
		[WeightUnitMeasureCode] ,	[Weight]  ,
		[Class]  ,	[Style]  ,
		[ProductSubcategoryName]  , 	[ProductCategoryName]  ,
		[ProductModelName] , 		[NombreEstratoStandardCost]  ,
		[NombreEstratoListPrice] , 	[NombreEstratoWeight] 
	)
	select 
		p.[ProductID]  , 	p.Name  , 	p.[MakeFlag]  ,
		p.[FinishedGoodsFlag]  , 	p.[Color]  , 	p.[StandardCost] ,
		p.[ListPrice] , 	p.[Size]  , 	p.[SizeUnitMeasureCode]  ,
		p.[WeightUnitMeasureCode] , 	p.[Weight]  , 	p.[Class]  ,
		p.[Style]  , 	sc.Name  ,	c.Name  ,
		m.Name , 		null  , 	null,
		null
	from AdventureWorks2017.Production.Product as p
	left join AdventureWorks2017.Production.ProductModel m
		on m.ProductModelID = p.ProductModelID
	left join AdventureWorks2017.Production.ProductSubcategory sc
		on sc.ProductSubcategoryID = p.ProductSubcategoryID
	left join AdventureWorks2017.Production.ProductCategory c
		on sc.ProductCategoryID = c.ProductCategoryID;
end;
-- busque los nombres de los campos de estratificación
UPDATE
	DimProduct
set 
[NombreEstratoStandardCost] =
(select e.Descripcion from DimEstratificacion e
where e.CodigoEstrato = 'COSTO'
and
floor(DimProduct.StandardCost) 
	between e.ValorMinimo and e.ValorMaximo
),
[NombreEstratoListPrice] =
(select e.Descripcion from DimEstratificacion e
where e.CodigoEstrato = 'PRECIO'
and
floor(DimProduct.ListPrice) 
	between e.ValorMinimo and e.ValorMaximo
),
[NombreEstratoWeight] = (
case Weight
	when null then null
else
	(select e.Descripcion from DimEstratificacion e
	where e.CodigoEstrato = 'PESO'
	and
	floor(DimProduct.Weight) 
		between e.ValorMinimo and e.ValorMaximo
	)
end
)
;