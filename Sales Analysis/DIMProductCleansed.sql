
-- Cleansed DIMProduct Table
	-- Removing unneccesary columns.
	-- Renaming columns.
	-- Adding new columns from other tables using LEFT JOIN.
	-- Updating NULL cells to 'outdated' using ISNULL.


SELECT 
  [ProductKey], 
  [ProductAlternateKey] AS ProductItemCode, 
  --,[ProductSubcategoryKey]
  --,[WeightUnitMeasureCode]
  --,[SizeUnitMeasureCode]
  [EnglishProductName] AS ProductName, 
  ps.EnglishProductSubcategoryName AS SubCategory, 
  pc.EnglishProductCategoryName AS ProductCategory, 
  --,[SpanishProductName]
  --,[FrenchProductName]
  --,[StandardCost]
  --,[FinishedGoodsFlag]
  [Color] AS ProductColour, 
  --,[SafetyStockLevel]
  --,[ReorderPoint]
  --,[ListPrice]
  [Size] AS ProductSize, 
  --,[SizeRange]
  --,[Weight]
  --,[DaysToManufacture]
  [ProductLine] AS ProductLine, 
  --,[DealerPrice]
  --,[Class]
  --,[Style]
  [ModelName] AS ProductModelName, 
  --,[LargePhoto]
  [EnglishDescription] AS ProductDescription, 
  --,[FrenchDescription]
  --,[ChineseDescription]
  --,[ArabicDescription]
  --,[HebrewDescription]
  --,[ThaiDescription]
  --,[GermanDescription]
  --,[JapaneseDescription]
  --,[TurkishDescription]
  --,[StartDate]
  --,[EndDate]
  ISNULL([Status], 'Outdated') AS ProductStatus 
FROM 
  [AdventureWorksDW2019].[dbo].[DimProduct] p 
  LEFT JOIN dbo.DimProductSubcategory ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
  LEFT JOIN dbo.DimProductCategory pc ON pc.ProductCategoryKey = ps.ProductCategoryKey 
ORDER BY 
  ProductKey
