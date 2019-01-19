use AdventureWorks2017;

select 'hello world';
select 'hello world' as HelloWorld;
select 'hello world' as [Hello World 2 me ¢];
select 7123*374.88 as HelloWorld;
select 7123*pi() as HelloWorld;
select sqrt(57)*POWER(5, 3) as HelloWorld;
SELECT case
	when 1 = 1 then 'Hello'
	when 3 < 1 then 'World'
	else 'Hello world'
	end as EstructuraCase;
declare @variableUno as int = 13287;
set @variableUno = 1283;
SELECT case @variableUno
	when 1 then 'Hello'
	when 3 then 'World'
	else 'Hello world'
	end as EstructuraCase;
declare @mytable as TABLE (
		y varchar(20) null,
		x int identity  PRIMARY KEY, 
		z datetime not null);
insert into @mytable (z, y) values (
	'20180106 23:00:19.739', 'Hello world');
select * from @mytable;
declare @miHileraUno as VARCHar(20) = 'Hello world';
declare @miHileraDos as VARCHar(20) = 'Hola mundo';
select SUBSTRING(lower (upper(@miHileraUno + ' tail')),3, 5);
select REVERSE (@miHileraDos);
-------------------------------
/*
todo
esto
es
comentario
*/
--------------------------------
--fechas
--------------------------------
declare @miFecha as date = '20190730';
declare @miFechaConHora as datetime = '20190730 18:39:08.032';
select DATEADD (week,-234, @miFecha);
select DATEADD (month,-234, @miFecha);
set @miFechaConHora = 
	DATEADD (MILLISECOND,-257548734, @miFechaConHora);
select @miFechaConHora;
select DATEPART(MINUTE, @miFechaConHora);
select datepart(week, @miFecha);
--------------------------------------
-- BITS
--------------------------------------
declare @misBits as INT = 768432;
declare @misBitsDos as INT = 53273;
-- AND
select @misBits & @misBitsDos;
-- OR
select @misBits | @misBitsDos;

-- NOT
select ~@misBits





