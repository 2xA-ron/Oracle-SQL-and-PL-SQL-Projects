--  Developer:            <Aaron>
--
--  Program #:            <Programming Assignment Number 7>
--
--  File Name:            <Program6-Anchor.sql>
--
--  Description:
--     <Using a FUNCTION to retrieve information and have the retrurn display a message.>


SET SERVEROUTPUT ON

Create or replace 
Function MOVIE_STOCK
(movieid NUMBER) 
RETURN VARCHAR2 is


info_string varchar2(150);
title mm_movie.movie_title%type;
quantity mm_movie.movie_qty%type;
BEGIN
SELECT movie_title,movie_qty INTO  title, quantity FROM mm_movie WHERE movie_id=movieid;

IF (quantity >0) THEN
	info_string:=title || ' is available : ' ||quantity || ' on the shelf';   
  
END IF;

RETURN info_string;

EXCEPTION

WHEN NO_DATA_FOUND THEN
  info_string:='Star Wars is not available:';
  RETURN info_string;

END;




-- TEST --

SET SERVEROUTPUT ON     
BEGIN
  DBMS_OUTPUT.PUT_LINE(MOVIE_STOCK (2));
END;
/

SET SERVEROUTPUT ON     
BEGIN
  DBMS_OUTPUT.PUT_LINE(MOVIE_STOCK (3));
END;
/

SET SERVEROUTPUT ON      
BEGIN
  DBMS_OUTPUT.PUT_LINE(MOVIE_STOCK (20));
END;
/


-- Output 

Function MOVIE_STOCK_SF compiled

Bladerunner is available : 3 on the shelf


PL/SQL procedure successfully completed.

Star Wars is available : 11 on the shelf


PL/SQL procedure successfully completed.

Star Wars is not available:


PL/SQL procedure successfully completed.
