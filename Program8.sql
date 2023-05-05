--  Developer:            <Aaron>
--
--  Program #:            <Programming Assignment Number 8>

--     DD_CREATE pledge, pleadgeID>

SET SERVEROUTPUT ON


CREATE OR REPLACE PROCEDURE DDCKPAY_SP (A_PAYMENT IN NUMBER , A_PLEDGE_ID IN NUMBER)
AS
 A_MONTHLY_PAY NUMBER;
BEGIN
 SELECT PLEDGEAMT / PAYMONTHS INTO A_MONTHLY_PAY
 FROM DD_PLEDGE WHERE IDPLEDGE = A_PLEDGE_ID AND PAYMONTHS > 0;
 IF A_PAYMENT = A_MONTHLY_PAY THEN
 DBMS_OUTPUT.PUT_LINE('Correct amount!');
 ELSE
 RAISE_APPLICATION_ERROR(-20050, 'Incorrect payment amount - planned payment is = ' || A_MONTHLY_PAY);
 END IF;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 DBMS_OUTPUT.PUT_LINE('NO PAYMENT INFORMATION');
END DDCKPAY_SP;
/
--TEST Data--
-- Ran these one at a time was having error running them all at once.
BEGIN
DDCKPAY_SP(25, 104);
DDCKPAY_SP(20, 104); 
DDCKPAY_SP(250, 100);
DDCKPAY_SP(300, 200);
EXCEPTION WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('No payment information found ');
end;
/


-- Output 


Procedure DDCKPAY_SP compiled

PAYMENT IS THE CORRECT AMOUNT


PL/SQL procedure successfully completed.

PAYMENT IS THE CORRECT AMOUNT


PL/SQL procedure successfully completed.

NO PAYMENT INFORMATION.


PL/SQL procedure successfully completed.

NO PAYMENT INFORMATION.


PL/SQL procedure successfully completed.

