select a.AddressID, a.City, a.SpatialLocation,
	sp.StateProvinceCode, sp.CountryRegionCode, 
	sp.Name as StateProvinceName,
	cr.Name as CountryRegionName,
	st.Name as SalesTerritoryName
into [MyBdDw]..DimAddress
 from
person.Address a
inner join person.StateProvince sp
	on a.StateProvinceID = sp.StateProvinceID
inner join person.CountryRegion cr
	on cr.CountryRegionCode = sp.CountryRegionCode
inner join Sales.SalesTerritory st
	on st.TerritoryID = sp.TerritoryID
where 1 = 0;

/* el tiempo pasa.... */
insert 
into [MyBdDw]..DimAddress
 select a.AddressID, a.City, a.SpatialLocation,
	sp.StateProvinceCode, sp.CountryRegionCode, 
	sp.Name as StateProvinceName,
	cr.Name as CountryRegionName,
	st.Name as SalesTerritoryName
 from
person.Address a
inner join person.StateProvince sp
	on a.StateProvinceID = sp.StateProvinceID
inner join person.CountryRegion cr
	on cr.CountryRegionCode = sp.CountryRegionCode
inner join Sales.SalesTerritory st
	on st.TerritoryID = sp.TerritoryID
;


