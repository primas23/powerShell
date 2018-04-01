# Constants
$msBuildExe = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\MSBuild.exe";
$pathSln = 'D:\development\CoBuilderSearch\CoBuilder.Search.sln'

$pdtReindex = 'PDTReindex'
$pndReindex = 'PnDReindex'
$pndService = 'PnDService'

$pdtReindexCon = 'CoBuilder.Search.PDTReindex.exe.config'
$pndReindexCon = 'CoBuilder.Search.PnDReindex.exe.config'
# $pndServiceCon = 'CoBuilder.Search.PnDService.exe.config'

$indexes = '<add key="documents" value="true"/>', '<add key="links" value="true"/>', '<add key="products" value="true"/>'

$partialPathProjectPath = 'D:\development\CoBuilderSearch\CoBuilder.Search.'
$partialBinPath = '\bin\Debug'
$buildsDir = 'D:\Temp\Builds' 

# Build
Write-Host "Restoring NuGet packages" -foregroundcolor green
nuget restore "$($pathSln)"

Write-Host "Cleaning $($pathSln)" -foregroundcolor green
& "$($msBuildExe)" "$($pathSln)" /t:Clean /m

Write-Host "Building $($pathSln)" -foregroundcolor green
& "$($msBuildExe)" "$($pathSln)" /t:Build /m

# Copying
$pdtReindexConfContent = Get-Content "$($partialPathProjectPath)$($pdtReindex)$($partialBinPath)\$($pdtReindexCon)"
$pdtpndReindexConfContent = Get-Content "$($partialPathProjectPath)$($pndReindex)$($partialBinPath)\$($pndReindexCon)"

# TODO: Iterate indexes and make them false in pdtReindexConfContent and pdtpndReindexConfContent

for ($i = 0; $i -lt $indexes.Length; $i++) {
    if ($pdtReindexConfContent -like $("*$indexes[$i]*")) {
        # Pdt Reindex
        Write-Host "Copying Pdt Reindex to $($buildsDir)" -foregroundcolor green
        & Copy-Item -Path "$($partialPathProjectPath)$($pdtReindex)$($partialBinPath)" -Destination "$($buildsDir)" -Recurse
        & Rename-Item -Path "$($buildsDir)\Debug" "$($buildsDir)\$pdtReindex$($i)"
        # & Remove-Item -Path "$($buildsDir)\$pdtReindex\$pdtReindexCon"
    }

    if ($pdtpndReindexConfContent -like $("*$indexes[$i]*")) {
        # Pnd Reindex
        Write-Host "Copying Pnd Reindex to $($buildsDir)" -foregroundcolor green
        & Copy-Item -Path "$($partialPathProjectPath)$($pndReindex)$($partialBinPath)" -Destination "$($buildsDir)" -Recurse
        & Rename-Item -Path "$($buildsDir)\Debug" "$($buildsDir)\$pndReindex$($i)"
        # & Remove-Item -Path "$($buildsDir)\$pndReindex\$pndReindexCon"
    }
}

# Pnd Service
Write-Host "Copying Pnd Service to $($buildsDir)" -foregroundcolor green
& Copy-Item -Path "$($partialPathProjectPath)$($pndService)$($partialBinPath)" -Destination "$($buildsDir)" -Recurse
& Rename-Item -Path "$($buildsDir)\Debug" "$($buildsDir)\$pndService"
# & Remove-Item -Path "$($buildsDir)\$pndService\$pndServiceCon"