with tempo as (
select
CC_CALL_CENTER_SK,
CC_CALL_CENTER_ID,
CC_REC_START_DATE,
CC_REC_END_DATE,
CC_CLOSED_DATE_SK,
CC_OPEN_DATE_SK,
case when CC_NAME = 'SP Metro' then 'RJ Metro' else CC_NAME end as CC_NAME,
CC_CLASS,
CC_EMPLOYEES,
CC_SQ_FT,
CC_HOURS,
CC_MANAGER,
CC_MKT_ID,
CC_MKT_CLASS,
CC_MKT_DESC,
CC_MARKET_MANAGER,
CC_DIVISION,
CC_DIVISION_NAME,
CC_COMPANY,
CC_COMPANY_NAME,
CC_STREET_NUMBER,
CC_STREET_NAME,
CC_STREET_TYPE,
CC_SUITE_NUMBER,
CC_CITY,
CC_COUNTY,
CC_STATE,
CC_ZIP,
CC_COUNTRY,
CC_GMT_OFFSET,
CC_TAX_PERCENTAGE
from {{ source('jaffle_shop', 'src_call_center') }}
) 
select a.*, DATEADD(DAY, -1, sysdate()) as data_rely from 
tempo a
