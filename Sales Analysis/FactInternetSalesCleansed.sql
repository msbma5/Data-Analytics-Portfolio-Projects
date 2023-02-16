
/* Cleansed FactInternetSales table.
	1. Removing unneccessary columns.
	2. Fetching dates that appear only in the last 2 years starting from now (date of query created) using GETDATE, YEAR and LEFT.
*/

SELECT 
  [ProductKey], 
  [OrderDateKey], 
  [DueDateKey], 
  [ShipDateKey], 
  [CustomerKey],
  --,[PromotionKey]
  --,[CurrencyKey]
  --,[SalesTerritoryKey] 
  [SalesOrderNumber],
  --,[SalesOrderLineNumber]
  --,[RevisionNumber]
  --,[OrderQuantity]
  --,[UnitPrice]
  --,[ExtendedAmount]
  --,[UnitPriceDiscountPct]
  --,[DiscountAmount]
  --,[ProductStandardCost]
  --,[TotalProductCost]
  [SalesAmount],
  --,[TaxAmt]
  --,[Freight]
  --,[CarrierTrackingNumber]
  --,[CustomerPONumber]
  --,[OrderDate]
  --,[DueDate]
  --,[ShipDate]
FROM 
  [AdventureWorksDW2019].[dbo].[FactInternetSales] 
WHERE 
  LEFT(OrderDateKey, 4) >= YEAR(GETDATE()) -2 
ORDER BY 
  OrderDateKey
