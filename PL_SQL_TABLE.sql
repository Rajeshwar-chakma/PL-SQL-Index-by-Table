DECLARE
    CURSOR c_customers IS
        SELECT id, name, age, address, salary FROM customers;
        
    customers_rec c_customers%rowtype;
    
    TYPE customers_tab_type IS TABLE OF c_customers%rowtype INDEX BY BINARY_INTEGER;
    customers_tab customers_tab_type;

    idx integer := 0;
    FUNCTION check_duplicate(p_name customers.name%type) RETURN BOOLEAN 
    IS
    BEGIN
        dbms_output.put_line('Count = '||customers_tab.count);
        FOR i IN 1..customers_tab.count LOOP
          IF customers_tab(i).name = p_name THEN
            RETURN TRUE;
          END IF;
        END LOOP;
        RETURN FALSE;
    EXCEPTION
      WHEN OTHERS THEN
        dbms_output.put_line('Error: '||sqlerrm);
    END;
BEGIN
    -- FOR n IN c_customers LOOP 
    OPEN c_customers;
    LOOP
        FETCH c_customers INTO customers_rec;
        EXIT WHEN c_customers%NOTFOUND;
        IF (NOT check_duplicate(customers_rec.name)) THEN
          idx := idx+1;
          customers_tab(idx) := customers_rec;
          dbms_output.put_line('Customer('||idx||'): '||customers_tab(idx).name);
        END IF;
    END LOOP; 
END;
/
