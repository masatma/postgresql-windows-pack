# Postgre SQL Windows installer building repository (InnoSetup Setup.exe)
## Overview
This repository references Postgre SQL repository and generates Windows installer package by using InnoSetup. The generated installer includes generated binaries and minimum configuration scripts to make it smaller and faster to deploy.

## Missing components if you will
- **Visual C++ Redistribution package** (mandatory if installing system is lacking it). You can find it from [VCRedist](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist)) or [Download VC14-x64](https://aka.ms/vc14/vc_redist.x64.exe).
- **pgAdmin** (PostgreSQL Admin Tool). You can find it from [psAdmin home page](https://www.pgadmin.org/) or [Download pgAdmin](https://www.pgadmin.org/download/)).

## Download the installer
- Go to [Actions](https://github.com/masatma/postgresql-windows-installer/actions), select a workflow run, and click the `postgresql-windows-installer` in **Artifacts**.