
/* Cleanse DIMCustomer table.
	1. Removed unneccesary columns.
	2. Renamed columns.
	3. Creating full name using CONCAT.
	4. Renaming M/F to Male/Female using CASE.
	5. Getting city column from another table using LEFT JOIN.
	6. Sorting the table by customer key using ORDER BY.
*/


SELECT 
  [CustomerKey] AS CustomerKey, 
  --,[GeographyKey]
  --,[CustomerAlternateKey]
  --,[Title]
  [FirstName] AS FirstName, 
  --,[MiddleName]
  [LastName] AS LastName, 
  CONCAT([FirstName], ' ', [LastName]) AS FullName, 
  --,[NameStyle]
  --,[BirthDate]
  --,[MaritalStatus]
  --,[Suffix]
  CASE [Gender] WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender, 
  --,[EmailAddress]
  --,[YearlyIncome]
  --,[TotalChildren]
  --,[NumberChildrenAtHome]
  --,[EnglishEducation]
  --,[SpanishEducation]
  --,[FrenchEducation]
  --,[EnglishOccupation]
  --,[SpanishOccupation]
  --,[FrenchOccupation]
  --,[HouseOwnerFlag]
  --,[NumberCarsOwned]
  --,[AddressLine1]
  --,[AddressLine2]
  --,[Phone]
  [DateFirstPurchase] AS DateFirstPurchase, 
  --,[CommuteDistance]
  g.City AS CustomerCity 
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] c 
  LEFT JOIN dbo.DimGeography g ON g.GeographyKey = c.GeographyKey 
ORDER BY 
  CustomerKey
