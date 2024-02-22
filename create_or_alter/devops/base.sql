--!jinja

EXECUTE IMMEDIATE FROM FILE './bronze/tables/stock_price_timeseries.sql';
EXECUTE IMMEDIATE FROM FILE './silver/tables/snow_stock' using ( dynamic_warehouse => '{{ dynamic_warehouse }}', snow_stock_name => '{{ snow_stock_name }}' );