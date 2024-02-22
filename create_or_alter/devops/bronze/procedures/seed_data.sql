CREATE OR REPLACE PROCEDURE insert_data_if_empty()
RETURNS STRING
LANGUAGE SQL
AS
$$
BEGIN
    -- Check if the table is empty
    IF (SELECT COUNT(*) FROM stock_price_timeseries) = 0 THEN
        
        -- Table is empty, so insert data from the view
        INSERT INTO stock_price_timeseries
        SELECT * FROM financial__economic_essentials.cybersyn.stock_price_timeseries;
        
        -- Return a message indicating data was inserted
        RETURN 'Data was inserted into stock_price_timeseries.';
    ELSE
        -- Return a message indicating the table was not empty
        RETURN 'stock_price_timeseries is not empty. No data was inserted.';
    END IF;
END;
$$;