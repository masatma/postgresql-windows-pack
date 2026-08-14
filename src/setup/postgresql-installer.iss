; Postgre SQL Windows Installer

#ifndef ReleaseSemvar
#define ReleaseSemvar 1.0.0
#endif
#ifndef ReleaseMajor
#defiune ReleaseMajor 10
#endif

[Setup]
AppName=PostgreSQL
AppVersion={#ReleaseSemvar}
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
Compression=lzma2
DefaultDirName={autopf}\PostgreSQL
DefaultGroupName=PostgreSQL
SolidCompression=yes
OutputBaseFilename=PostgreSQLSetup
OutputDir=..\..\staged\setup
UninstallDisplayIcon={app}\bin\pgsql.exe
WizardStyle=modern dynamic

[Files]
Source: "..\..\staged\bin\pgsql\*"; DestDir: "{app}\{#ReleaseMajor}"; Excludes: "*.pdb"; Flags: recursesubdirs

[Icons]
Name: "{group}\PostgreSQL"; Filename: "{app}\bin\pgsql.exe"
