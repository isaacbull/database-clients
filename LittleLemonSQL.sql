SHOW SCHEMAS;
USE littlelemondb;
SHOW TABLES;

/* WEEK 2 */ 
-- create OrdersView
CREATE VIEW littlelemondb.OrdersView AS (
    SELECT OrderID, Quantity, Cost 
    FROM Orders 
)

-- all customers with orders that cost more than $150
SELECT 
  c.CustomerID,
  c.FullName,
  o.OrderID,
  o.Cost,
  m.MenuName,
  mi.CourseName
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID 
INNER JOIN Menus m ON o.MenuID = m.MenuID 
INNER JOIN MenuItems mi ON m.MenuItemID = mi.MenuItemID
WHERE o.Cost > 150 
ORDER BY Cost ASC;

-- all menu name for which more than 2 orders have been placed 
SELECT 
  MenuName 
FROM Menus 
WHERE MenuID = ANY (
    SELECT 
      MenuID
    FROM Orders 
    GROUP BY MenuID 
    HAVING COUNT(DISTINCT OrdersID) > 2
);

