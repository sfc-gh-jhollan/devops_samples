{{ config(materialized='view') }}

select * from {{ ref('stock_price_timeseries') }}
where 
    ticker = 'SNOW' 
    and variable in ('pre-market_open', 'post-market_close')
order by date desc