:pre
@echo off & color 17 & mode con cols=52 lines=30
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
title MinecraftUWPCloner v1.0-alpha & echo MinecraftUWPCloner & set MCUWPCV=v1.0-alpha & set logName=MinecraftUWPCloner.log
if exist %logName% (echo.) else (
	echo Hey, %userName%!
	echo Looks like u are 1st time use me. ^^_^^
	echo Here is my advice:
	echo   visit https://www.github.com/XiaozhiSans/MinecraftUWPCloner
	echo   or read README.md?
	echo.
)

echo " __  __  _____ _    ___          _______   _____ "
echo "|  \/  |/ ____| |  | \ \        / /  __ \ / ____|"
echo "| \  / | |    | |  | |\ \  /\  / /| |__) | |     "
echo "| |\/| | |    | |  | | \ \/  \/ / |  ___/| |     "
echo "| |  | | |____| |__| |  \  /\  /  | |    | |____ "
echo "|_|  |_|\_____|\____/    \/  \/   |_|     \_____|"


@echo [%date% %time%] MinecraftUWPCloner started, version: v1.0-alpha. >>%logName%
echo ==============================
echo  :) Welcome! %userName%
echo  MCUWPC version: %MCUWPCV%
echo  %date% %time%
echo ==============================
echo.

if exist lastPath.ini (
	echo Getting last path...
	@echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): Reading lastPath.ini... >>%logName%
	set /p appxDir=<lastPath.ini
	@echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): Get last appxDir from lastPath.ini. >>%logName%
) else (
	set /p appxDir=Pls input appx^(afther extract^) path: 
	@echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): Get new appxDir^(%appxDir%^). >>%logName%
)
@echo %appxDir%>lastPath.ini
:menu
echo Menu
echo ==============================
echo  [1] Replace AppxManifest.xml
echo  [2] Enable UWP Dev Mode
echo  [3] Install Minecraft Clone
echo  [4] Show Appx Path
echo  [5] Change Appx Path
echo  [6] Disable UWP Dev Mode
echo  [7] Clean screen
echo  [8] Mod clone.xml & echo.
echo  [Q] Quit
set /p menu=">>>"
if /i "%menu%"=="1" goto replaceXml
if /i "%menu%"=="2" goto enableDevM
if /i "%menu%"=="3" goto installMCC
if /i "%menu%"=="4" goto showPath
if /i "%menu%"=="5" goto changePath
if /i "%menu%"=="6" goto disableDevM
if /i "%menu%"=="7" cls & goto menu
if /i "%menu%"=="8" notepad clone.xml & goto menu
if /i "%menu%"=="q" exit
echo Invalid choice! & goto menu


:replaceXml
cls & echo Processing...
echo [              0%               ]
@echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): Trying to replaceXml... >>%logName%
@copy /y %appxDir%\AppxManifest.xml %appxDir%\AppxManifest.xml.bak
cls & echo Processing...
echo [=======      25%               ]
if %errorLevel%=="0" (
	echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): AppxManifest.xml backup successful. >>%logName%
) else echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): AppxManifest.xml backup failed. >>%logName%
cls & echo Processing...
echo [=============50%               ]
copy /y clone.xml %appxDir%\AppxManifest.xml
cls & echo Processing...
echo [=============75%=======        ]
if %errorLevel%=="0" (
	echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): AppxManifest.xml replace successful. >>%logName%
) else echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): AppxManifest.xml replace failed. >>%logName%
cls & echo Processing...
echo [============100%===============] & cls
goto menu

:enableDevM
@echo [%date% %time%] Trying to enable UWP Dev Mode... >>%logName%
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"
if %errorLevel%=="0" (@echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): Successfully enabled UWP Dev Mode!! >>%logName%) else @echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): Failed to enable UWP Dev Mode. >>%logName%
goto menu

:installMCC
cls & echo Processing...
echo [              0%               ]
@echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): Trying to installMCC... >>%logName%
@cd /d %appxDir% & @echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): Change directory to %appxDir%. >>%logName%
:: thanks to www.mcappx.com
@set fileCheck="%~dp0AppxSignature.p7x"
@set fileCheckNew="AppxSignature.tmp"
if exist %fileCheck% (@ren %fileCheck% %fileCheckNew%)
cls & echo Processing...
echo [====         15%               ]
echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): Beginning to install Minecraft Clone. >>%logName%
@powershell add-appxPackage '%~dp0AppxManifest.xml' -register
cls & echo Processing...
echo [=============95%=============  ]
if %errorLevel%=="0" (
	echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): Minecraft Clone install successful. \^(￣︶￣\^) >>%logName%
) else echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): Minecraft Clone install failed. o^(TヘTo^) >>%logName%
cls & echo Processing...
echo [============100%===============] & cls
goto menu

:showPath
echo.
echo Appx path: %appxDir%
echo ============================
goto menu

:changePath
echo.
echo Change Path
set /p changePathYN=Are u sure u want to change path? (y=yes, n=no): 
if /i "%changePathYN%"=="n" goto menu
set /p appxDir=Pls input new appx^(afther extract^) path: 
@echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): Get new appxDir^(%appxDir%^) from input. >>%logName%
@echo %appxDir%>lastPath.ini
goto menu

:disableDevM
@echo [%date% %time%] Trying to disable UWP Dev Mode... >>%logName%
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "0"
if %errorLevel%=="0" (@echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): Successfully disabled UWP Dev Mode. >>%logName%) else @echo [%date% %time%] MinecraftUWPCloner^(v1.0-alpha^): Failed to disable UWP Dev Mode. >>%logName%
goto menu
