--!jinja

create schema if not exists bronze;
use schema bronze;
EXECUTE IMMEDIATE FROM './bronze/tables/stock_price_timeseries.sql';

create schema if not exists silver;
use schema silver;
EXECUTE IMMEDIATE FROM './silver/tables/snow_stock.sql' using ( dynamic_warehouse => '{{ dynamic_warehouse }}', snow_stock_name => '{{ snow_stock_name }}' );