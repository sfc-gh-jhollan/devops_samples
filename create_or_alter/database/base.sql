--!jinja

create schema if not exists bronze;
use schema bronze;
EXECUTE IMMEDIATE FROM './bronze/procedures/seed_data.sql';
EXECUTE IMMEDIATE FROM './bronze/tables/stock_price_timeseries.sql';

create schema if not exists silver;
-- use schema silver;
-- EXECUTE IMMEDIATE FROM './silver/tables/snow_stock.sql' using ( dynamic_warehouse => '{{ dynamic_warehouse }}', snow_stock_name => '{{ snow_stock_name }}' );

-- EXECUTE IMMEDIATE FROM './silver/procedures/snowpark_get_latest_price.sql' using ( git_base => '{{ git_base }}' );