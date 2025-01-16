-- För att få resultatet i json, avlusta query med for json auto, eller for json path
-- for json auto är enklats då den autoformaterar. Funkar även med join.
-- for json path kan man själv ange path med dot-notation. Använd isåfall subquery istället för join.

-- select
--     Id,
--     CustomerId as 'Customer',
--     EmployeeId,
--     OrderDate as 'Timestamps.OrderDate',
--     RequiredDate as 'Timestamps.RequiredDate',
--     ShippedDate as 'Timestamps.ShippedDate',
--     ShipVia,
--     Freight,
--     ShipName as 'ShipInfo.Name',
--     ShipAddress as 'ShipInfo.Address',
--     ShipCity as 'ShipInfo.City',
--     ShipRegion as 'ShipInfo.Region',
--     ShipPostalCode as 'ShipInfo.PostalCode',
--     ShipCountry as 'ShipInfo.Country'
-- from 
--     company.orders
-- for json path

-- select
--     o.Id,
--     o.OrderDate,
--     o.CustomerId as 'Customer',
--     Items.ProductId,
--     Items.UnitPrice
-- from
--     company.orders o
--     join company.order_details Items on Items.OrderId = o.Id
-- for json auto

select
    Id,
    CustomerId as 'Customer',
    EmployeeId,
    OrderDate as 'Timestamps.OrderDate',
    RequiredDate as 'Timestamps.RequiredDate',
    ShippedDate as 'Timestamps.ShippedDate',
    ShipVia,
    Freight,
    ShipName as 'ShipInfo.Name',
    ShipAddress as 'ShipInfo.Address',
    ShipCity as 'ShipInfo.City',
    ShipRegion as 'ShipInfo.Region',
    ShipPostalCode as 'ShipInfo.PostalCode',
    ShipCountry as 'ShipInfo.Country',
    (
            select 
            p.ProductName,
            s.CompanyName as 'Supplier.Name',
            s.City as 'Supplier.City',
            s.Country as 'Supplier.Country',
            od.UnitPrice as 'Price',
            Discount,
            Quantity
        from 
            company.order_details od
            join company.products p on p.Id = od.ProductId
            join company.suppliers s on s.Id = p.SupplierId
        where od.OrderId = o.Id

        for json path
    ) as 'Product'
from
    company.orders o
    --join company.order_details Items on Items.OrderId = o.Id
for json path