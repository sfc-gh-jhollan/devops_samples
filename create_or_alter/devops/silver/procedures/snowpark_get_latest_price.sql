--!jinja
CREATE OR REPLACE PROCEDURE get_latest_price(name text)
returns text
language python
runtime_version = '3.10'
packages = ('snowflake-snowpark-python')
handler = 'snowpark_get_latest_price.get_latest_price'
imports = ('{{ git_base }}/create_or_alter/devops/silver/procedures/snowpark/get_latest_price/snowpark_get_latest_price.py')