:pre
@echo off & color 17 & mode con cols=52 lines=30
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&exit
cd /d %~dp0
title MinecraftUWPCloner & set MCUWPCV=v1.4-beta & set logName=MinecraftUWPCloner.log & set splitLine==================================

:mcuwpc
echo " __  __  ____ _   ___        ______   ____ "| tee -a %logName% & ping -n 1 127.0.0.1>nul
echo "|  \/  |/ ___| | | \ \      / /  _ \ / ___|"| tee -a %logName% & ping -n 1 127.0.0.1>nul
echo "| |\/| | |   | | | |\ \ /\ / /| |_) | |    "| tee -a %logName% & ping -n 1 127.0.0.1>nul
echo "| |  | | |___| |_| | \ V  V / |  __/| |___ "| tee -a %logName% & ping -n 1 127.0.0.1>nul
echo "|_|  |_|\____|\___/   \_/\_/  |_|    \____|"| tee -a %logName% & ping -n 1 127.0.0.1>nul
echo           " ____       _        "            | tee -a %logName% & ping -n 1 127.0.0.1>nul
echo           "| __ )  ___| |_ __ _ "            | tee -a %logName% & ping -n 1 127.0.0.1>nul
echo           "|  _ \ / _ \ __/ _` |"            | tee -a %logName% & ping -n 1 127.0.0.1>nul
echo           "| |_) |  __/ || (_| |"            | tee -a %logName% & ping -n 1 127.0.0.1>nul
echo           "|____/ \___|\__\__,_|"            | tee -a %logName% & ping -n 1 127.0.0.1>nul

echo.| tee -a %logName%
echo Copyright (c) 2024 XiaozhiSans. All rights reserved.| tee -a %logName% & ping -n 2 127.0.0.1>nul
cls

echo [%date% %time%] MinecraftUWPCloner started, version: %MCUWPCV% >>%logName%
echo  MinecraftUWPCloner
echo %splitLine%
echo  :) Welcome back! %userName%
echo  MCUWPC version: %MCUWPCV%
echo  %date% %time%
echo %splitLine%
echo.

set /p="[%date% %time%] "<nul >>%logName% & echo Getting last path...| tee -a %logName%
if exist lastPath.ini (
	set /p appxDir=<lastPath.ini
	set /p="[%date% %time%] "<nul >>%logName% & echo Successfully got last path. ^*^^_^^^*| tee -a %logName%
) else (
	set /p="[%date% %time%] "<nul >>%logName% & echo Last path not found! x.x| tee -a %logName%
	set /p appxDir=Pls input appx^(afther extract^) path: 
	set /p="[%date% %time%] "<nul >>%logName% & echo Saveing path... ^( o.o^)-[Files]| tee -a %logName% & ping -n 2 127.0.0.1>nul
	set /p="[%date% %time%] "<nul >>%logName% & echo Path saved. +.+| tee -a %logName%
)
echo %appxDir%>lastPath.ini
cls

:menu
echo  Menu [Main Features]   P.g. 1/2
echo %splitLine%
echo  [1] Modify AppxManifest.xml
echo  [2] Install Minecraft Clone
echo  [3] Show Appx Path
echo  [4] Change Appx Path
echo  [5] Enable UWP Dev Mode
echo  [6] Disable UWP Dev Mode
echo.
echo.
echo  [H] View Help Doc      [Q] Quit
echo  [R] Restart       [+] Page Down
set /p menu=">>>"
if "%menu%"=="1" %appxDir%\AppxManifest.xml & goto menu
if "%menu%"=="2" goto installMCC
if "%menu%"=="3" goto showPath
if "%menu%"=="4" goto changePath
if "%menu%"=="5" goto enableDevM
if "%menu%"=="6" goto disableDevM
if /i "%menu%"=="h" help.html & goto menu
if /i "%menu%"=="r" cls & goto mcuwpc
if /i "%menu%"=="q" exit
if "%menu%"=="+" cls & goto menu2
echo "%menu%" not found! ^>.^<
ping -n 2 127.0.0.1>nul
cls & goto menu

