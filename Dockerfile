FROM mcr.microsoft.com/dotnet/framework/runtime:3.5

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Invoke-WebRequest -OutFile steam.zip -UseBasicParsing "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip" ; Expand-Archive steam.zip -DestinationPath C:\steam ; C:\steam\steamcmd.exe +login anonymous +force_install_dir C:\Astroneer +app_update 728470 validate +quit ; exit 0