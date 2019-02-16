select 
min (p.ListPrice) as x,
max (p.ListPrice) as y,
min (p.StandardCost) as w,
max (p.StandardCost) as z,
min (p.Weight) as a,
max (p.Weight) as b
 from
AdventureWorks2017.Production.Product p
