from snowflake.snowpark import Session
from snowflake.snowpark.functions import col
from os import environ


def get_latest_price(session: Session, name: str) -> str:
    df = session.table("snow_stock")
    df_ordered = df.sort(col("date"), ascending=False)
    latest_price_row = df_ordered.first()
    latest_price = str(latest_price_row["VALUE"])
    return latest_price


if __name__ == "__main__":

    print("Creating session...")
    session = Session.builder.configs(
        {
            "user": environ["SNOWSQL_USER"],
            "password": environ["SNOWSQL_PWD"],
            "account": environ["SNOWSQL_ACCOUNT"],
            "role": environ["SNOWSQL_ROLE"],
            "warehouse": environ["SNOWSQL_WAREHOUSE"],
            "database": environ["SNOWSQL_DATABASE"],
            "schema": environ["SNOWSQL_SCHEMA"],
        }
    ).create()

    print("Running stored procedure...")
    result = get_latest_price(session, "snow")

    print("Stored procedure complete:")
    print(result)
