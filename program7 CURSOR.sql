--  Developer:            <Aaron>
--
--  Program #:            <Programming Assignment Number 7>
--
--  Description:
--     <Adding column using ALTER TABLE, and using CURSORS with FOR LOOPS and creating an EXCEPTION handler.>


SET SERVEROUTPUT ON

ALTER TABLE MM_MOVIE
ADD (STK_FLAG varchar2(1));

DECLARE                            -- Declaring CURSOR variable
   CURSOR curM IS
      SELECT stk_flag
        FROM mm_movie
       WHERE movie_value * movie_qty >= 75
      FOR UPDATE;

   l_stk_flag  mm_movie.stk_flag%TYPE;  --> Type
BEGIN
   OPEN curM;

   LOOP
      FETCH curM INTO l_stk_flag;

      EXIT WHEN curM%NOTFOUND;

      UPDATE mm_movie
         SET stk_flag = '*'             --> Setting to.
       WHERE CURRENT OF curM;
   END LOOP;   
   EXCEPTION 
   WHEN NO_DATA_FOUND THEN -- EXCEPTION Handler
           dbms_output.put_line('A problem has occured. Tech support will be notified.');

COMMIT;

   CLOSE curM;
END;
/


-- Output 

SQL> @"C:\ASSIGN SQL\program7 CURSOR.sql"

Table altered.


PL/SQL procedure successfully completed.

SQL>