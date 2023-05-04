--  Developer:            <Aaron>
--
--  Program #:            <Programming Assignment Number 12>
--
--
--  Description:
--     <Using Native Dynamic, allow customers to do product search by selecting a product name or description>


SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE SEARCH_SP
( searchTerm IN VARCHAR2,
 search_value IN VARCHAR2) 
 IS
    lv_query VARCHAR2(400);
    lv_name bb_product.productname%TYPE;
    lv_desc bb_product.description%TYPE;
    lv_price bb_product.price%TYPE;
BEGIN 
   lv_query := 
   'SELECT ProductName, DESCRIPTION, Price
   FROM BB_Product
   WHERE UPPER ( ' || searchTerm|| ') = UPPER (:search_value)';
   DBMS_OUTPUT.PUT_LINE('lv_query =' || lv_query);
   EXECUTE IMMEDIATE lv_query 
   INTO lv_name, lv_desc, lv_price
   USING search_value;
      DBMS_OUTPUT.PUT_LINE(lv_name ||' '|| lv_desc ||' ' || lv_price);
END;
/

-- Test Runs ProductName
BEGIN
  SEARCH_SP('productname', 'Guatamala');
  SEARCH_SP('productname', 'Espresso');
  SEARCH_SP('productname', 'Eileen 4-cup French Press');
  SEARCH_SP('productname', 'CapressoBar Model #351');
END;
/
-- Test Runs Description
BEGIN
  SEARCH_SP('description', 'A fully programmable pump espresso machine and 10-cup coffee maker complete with GoldTone filter');
  SEARCH_SP('description', 'dry, nutty flavor and smoothness');
  SEARCH_SP('description', 'well-balanced mellow flavor, a medium body with hints of cocoa and a mild, nut-like aftertaste');
  SEARCH_SP('description', 'Avoid blade grinders! This mill grinder allows you to choose a fine grind to a coarse grind.');
END;
/

-- Output 

Procedure SEARCH_SP compiled

lv_query =SELECT ProductName, DESCRIPTION, Price
   FROM BB_Product
   WHERE UPPER ( productname) = UPPER (:search_value)
Guatamala heavy body, spicy twist, aromatic and smokey flavor. 10
lv_query =SELECT ProductName, DESCRIPTION, Price
   FROM BB_Product
   WHERE UPPER ( productname) = UPPER (:search_value)
Espresso dense, caramel-like sweetness with a soft acidity. Roasted somewhat darker than traditional Italian. 10
lv_query =SELECT ProductName, DESCRIPTION, Price
   FROM BB_Product
   WHERE UPPER ( productname) = UPPER (:search_value)
Eileen 4-cup French Press A unique coffeemaker from those proud craftsmen in windy Normandy. 32.5
lv_query =SELECT ProductName, DESCRIPTION, Price
   FROM BB_Product
   WHERE UPPER ( productname) = UPPER (:search_value)
CapressoBar Model #351 A fully programmable pump espresso machine and 10-cup coffee maker complete with GoldTone filter 99.99


PL/SQL procedure successfully completed.

lv_query =SELECT ProductName, DESCRIPTION, Price
   FROM BB_Product
   WHERE UPPER ( description) = UPPER (:search_value)
CapressoBar Model #351 A fully programmable pump espresso machine and 10-cup coffee maker complete with GoldTone filter 99.99
lv_query =SELECT ProductName, DESCRIPTION, Price
   FROM BB_Product
   WHERE UPPER ( description) = UPPER (:search_value)
Columbia dry, nutty flavor and smoothness 10.8
lv_query =SELECT ProductName, DESCRIPTION, Price
   FROM BB_Product
   WHERE UPPER ( description) = UPPER (:search_value)
Brazil well-balanced mellow flavor, a medium body with hints of cocoa and a mild, nut-like aftertaste 10.8
lv_query =SELECT ProductName, DESCRIPTION, Price
   FROM BB_Product
   WHERE UPPER ( description) = UPPER (:search_value)
Coffee Grinder Avoid blade grinders! This mill grinder allows you to choose a fine grind to a coarse grind. 28.5


PL/SQL procedure successfully completed.
