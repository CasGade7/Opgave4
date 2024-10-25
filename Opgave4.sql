-- Opgave 2:
SELECT * FROM products ORDER BY UnitPrice;

-- Opgave 3:
SELECT * FROM Customers
WHERE Country IN ('UK', 'Spain');

-- Opgave 4:
SELECT * FROM products
WHERE UnitsInStock > 100 AND UnitPrice >= 25; -- Problem, viser kun varer med unitprice over 25.000

-- Opgave 5:
SELECT DISTINCT ShipCountry FROM orders;

-- Opgade 6:
SELECT * FROM Orders
WHERE OrderDate >= '1996-10-01' AND OrderDate < '1996-11-01';

-- Opgave 7:
SELECT *
FROM Orders
WHERE ShipRegion IS NULL -- NULL bruges til at kontrollere blanke værdier
  AND ShipCountry = 'Germany'
  AND Freight >= 100
  AND EmployeeID = 1
  AND YEAR(OrderDate) = 1996;

-- Opgave 8:
SELECT * FROM Orders
WHERE ShippedDate > RequiredDate;

-- Opgave 9:
SELECT * FROM Orders
WHERE ShipCountry = 'Canada' AND OrderDate >= '1997-01-01' AND OrderDate < '1997-05-01';

-- Opgave 10:
SELECT * FROM Orders
WHERE EmployeeID IN (2, 5, 8)
  AND ShipRegion <> ''
  AND ShipVia IN (1, 3)
ORDER BY EmployeeID ASC, ShipVia ASC;

-- Opgave 11:
SELECT * FROM Employees
WHERE Region <> ''
  AND ReportsTo IS NULL
  AND BirthDate <= '1960-12-31'; -- Kan ikke finde en kolonne der hedder ReportsTo?


SELECT * FROM Employees
WHERE Region <> ''
  AND BirthDate <= '1960-12-31'; -- Men den giver 4 resultater og ikke 3?!