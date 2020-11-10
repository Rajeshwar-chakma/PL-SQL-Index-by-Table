DECLARE
    TYPE ABC IS TABLE OF VARCHAR2(20) INDEX BY VARCHAR2(2);
    v1 ABC;
    x VARCHAR2(1);
BEGIN
    v1('A') := 'Apple';
    v1('B') := 'Mango';
    v1('C') := 'Banana';
    v1('D') := 'Jack Fruit';
    x := 'A';
    LOOP
        dbms_output.put_line(v1(x));
        x := v1.next(x);
        EXIT WHEN x IS NULL;
    END LOOP;
END;
/