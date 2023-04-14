-- GetMaxQuantity()
CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(Quantity)
FROM Orders;

CALL GetMaxQuantity();

-- GetOrderDetail
SET @id = 1;
PREPARE GetOrderDetail 'SELECT OrderID, Quantity, Cost From Orders WHEN CustomerID = ?'
EXECUTE GetOrderDetail USING @id; 

-- CancelOrder
DELIMITER //

CREATE PROCEDURE CancelOrder (IN @OrderID_In INT) 
BEGIN 
DELETE FROM Orders WHERE OrderID = @OrderID_In;
SELECT CONCAT('Order ', @OrderID_In, ' is cancelled') Confirmation;
END //

DELIMITER;