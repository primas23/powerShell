# Constants
$msBuildExe = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\MSBuild.exe";
$pathSln = 'D:\development\CoBuilderSearch\CoBuilder.Search.sln'

$pdtReindex = 'PDTReindex'
$pndReindex = 'PnDReindex'
$pndService = 'PnDService'

$pdtReindexCon = 'CoBuilder.Search.PDTReindex.exe.config'
$pndReindexCon = 'CoBuilder.Search.PnDReindex.exe.config'
# $pndServiceCon = 'CoBuilder.Search.PnDService.exe.config'

$indexes = '<add key="reindexPDTs" value="true" />',
'<add key="reindexPTs" value="true" />',
'<add key="reindexClassifications" value="true" />',
'<add key="reindexAccounts" value="true" />',
'<add key="reindexProducts" value="true" />',
'<add key="reindexDocuments" value="true" />',
'<add key="reindexProperties" value="true" />',
'<add key="reindexUses" value="true" />',
'<add key="reindexStandards" value="true" />',
'<add key="reindexProducts" value="true" />',
'<add key="reindexDocuments" value="true" />'

$partialPathProjectPath = 'D:\development\CoBuilderSearch\CoBuilder.Search.'
$partialBinPath = '\bin\Debug'
$buildsDir = 'D:\Temp\Builds' 

# Build
# Write-Host "Restoring NuGet packages" -foregroundcolor green
# nuget restore "$($pathSln)"

# Write-Host "Cleaning $($pathSln)" -foregroundcolor green
# & "$($msBuildExe)" "$($pathSln)" /t:Clean /m

# Write-Host "Building $($pathSln)" -foregroundcolor green
# & "$($msBuildExe)" "$($pathSln)" /t:Build /m

# Copying
$pdtReindexConfContent = Get-Content "$($partialPathProjectPath)$($pdtReindex)$($partialBinPath)\$($pdtReindexCon)"
$pdtpndReindexConfContent = Get-Content "$($partialPathProjectPath)$($pndReindex)$($partialBinPath)\$($pndReindexCon)"

if ($pdtReindexConfContent -like $("*$indexes[1]*")) {
    Write-Host 'primas'
}
else {
    Write-Host 'kur'
    Write-Host $indexes[1]
    Write-Host $pdtReindexConfContent
}

# for ($i = 0; $i -lt $indexes.Length; $i++) {
#     if ($pdtReindexConfContent -like $("*$indexes[$i]*")) {

#         # $pdtReindexConfContent.Replace("*$indexes[$i]*", "*$indexes[$i]*".Replace('true', 'false'))
        
#         # $pdtReindexConfContent | Out-File -FilePath "$($partialPathProjectPath)$($pdtReindex)$($partialBinPath)\$($pdtReindexCon)1"
#     }

#     # if ($pdtpndReindexConfContent -like $("*$indexes[$i]*")) {
#     #     # Pnd Reindex
#     #     Write-Host "Copying Pnd Reindex to $($buildsDir)" -foregroundcolor green
#     #     & Copy-Item -Path "$($partialPathProjectPath)$($pndReindex)$($partialBinPath)" -Destination "$($buildsDir)" -Recurse
#     #     & Rename-Item -Path "$($buildsDir)\Debug" "$($buildsDir)\$pndReindex$($i)"
#     # }
# }

# for ($i = 0; $i -lt $indexes.Length; $i++) {
#     if ($pdtReindexConfContent -like $("*$indexes[$i]*")) {
#         # Pdt Reindex
#         Write-Host "Copying Pdt Reindex to $($buildsDir)" -foregroundcolor green
#         & Copy-Item -Path "$($partialPathProjectPath)$($pdtReindex)$($partialBinPath)" -Destination "$($buildsDir)" -Recurse
#         & Rename-Item -Path "$($buildsDir)\Debug" "$($buildsDir)\$pdtReindex$($i)"
#     }

#     if ($pdtpndReindexConfContent -like $("*$indexes[$i]*")) {
#         # Pnd Reindex
#         Write-Host "Copying Pnd Reindex to $($buildsDir)" -foregroundcolor green
#         & Copy-Item -Path "$($partialPathProjectPath)$($pndReindex)$($partialBinPath)" -Destination "$($buildsDir)" -Recurse
#         & Rename-Item -Path "$($buildsDir)\Debug" "$($buildsDir)\$pndReindex$($i)"
#     }
# }

# Pnd Service
# Write-Host "Copying Pnd Service to $($buildsDir)" -foregroundcolor green
# & Copy-Item -Path "$($partialPathProjectPath)$($pndService)$($partialBinPath)" -Destination "$($buildsDir)" -Recurse
# & Rename-Item -Path "$($buildsDir)\Debug" "$($buildsDir)\$pndService"