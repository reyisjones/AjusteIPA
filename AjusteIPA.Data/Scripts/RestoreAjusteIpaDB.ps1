# Conn: Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\PRSS\Dev\AjusteIPA\AjusteIPA-Ap\AjusteIPA.Data\AjusteIpaDB.mdf;Integrated Security=True

Restore-SqlDatabase -ServerInstance "(LocalDB)\MSSQLLocalDB" -Database "AjusteIpaDB" -BackupFile "C..\AjusteIPA.Data\Backup\AjusteIPA.bak"


