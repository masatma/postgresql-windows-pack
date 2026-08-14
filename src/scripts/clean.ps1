<#
.DESCRIPTION
Remove staged binaries.
#>
$repoRoot = (Get-item -Path (Join-Path -Path $PSScriptRoot -ChildPath "..\..")).FullName
$stagedRoot = Join-Path -Path $repoRoot -ChildPath "staged"
if (Test-Path -Path $stagedRoot) {
    Remove-Item -Path $stagedRoot -Recurse -Force
}
