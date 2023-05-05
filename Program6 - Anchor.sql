--  Developer:            <Aaron>
--
--  Program #:            <Programming Assignment Number 6>

--
--  Description:
--     <using anchored data type, to retrieve and display information for a specific pledge.>

SET SERVEROUTPUT ON



DECLARE
PLEDGES            DD_PLEDGE%ROWTYPE;
PLEDGE_TOTAL_TO_PAY    DD_PLEDGE.PLEDGEAMT%TYPE;
bal            DD_PLEDGE.PLEDGEAMT%TYPE;
PAID_MONTHS_ NUMBER (5);

BEGIN
SELECT *
INTO PLEDGES
FROM DD_PLEDGE
WHERE IDPLEDGE =& PLEDGE_ID;

PAID_MONTHS_ := PLEDGES.PAYMONTHS;

IF PLEDGES.PAYMONTHS = 0 THEN
PLEDGE_TOTAL_TO_PAY := PLEDGES.PLEDGEAMT;
ELSE PLEDGE_TOTAL_TO_PAY := PAID_MONTHS_ * (PLEDGES.PLEDGEAMT/PLEDGES.PAYMONTHS);
END IF;

bal := PLEDGES.PLEDGEAMT - PLEDGE_TOTAL_TO_PAY;

DBMS_OUTPUT.PUT_LINE('ID: ' || PLEDGES.IDPLEDGE || ', ID of the Donor: ' || PLEDGES.IDDONOR ||
', Amount: ' || PLEDGE_TOTAL_TO_PAY || ' ' || ', Balance: ' || bal);

END;
/



-- Output 

ID: 100, ID of the Donor: 303, Amount: 80 , Balance: 0


PL/SQL procedure successfully completed.
