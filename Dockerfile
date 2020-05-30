FROM mcr.microsoft.com/windows/servercore:ltsc2019 AS downloader

RUN Invoke-WebRequest -OutFile steam.zip -UseBasicParsing https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip ; `
    Expand-Archive steam.zip -DestinationPath C:\steam ; `
    C:\steam\steamcmd.exe +login anonymous +force_install_dir C:\Astroneer +app_update 728470 validate +quit

FROM mcr.microsoft.com/windows/servercore:ltsc2019

COPY --from=downloader C:\Astroneer C:\Astroneer