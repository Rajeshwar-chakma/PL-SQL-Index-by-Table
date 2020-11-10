DECLARE
    TYPE ABC IS TABLE OF DATE INDEX BY PLS_INTEGER;
    v1 ABC;
BEGIN
    FOR i IN 1..10 LOOP
      v1(i) := sysdate+1;
    END LOOP;
    IF (v1.EXISTS(11)) THEN
        dbms_output.put_line('Element Exists');
    ELSE
        dbms_output.put_line('Element Does Not Exists');
    END IF;
    dbms_output.put_line('Total Number of Elements: '||v1.count);
    v1.delete(7);
    dbms_output.put_line('Total Number of Elements: '||v1.count);
    v1.delete(8,10);
    dbms_output.put_line('Total Number of Elements: '||v1.count);
   
    --Show First and Last Values
    FOR j IN v1.FIRST..v1.LAST LOOP
        dbms_output.put_line(v1(j));
    END LOOP;
    
    --Next & Prior
    dbms_output.put_line('The index after 4 is '||v1.NEXT(4));
    dbms_output.put_line('The index before 4 is '||v1.PRIOR(4));
END;
/