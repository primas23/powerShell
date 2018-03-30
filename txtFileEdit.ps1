$confFile = Get-Content './test.txt'
$confFile1 = Get-Content './test.1.txt'
$confFile2 = Get-Content './test.2.txt'
# $newConf = $confFile.Replace('<add key="documents" value="true"/>', '<add key="documents" value="false"/>')
# $newConf | Out-File -FilePath './testConf.txt'

$indexes = '<add key="documents" value="true"/>', '<add key="links" value="true"/>', '<add key="products" value="true"/>'

$allConfigs = $confFile, $confFile1, $confFile2

Foreach($index in $indexes)
{
    $replacedIndex = $index.Replace('true', 'false')

    Foreach ($conf in $allConfigs)
    {
        

        Write-Host $index

    }
}