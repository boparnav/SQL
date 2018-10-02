use LearningSQL;
Create table Product (ProductID varchar(20) Primary key Not Null, ProductName varchar(20) Not Null,
							ProductDesc varchar(20) Not Null);

Create table ProductHistory (ProductID varchar(20) Primary key Not Null, ProductName varchar(20) Not Null,
							ProductDesc varchar(20)Not Null);							 
          
insert into  Product values('123','abc','ftferyg');
insert into  Product values('567','ghj','hdfgrhhiuh');

select* from Product;
select* from ProductHistory;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER ProductTr
   ON  Product
   AFTER Insert
AS 

print 'Thankyou';
BEGIN 
	
	SET NOCOUNT ON;
	---Declare variable--
	declare @ProductID varchar(20)
	declare @ProductName varchar(20)
	declare @ProductDesc varchar(20)

	---store values--
   Select @ProductID=Productlist.ProductID from inserted Productlist;
   Select @ProductName=Productlist.ProductName from inserted Productlist;
   Select @ProductDesc=Productlist.ProductDesc from inserted Productlist;
   ----inserting values--

insert into ProductHistory values (@ProductID,@ProductName,@ProductDesc)


END
GO
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              