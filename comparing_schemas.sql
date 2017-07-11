---
--new tables: Find number of new tables are in the new schema (23.1)
---
select s1.name, s2.name from (select t1.name from [schema_23.1].sys.tables t1) s1 left outer join (select t2.name from WHGH.sys.tables t2) s2
on s1.name  COLLATE DATABASE_DEFAULT = s2.name  COLLATE DATABASE_DEFAULT 
where s2.name is null
order by s1.name
---
--new columns: Find how many columns are new from old schema
---
select s1.*, s2.name from 
(select t1.name as table_name, c1.name as column_name,c1.is_nullable, c1.system_type_id, c1.max_length,c1.precision,st.name
from [schema_23.1].sys.tables t1 join [schema_23.1].sys.columns c1 on t1.object_id = c1.object_id join sys.systypes st on c1.system_type_id = st.xtype) s1 
left outer join 
(select t2.name as table_name, c2.name as column_name,c2.is_nullable, c2.system_type_id, c2.max_length,c2.precision,st.name
from [WHGH].sys.tables t2 join [WHGH].sys.columns c2 on t2.object_id = c2.object_id join sys.systypes st on c2.system_type_id = st.xtype) s2
on s1.column_name  COLLATE DATABASE_DEFAULT = s2.column_name  COLLATE DATABASE_DEFAULT and s1.table_name COLLATE DATABASE_DEFAULT = s2.table_name COLLATE DATABASE_DEFAULT
where s2.column_name is null
order by s1.table_name, s1.column_name
---
--different columns columns
---
select s1.table_name, s1.column_name, s1.is_nullable as s1_is_null, s2.is_nullable as s1_is_null,
s1.name as s1_type_name, s2.name as s2_type_name,s1.max_length as s1_max_length, s2.max_length as s2_max_length,
s1.precision as s1_precision, s2.precision as s2_precision  from 
(select t1.name as table_name, c1.name as column_name,c1.is_nullable, c1.system_type_id, c1.max_length,c1.precision,st.name
from [schema_23.1].sys.tables t1 join [schema_23.1].sys.columns c1 on t1.object_id = c1.object_id join sys.systypes st on c1.system_type_id = st.xtype) s1 
inner join 
(select t2.name as table_name, c2.name as column_name,c2.is_nullable, c2.system_type_id, c2.max_length,c2.precision,st.name
from [WHGH].sys.tables t2 join [WHGH].sys.columns c2 on t2.object_id = c2.object_id join sys.systypes st on c2.system_type_id = st.xtype) s2
on s1.column_name  COLLATE DATABASE_DEFAULT = s2.column_name  COLLATE DATABASE_DEFAULT and s1.table_name COLLATE DATABASE_DEFAULT = s2.table_name COLLATE DATABASE_DEFAULT
where s1.is_nullable <> s2.is_nullable or s1.system_type_id <> s2.system_type_id or s1.max_length <> s2.max_length or s1.precision <> s2.precision
order by s1.table_name, s1.column_name

