$confFile = Get-Content './test.txt'
$confFile1 = Get-Content './test.1.txt'
$confFile2 = Get-Content './test.2.txt'
# $newConf = $confFile.Replace('<add key="documents" value="true"/>', '<add key="documents" value="false"/>')
# $newConf | Out-File -FilePath './testConf.txt'

$indexes = '<add key="documents" value="true"/>', '<add key="links" value="true"/>', '<add key="products" value="true"/>'

$allConfigs = $confFile, $confFile1, $confFile2

# foreach ($index in $indexes) {
#     foreach ($conf in $allConfigs) {
#         if ($conf -like $("*$index*")) {
#             Write-Host $index      
#         }
#         else {
#             Write-Host "kur"
#         }
#     }
# }

for ($i = 0; $i -lt $indexes.Length; $i++) {
    # foreach ($conf in $allConfigs) {
    #     if ($conf -contains in) {
            
    #     }
    # } 


    # $indexes[$i]

    Write-Host "$indexes$($i)"
}