# Conn: Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\temp\AjusteIpaDB.mdf;Integrated Security=True 
# (LocalDB)\AjusteIpaDBSys

$databaseInstance = 'AjusteIpaDBSys'
$databaseName = 'AjusteIpaDB'
Write-Host "Creating Database instance:$databaseInstance using LocaldB" 
$databases = SqlLocalDB info
if($databases.Contains($databaseInstance)) { 
Write-Host "Trying to stop $databaseInstance"
 SqlLocalDB stop $databaseInstance
 Write-Host "Deleting $databaseInstance"
 SqlLocalDB delete $databaseInstance
}

if(Test-Path "C:\users\$env:USERNAME\$databaseName*") {
 Write-Host "Removing database files"
 Remove-Item "C:\users\$env:USERNAME\$databaseName*" -Force
}

Write-Host "Creating instance:$databaseInstance"
SqlLocalDB create "$databaseInstance"

Write-Host "Creating dabase:$databaseName for instance:$databaseInstance"
sqlcmd -S "(LocalDB)\$databaseInstance" -i .\database.sql