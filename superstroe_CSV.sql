SELECT TOP (1000) [Row_ID]
      ,[Order_Priority]
      ,[Discount]
      ,[Unit_Price]
      ,[Shipping_Cost]
      ,[Customer_ID]
      ,[Customer_Name]
      ,[Ship_Mode]
      ,[Customer_Segment]
      ,[Product_Category]
      ,[Product_Sub_Category]
      ,[Product_Container]
      ,[Product_Name]
      ,[Product_Base_Margin]
      ,[Region]
      ,[State_or_Province]
      ,[City]
      ,[Postal_Code]
      ,[Order_Date]
      ,[Ship_Date]
      ,[Profit]
      ,[Quantity_ordered_new]
      ,[Sales]
      ,[Order_ID]
  FROM [Blinkit_Sales].[dbo].[superstore_CSV]

  use Blinkit_Sales;
  select * from superstore_CSV;

  --total sales--
  select SUM(Sales) AS Total_Sales
  from superstore_CSV;


  --To identify the product with the minimum sales--
  select TOP 1 Product_Name, SUM(Sales) AS Total_Sales
  from superstore_CSV
  GROUP BY Product_Name
  order by Total_Sales ASC;

  --To find out how many unique products are in the company--
  select COUNT(DISTINCT Product_Name) AS Total_Product
  from superstore_CSV;

  --total profit overall--
  select SUM(Profit) AS Total_Profit
  from superstore_CSV;

  --Profitability by Region--
  select Region, SUM(Profit) AS Total_Profit
  from superstore_CSV
  group by Region
  order by Total_Profit DESC;

  --To calculate the yearly profit--
  select YEAR(Order_Date) AS YEAR, SUM(Profit) AS Total_Profit
  from superstore_CSV
  group by YEAR(Order_Date)
  order by YEAR ASC;

  --Top-10 selling Product--
  select TOP 10 Product_Name, Product_Category, SUM(Sales) AS Total_Sales
  from superstore_CSV
  group by Product_Name, Product_Category
  order by Total_Sales DESC;


  --Data cleaning and prepration--
  -----------------------------------
  select Product_Name, Product_Category, Product_Sub_Category, Customer_ID, Order_Date, Sales, COUNT(*) AS Duplicate_Name
  from Blinkit_Sales.dbo.superstore_CSV
  group by Product_Name, Product_Category, Product_Sub_Category,Customer_ID, Order_Date, Sales
  having count(*) > 1;

  select Product_Name, Product_Category, Order_Date, Sales
  from Blinkit_Sales.dbo.superstore_CSV
  where Product_Name = 'Executive Impressions 14" Contract Wall Clock';

  SELECT Product_Name, SUM(Sales) AS Total_Sales, MIN(Order_Date) AS First_Sale, MAX(Order_Date) AS Last_Sale
  FROM Blinkit_Sales.dbo.superstore_CSV
  WHERE Product_Name = 'Executive Impressions 14" Contract Wall Clock'
  GROUP BY Product_Name;--to understand it's timeline--



