-- hårdkodad json i en text-variable
-- declare @json nvarchar(max) = '    {
--         "Id": 10248,
--         "Customer": "VINET",
--         "EmployeeId": 5,
--         "Timestamps": {
--             "OrderDate": "2012-07-04",
--             "RequiredDate": "2012-08-01",
--             "ShippedDate": "2012-07-16"
--         },
--         "ShipVia": 3,
--         "Freight": 1.675000000000000e+001,
--         "ShipInfo": {
--             "Name": "Vins et alcools Chevalier",
--             "Address": "59 rue de l''Abbaye",
--             "City": "Reims",
--             "Region": "Western Europe",
--             "PostalCode": "51100",
--             "Country": "France"
--         },
--         "Product": [
--             {
--                 "ProductName": "Queso Cabrales",
--                 "Supplier": {
--                     "Name": "Cooperativa de Quesos ''Las Cabras''",
--                     "City": "Oviedo",
--                     "Country": "Spain"
--                 },
--                 "Price": 1.400000000000000e+001,
--                 "Discount": 0.000000000000000e+000,
--                 "Quantity": 12
--             },
--             {
--                 "ProductName": "Singaporean Hokkien Fried Mee",
--                 "Supplier": {
--                     "Name": "Leka Trading",
--                     "City": "Singapore",
--                     "Country": "Singapore"
--                 },
--                 "Price": 9.800000000000001e+000,
--                 "Discount": 0.000000000000000e+000,
--                 "Quantity": 10
--             },
--             {
--                 "ProductName": "Mozzarella di Giovanni",
--                 "Supplier": {
--                     "Name": "Formaggi Fortini s.r.l.",
--                     "City": "Ravenna",
--                     "Country": "Italy"
--                 },
--                 "Price": 3.480000000000000e+001,
--                 "Discount": 0.000000000000000e+000,
--                 "Quantity": 5
--             }
--         ]
--     }';

-- Generate_series, string_split, openrowset och openjson är exempel på table-values function (som returnerar tabell data som man kan selecta från)
-- Generate_series fungerar från SQL Server 2022 (Compability level 160) och uppåt.
-- ALTER DATABASE everyloop SET COMPATIBILITY_LEVEL = 160;
-- select * from generate_series(1, 5);

-- select * from string_split('detta är ett exempel på string split', ' ');

-- Läser in json data från en fil med openrowset.
declare @json nvarchar(max) = (select * from openrowset(BULK 'c:\orderdata.json', SINGLE_CLOB) as import)

--print @json

-- Använder openjson() för att hämta och "platta ut" json data till en tabell.
select * from openjson(@json) with (
    Id int,
    Customer nvarchar(20),
    OrderDate DATETIME2 '$.Timestamps.OrderDate',
    ShippedDate DATETIME2 '$.Timestamps.ShippedDate',
    FirstProduct nvarchar(100) '$.Product[0].ProductName'


    --Timestamps nvarchar(max) as json
)

-- select 
--     JSON_VALUE(@json, '$.Customer') as 'Customer',
--     json_value(@json, '$.Timestamps.OrderDate') as 'OrderDate',
--     json_value(@json, '$.Product[0].Supplier.Country') as 'SupplierCountryForProduct1',
--     json_value(@json, '$.Product[1].Supplier.Country') as 'SupplierCountryForProduct2',
--     json_query(@json, '$.Timestamps') 
    

