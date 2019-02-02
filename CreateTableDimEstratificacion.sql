USE MyBdDw;
IF OBJECT_ID('DimEstratificacion', 'U') IS NOT NULL
	DROP TABLE DimEstratificacion;
CREATE TABLE DimEstratificacion (
	ID int PRIMARY KEY,
	CodigoEstrato VARCHAR (10),
	Descripcion VARCHAR (50),
	ValorMinimo float,
	ValorMaximo float
)
;