--finds alltables that contain an specific column
SELECT c.name AS ColName, t.name AS TableName
FROM sys.columns c
    JOIN sys.tables t ON c.object_id = t.object_id
WHERE c.name LIKE '%<some important_field>%'

--Find the afm field columns 
select * from afm_flds where table_name='afm_flds'
