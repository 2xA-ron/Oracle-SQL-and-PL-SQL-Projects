--  Developer:            <Aaron>
--
--  Program #:            <Programming Assignment Number 11>
--
--  Description:
--     <Create a trigger,e product ID, total sales in dollars, and the total quantity sold for each product. >



-- Table Create
CREATE TABLE BB_SALES_SUM (
product_id VARCHAR2(30) PRIMARY KEY,
total_sales NUMBER(8,2),
total_qty NUMBER(10),
OrderPlaced number(1)
);


-- Trigger
CREATE OR REPLACE TRIGGER bb_salessum_trg
AFTER UPDATE OF orderplaced ON bb_basket
FOR EACH ROW
WHEN(OLD.orderplaced <> 1 AND NEW.orderplaced = 1)
BEGIN

    UPDATE bb_sales_sum
    SET total_qty = total_qty + :new.quantity
    WHERE product_id = :new.idbasket;

END;
/


-- Test DATA
UPDATE bb_basket SET orderplaced = 1 WHERE idbasket = 14
UPDATE bb_basket SET orderplaced = 1 WHERE idbasket = 15
UPDATE bb_basket SET orderplaced = 1 WHERE idbasket = 16


-- Output 
 
Table BB_SALES_SUM created.


Trigger BB_SALESSUM_TRG compiled


1 row updated.


1 row updated.


1 row updated.