:installMCC
cls & echo Processing...
echo [              0%%            ] & echo Log:
echo [%date% %time%] Trying to installMCC...| tee -a %logName%
cd /d %appxDir% & echo [%date% %time%] Change directory to %appxDir%.| %~dp0tee -a %logName%
:: thanks to www.mcappx.com
if exist AppxSignature.p7x (ren AppxSignature.p7x AppxSignature.p7x.bak)
cls & echo Processing...
echo [=============50%%            ] & echo Log:
echo [%date% %time%] Beginning to install Minecraft Clone.| %~dp0tee -a %logName%
powerShell add-appxPackage 'AppxManifest.xml' -register
cls & echo Processing...
echo [============100%%============] & echo Log:
if "%errorLevel%"=="0" (
	echo [%date% %time%] Minecraft Clone install successful. \^(￣︶￣\^)| %~dp0tee -a %logName%
) else echo [%date% %time%] Minecraft Clone install failed. o^(TヘTo^)| %~dp0tee -a %logName%
cd /d %~dp0 & echo [%date% %time%] Change directory to %~dp0.| tee -a %logName%
pause
cls & goto menu

:showPath
echo.
echo  Current path: %appxDir%
echo %splitLine%
pause
cls & goto menu

:changePath
echo.
echo  Change Path
echo %splitLine%
echo Current path: %appxDir%
set /p changePath=Are u sure u want to change path? (y=yes, n=no): 
if /i "%changePath%" neq "y" (goto changePathN)
set /p appxDir=Pls input new appx^(afther extract^) path: 
set /p="[%date% %time%] "<nul >>%logName% & echo Path saved.| tee -a %logName%
echo %appxDir%>lastPath.ini
	:changePathN
	cls & goto menu

:enableDevM
cls & echo Processing...
echo [============100%%=============] & echo Log:
set /p="[%date% %time%] "<nul >>%logName% & echo Trying to enable UWP Dev Mode...| tee -a %logName%
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"
if "%errorLevel%"=="0" (set /p="[%date% %time%] "<nul >>%logName% & echo Successfully enabled UWP Dev Mode!!| tee -a %logName%) else (
	set /p="[%date% %time%] "<nul >>%logName% & echo Failed to enable UWP Dev Mode.| tee -a %logName%
)
pause
cls & goto menu

:disableDevM
cls & echo Processing...
echo [============100%%=============] & echo Log:
set /p="[%date% %time%] "<nul >>%logName% & echo Trying to disable UWP Dev Mode...| tee -a %logName%
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "0"
if "%errorLevel%"=="0" (set /p="[%date% %time%] "<nul >>%logName% & echo Successfully disabled UWP Dev Mode.| tee -a %logName%) else (
	set /p="[%date% %time%] "<nul >>%logName% & echo Failed to disable UWP Dev Mode.| tee -a %logName%
)
pause
cls & goto menu

:menu2
echo  Menu [Legacy Features] P.g. 2/2
echo %splitLine%
echo  [1] Modify clone.xml
echo  [2] Replace AppxManifest.xml
echo.
echo.
echo.
echo.
echo.
echo.
echo  [H] View Help Doc      [Q] Quit
echo  [R] Restart         [-] Page Up
set /p menu=">>>"
if "%menu%"=="1" legacy\clone.xml & goto menu2
if "%menu%"=="2" goto replaceXml
if /i "%menu%"=="h" help.html & goto menu2
if /i "%menu%"=="r" cls & goto mcuwpc
if /i "%menu%"=="q" exit
if "%menu%"=="-" cls & goto menu
echo "%menu%" not found! ^>.^<
ping -n 2 127.0.0.1>nul
cls & goto menu2

:replaceXml
cls & echo Processing...
echo [=============75%%====         ] & echo Log:
echo [%date% %time%] Trying to replaceXml...| tee -a %logName%
copy /y %appxDir%\AppxManifest.xml %appxDir%\AppxManifest.xml.bak
if "%errorLevel%"=="0" (
	echo [%date% %time%] AppxManifest.xml backup successful.| tee -a %logName%
) else echo [%date% %time%] AppxManifest.xml backup failed.| tee -a %logName%
cls & echo Processing...
echo [============100%%=============] & echo Log:
copy /y legacy\clone.xml %appxDir%\AppxManifest.xml
if "%errorLevel%"=="0" (
	echo [%date% %time%] AppxManifest.xml replace successful.| tee -a %logName%
) else echo [%date% %time%] AppxManifest.xml replace failed.| tee -a %logName%
pause
goto menu
