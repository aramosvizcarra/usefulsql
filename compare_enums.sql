select wh.table_name,wh.field_name, wh.enum_list as wh, stock.enum_list as stk 
from  WHGH.afm.afm_flds wh  ,[schema_23.1].afm.afm_flds stock
where wh.table_name  COLLATE DATABASE_DEFAULT = stock.table_name  COLLATE DATABASE_DEFAULT
and wh.field_name  COLLATE DATABASE_DEFAULT= stock.field_name  COLLATE DATABASE_DEFAULT
and wh.enum_list COLLATE DATABASE_DEFAULT<> stock.enum_list COLLATE DATABASE_DEFAULT
