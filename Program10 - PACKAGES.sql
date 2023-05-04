--  Developer:            <Aaron>
--
--  Program #:            <Programming Assignment Number 10>
--
--  File Name:            <Program10-Packages.sql>
--
--  Description:
--     <Creating a package containing two overloades procedures>

CREATE OR REPLACE PACKAGE Program10_PKG 
  IS 
  PROCEDURE search_id_pp 
    (p_id IN NUMBER,
     p_Name OUT VARCHAR2,
     p_City OUT VARCHAR2,
     p_State OUT VARCHAR2,
     p_Phone OUT VARCHAR2,
     p_Email OUT VARCHAR2);
  PROCEDURE search_id_pp
  (p_lastn IN VARCHAR2,
   p_Name OUT VARCHAR2,
   p_City OUT VARCHAR2,
   p_State OUT VARCHAR2,
   p_Phone OUT VARCHAR2,
   p_Email OUT VARCHAR2);
END;
/
   
CREATE OR REPLACE PACKAGE BODY Program10_PKG
  IS
  PROCEDURE search_id_pp
    (p_id IN NUMBER,
     p_Name OUT VARCHAR2,
     p_City OUT VARCHAR2,
     p_State OUT VARCHAR2,
     p_Phone OUT VARCHAR2,
     p_Email OUT VARCHAR2)
   IS 
   BEGIN
     SELECT firstname||' '|| lastname, city, state, phone, email
	 INTO p_Name, p_City, p_State, p_Phone, p_Email
	 FROM bb_shopper
	 WHERE idshopper = p_id;
	 END;
   PROCEDURE search_id_pp
  (p_lastn IN VARCHAR2,
   p_Name OUT VARCHAR2,
   p_City OUT VARCHAR2,
   p_State OUT VARCHAR2,
   p_Phone OUT VARCHAR2,
   p_Email OUT VARCHAR2)
  IS 
   BEGIN
     SELECT firstname||' '|| lastname, city, state, phone, email
	 INTO p_Name, p_City, p_State, p_Phone, p_Email
	 FROM bb_shopper
	 WHERE lastname = p_lastn;
 END;
END;
/

-- Ran these one at a time to get all the outcomes with 23, 30 and Ratman.
DECLARE 
  lv_nm VARCHAR2 (25);
  lv_cty VARCHAR2 (15);
  lv_st VARCHAR2 (15);
  lv_ph VARCHAR2 (11);
  lv_eml VARCHAR2 (18);
BEGIN
   /* Program10_PKG.search_id_pp(23, lv_nm, lv_cty, lv_st, lv_ph, lv_eml);
   DBMS_OUTPUT.PUT_LINE(lv_nm);
   DBMS_OUTPUT.PUT_LINE(lv_cty);
   DBMS_OUTPUT.PUT_LINE(lv_st);
   DBMS_OUTPUT.PUT_LINE(lv_ph);
   DBMS_OUTPUT.PUT_LINE(lv_eml); */
   
/*    Program10_PKG.search_id_pp(30, lv_nm, lv_cty, lv_st, lv_ph, lv_eml);
   DBMS_OUTPUT.PUT_LINE(lv_nm);
   DBMS_OUTPUT.PUT_LINE(lv_cty);
   DBMS_OUTPUT.PUT_LINE(lv_st);
   DBMS_OUTPUT.PUT_LINE(lv_ph);
   DBMS_OUTPUT.PUT_LINE(lv_eml); */
   
   Program10_PKG.search_id_pp('Ratman', lv_nm, lv_cty, lv_st, lv_ph, lv_eml);
   DBMS_OUTPUT.PUT_LINE(lv_nm);
   DBMS_OUTPUT.PUT_LINE(lv_cty);
   DBMS_OUTPUT.PUT_LINE(lv_st);
   DBMS_OUTPUT.PUT_LINE(lv_ph);
   DBMS_OUTPUT.PUT_LINE(lv_eml);
  EXCEPTION
     WHEN NO_DATA_FOUND THEN
	 DBMS_OUTPUT.PUT_LINE('No record was found.');
END;


-- Output

Package PROGRAM10_PKG compiled


Package Body PROGRAM10_PKG compiled

Kenny Ratman
South Park
NC
9015680902
ratboy@msn.net


PL/SQL procedure successfully completed.

No record was found.


PL/SQL procedure successfully completed.

Kenny Ratman
South Park
NC
9015680902
ratboy@msn.net


PL/SQL procedure successfully completed.

