<#
.DESCRIPTION
Run all setup.
#>
$repoRoot = (Get-item -Path (Join-Path -Path $PSScriptRoot -ChildPath "..\..")).FullName
$stagedRoot = Join-Path -Path $repoRoot -ChildPath "staged"
$toolsRoot = Join-Path -Path $stagedRoot -ChildPath "tools"
$binRoot = Join-Path -Path $stagedRoot -ChildPath "bin"
if (Test-Path -Path $stagedRoot) {
    Remove-Item -Path $stagedRoot -Recurse -Force
}
New-Item -Path $stagedRoot -ItemType Directory -Force
New-Item -Path $toolsRoot -ItemType Directory -Force
Push-Location -Path $toolsRoot
$nuget = Join-Path -Path "$env:UserProfile" -ChildPath ".nuget\nuget.exe"
& $nuget install Tools.InnoSetup
Pop-Location
Push-Location -Path $stagedRoot
& git clone https://git.postgresql.org/git/postgresql.git
Push-Location postgresql
$bin = Join-Path -Path $binRoot -ChildPath "pgsql"
& meson setup build "--prefix=$bin"
Push-Location -Path "build"
& ninja
& ninja install
Pop-Location
Pop-Location
Pop-Location
$iscc = Join-Path -Path (Get-Item -Path ".\staged\tools\Tools.InnoSetup.*").FullName -ChildPath tools\iscc.exe
& $iscc -o"C:\Data\Work\repo\postgresql-windows-pack\staged\setup" "/DReleaseMajor=10" "/DReleaseSemvar=10.0.0" ".\src\setup\postgresql-installer.iss"
