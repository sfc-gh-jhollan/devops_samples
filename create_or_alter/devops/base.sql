--!jinja

EXECUTE IMMEDIATE FROM './bronze/tables/stock_price_timeseries.sql';
EXECUTE IMMEDIATE FROM './silver/tables/snow_stock.sql' using ( dynamic_warehouse => '{{ dynamic_warehouse }}', snow_stock_name => '{{ snow_stock_name }}' );