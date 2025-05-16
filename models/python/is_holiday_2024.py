import holidays
import pandas

#dbt python models need to be defined at the start with this syntax
def model(dbt,session):
    #Materialize to tables
    dbt.config(
        materialized="table",
        packages=['pandas','holidays']
    )
    
    #make changes here
    #Get us holiday
    us_holidays = holidays.US()

    #Python model don't use Jinja
    df = dbt.ref('date_spine').to_pandas()

    df['IS_HOLIDAY'] = df['DATE_DAY'].apply(lambda date: date in us_holidays)

    #in dbt, alreays return data frame at the end
    return df
