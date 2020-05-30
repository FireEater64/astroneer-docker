FROM mcr.microsoft.com/windows/servercore:ltsc2019

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN DISM /Online /Enable-Feature /FeatureName:NetFx3 /All

RUN Invoke-WebRequest -OutFile steam.zip -UseBasicParsing "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip" ; Expand-Archive steam.zip -DestinationPath C:\steam ; C:\steam\steamcmd.exe +login anonymous +force_install_dir C:\Astroneer +app_update 728470 validate +quit ; exit 0