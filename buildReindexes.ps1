$msBuildExe = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\MSBuild.exe";
$pathSln = 'D:\development\CoBuilderSearch\CoBuilder.Search.sln'

$pdtReindex = 'PDTReindex'
$pndReindex = 'PnDReindex'
$pndService = 'PnDService'

$pdtReindexCon = 'CoBuilder.Search.PDTReindex.exe.config'
$pndReindexCon = 'CoBuilder.Search.PnDReindex.exe.config'
$pndServiceCon = 'CoBuilder.Search.PnDService.exe.config'

$partialPathProjectPath = 'D:\development\CoBuilderSearch\CoBuilder.Search.'
$partialBinPath = '\bin\Debug'
$buildsDir = 'D:\Temp\Builds' 

Write-Host "Restoring NuGet packages" -foregroundcolor green
nuget restore "$($pathSln)"

Write-Host "Cleaning $($pathSln)" -foregroundcolor green
& "$($msBuildExe)" "$($pathSln)" /t:Clean /m

Write-Host "Building $($pathSln)" -foregroundcolor green
& "$($msBuildExe)" "$($pathSln)" /t:Build /m

# Pdt Reindex
Write-Host "Moving Pdt Reindex to $($buildsDir)" -foregroundcolor green
& Copy-Item -Path "$($partialPathProjectPath)$($pdtReindex)$($partialBinPath)" -Destination "$($buildsDir)" -Recurse
& Rename-Item -Path "$($buildsDir)\Debug" "$($buildsDir)\$pdtReindex"
& Remove-Item -Path "$($buildsDir)\$pdtReindex\$pdtReindexCon"

# Pnd Reindex
Write-Host "Moving Pnd Reindex to $($buildsDir)" -foregroundcolor green
& Copy-Item -Path "$($partialPathProjectPath)$($pndReindex)$($partialBinPath)" -Destination "$($buildsDir)" -Recurse
& Rename-Item -Path "$($buildsDir)\Debug" "$($buildsDir)\$pndReindex"
& Remove-Item -Path "$($buildsDir)\$pndReindex\$pndReindexCon"

# Pnd Service
Write-Host "Moving Pnd Service to $($buildsDir)" -foregroundcolor green
& Copy-Item -Path "$($partialPathProjectPath)$($pndService)$($partialBinPath)" -Destination "$($buildsDir)" -Recurse
& Rename-Item -Path "$($buildsDir)\Debug" "$($buildsDir)\$pndService"
& Remove-Item -Path "$($buildsDir)\$pndService\$pndServiceCon"