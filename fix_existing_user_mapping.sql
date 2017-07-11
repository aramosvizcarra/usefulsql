--
--Use this script after restoring a backup or attaching a database
--this should fix the mapping when trying to login to the database from ssms or from archibus app
--

EXEC sp_change_users_login 'Auto_Fix', 'AFM_SECURE'
GO
ALTER USER [afm_secure] WITH DEFAULT_SCHEMA=[afm_secure]
GO

EXEC sp_change_users_login 'Auto_Fix', 'AFM'
GO
ALTER USER [afm] WITH DEFAULT_SCHEMA=[afm]
GO
