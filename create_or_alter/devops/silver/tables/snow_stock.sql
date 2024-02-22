--!jinja
CREATE OR REPLACE DYNAMIC TABLE {{ snow_stock_name }}
TARGET_LAG = '1 hour'
WAREHOUSE = {{ dynamic_warehouse }}
AS
select * from financial__economic_essentials.cybersyn.stock_price_timeseries
where 
    ticker = 'SNOW' 
    and variable in ('pre-market_open', 'post-market_close')
order by date desc;