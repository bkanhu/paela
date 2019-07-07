ECHO OFF
:: This batch file reveals OS, hardware, and networking configuration.
TITLE Paela System Info
ECHO      .----.   @   @  
ECHO    / .-"-.`.  \v/   (Paela, Check Your System Info)
ECHO    :  '\ \ \_/ )
ECHO  ,-\ `-.' /.'  /
ECHO '---`----'----' 
ECHO Please wait... Checking system information.
:: Section 1: Hardware information.
ECHO ============================
ECHO HARDWARE INFO
ECHO ============================
systeminfo | findstr /c:"Processor(s)"
for /F "tokens=* skip=1" %%n in ('WMIC cpu get Name ^| findstr "."') do set CPU_NAME=%%n
for /F "tokens=* skip=1" %%n in ('WMIC path Win32_VideoController get Name ^| findstr "."') do set GPU_NAME=%%n
ECHO CPU: %CPU_NAME%
ECHO GPU: %GPU_NAME%
for /F "tokens=* skip=1" %%n in ('WMIC cpu get NumberOfCores ^| findstr "."') do set CPU_CORE=%%n
ECHO Number Of Cores: %CPU_CORE%
for /F "tokens=* skip=1" %%n in ('WMIC cpu get NumberOfLogicalProcessors ^| findstr "."') do set LOGICAL_CORE=%%n
ECHO Number Of Logical Processors: %LOGICAL_CORE%
systeminfo | findstr /c:"Total Physical Memory"
systeminfo | findstr /c:"Available Physical Memory"
wmic desktopmonitor get screenwidth, screenheight
:: Section 2: OS information.
ECHO ============================
ECHO OS INFO
ECHO ============================
systeminfo | findstr /c:"OS Name"
systeminfo | findstr /c:"OS Version"
systeminfo | findstr /c:"OS Manufacturer"
systeminfo | findstr /c:"System Type"
systeminfo | findstr /c:"Original Install Time"
systeminfo | findstr /c:"System Boot Time"
systeminfo | findstr /c:"System Manufacturer"
for /F "tokens=* skip=1" %%n in ('WMIC cpu get VirtualizationFirmwareEnabled ^| findstr "."') do set VIR_ENB=%%n
ECHO Virtulization Enabled: %VIR_ENB%
:: Section 3: Networking information.
ECHO ============================
ECHO NETWORK INFO
ECHO ============================
ipconfig | findstr IPv4
ipconfig | findstr IPv6
for /F "tokens=* skip=1" %%n in ('ipconfig /all ^| findstr "DNS Servers"') do set DNS_SVR=%%n
ECHO  %DNS_SVR%
PAUSE