CREATE OR ALTER TABLE stock_price_timeseries
(
    ticker text,
    asset_class text,
    primary_exchange_code text,
    primary_exchange_name text,
    variable text,
    variable_name varchar(17),
    date date,
    value float,
    jeff text
);

CALL insert_data_if_empty();