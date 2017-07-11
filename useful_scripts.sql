SELECT c.name AS ColName, t.name AS TableName
FROM sys.columns c
    JOIN sys.tables t ON c.object_id = t.object_id
WHERE c.name LIKE '%midas_org_id%'

--Find the afm field columns enumerations
select * from afm_flds where table_name='afm_flds'