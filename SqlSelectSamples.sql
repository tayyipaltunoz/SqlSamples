-- sql case insensitive - büyük küçük harf duyarsızdır
-- istenilen kolonları verilen isimler ile listelenir
select ContactName Adı, City Şehir from Customers
-- where şartına göre sadece şehri london olanlar listelenir
select * from Customers where City='London'
-- categoryId si 1 veya 3 olanlar listelenecektir
select * from Products where CategoryID=1 or CategoryID=3
-- categoryId 1 olanlar ve UnitPrice>=10 olanlar listelenir
select * from Products where CategoryID=1 and UnitPrice>=10
-- categoryId 1 olanlar ve UnitPrice<>10 ın dışında olanlar listelenir
select * from Products where CategoryID=1 and UnitPrice<>10
-- Products ı Productname göre sırala | order by sırala demek | alfabetik olarak sıralama yapacak
select * from Products order by ProductName
-- Products ı categoryId ve ProductName göre listedme yapar
select * from Products order by CategoryID,ProductName
-- ascending - artan order by default u asc dir
select * from Products order by UnitPrice desc --ascding -- disending - azalan
--
select * from Products where CategoryID=1 order by UnitPrice asc
-- products ta kaç tane urun var onu listeler
select count(*) from Products
-- categoryId=2 olanların miktarını verir
select count(*) from Products where CategoryID=2
-- categoryId leri tekrar etmeyecek şekilde listeler
select categoryId from Products group by CategoryID
-- hangi kategoride ne kadar urun olduğunu listeler
select categoryId,COUNT(*) from Products group by CategoryID
-- count - sayısı - avg - ortalama - sum - toplam  ---------- having group by a konu olan kümülatif sorguya yazılır
-- bana içerisinde 10 taneden az  olan urun kategorilerini ver
select categoryId,COUNT(*) from Products group by CategoryID having count(*)<10
-- her zaman önce where çalışır
select categoryId,COUNT(*) from Products where unitprice>20 group by CategoryID having count(*)<10

-- Products inner join Categories -- inner join tabloları birleştirmek için kullanılır
-- Products.CategoryID = Categories.CategoryID -- inner join sadece iki tabloda da eşleşenleri bir araya getirir

select Products.ProductID, Products.ProductName, Products.UnitPrice, Categories.CategoryName
from Products inner join Categories 
on Products.CategoryID = Categories.CategoryID

-- DTO Data Transformation Object
-- left join soldaki tabloda olup sağdaki tabloda olmayanları getirir 
-- tablo isminden sonraki harf kısaltma olarak verildi ondan sonra o kısaltma kullanılırak sorgu yazılır
select * from Products p left join [Order Details] od 
on p.ProductID = od.ProductID
-- siparişi olmayan müşteriler
select * from Customers c left join Orders o
on c.CustomerID=o.CustomerID
where o.CustomerID is null