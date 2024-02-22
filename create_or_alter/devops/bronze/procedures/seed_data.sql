CREATE OR REPLACE PROCEDURE insert_data_if_empty()
RETURNS STRING
LANGUAGE SQL
AS
$$
DECLARE
    row_count INTEGER;
BEGIN
    -- Execute count query and store result in a variable
    SELECT COUNT(*) INTO :row_count FROM stock_price_timeseries;
    
    -- Check if the table is empty using the variable
    IF :row_count = 0 THEN
        -- Table is empty, so insert data from the view
        INSERT INTO stock_price_timeseries
        SELECT * FROM stock_price_view;
        
        -- Return a message indicating data was inserted
        RETURN 'Data was inserted into stock_price_timeseries.';
    ELSE
        -- Return a message indicating the table was not empty
        RETURN 'stock_price_timeseries is not empty. No data was inserted.';
    END IF;
END;
$$;