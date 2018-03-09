-- 1) Store sales for Division 11...  join the tables to bring back 1 row and display the sales summary for division 11
select * 
from division, store, storeSales
where DivisionNumber= '001'
and division.id=store.DivisionID
and storeSales.StoreID=store.ID;

select DivisionNumber, sum(storesales.Sales) 
from division, store, storeSales
where DivisionNumber= '001'
and division.id=store.DivisionID
and storeSales.StoreID=store.ID;
-- sum(storesales.sales) gives us sum of all sales, return one row

-- how if you want only uniquestore numbers?
Select distinct (storenumber) FROM bigbox.store;
-- how many store number are duplicates
Select store number
from store
having count (storeNumber >1);

-- from instructor's examples below
-- distinct example
SELECT distinct(storenumber) FROM bigbox.store;

-- having example
select storenumber
 from store 
 having count(storeNumber >1);
 
-- desc example 
 select * from store
   order by StoreName desc;

-- Get sales summary for division 001
select DivisionNumber, sum(storesales.Sales) 
  from division, store, storesales
 where DivisionNumber = '001'
   and division.id = store.DivisionID
   and storesales.StoreID = store.ID;

-- count example   
select count(*) from storesales
 -- where StoreID in (1,2,3,4);
 where StoreID in (select id from store where DivisionID = 1);
 
 -- demo of contraint violation
 insert into store (DivisionId, StoreNumber, StoreName) 
	values
 (2, '00044', 'Riverfront Big Box212222');