:: This feature is still in development!
:: XiaozhiSans 2024/03/11 18:52

:mod
echo Processing...
if /i %appxDir% == "cd" (echo.) else(cd /d %appxDir%)
copy source AppxManifest.xml destination AppxManifest.xml.bak /-y
echo 
set /p idName = Pls input Identity Name (e.g. XiaozhiSans.MinecraftClone):
set /p mcVer = Pls input Minecraft Version (e.g. 1.19.5101.0):
set /p appxArc = Pls input Appx Architecture (e.g. x64):
for /f %%t in ('powershell -command "[guid]::newGuid().toString"') do set %projectGuid% = %%t
setlocal EnableDelayedExpansion
(for /f "delims=" %%a in (AppxManifest.xml) do (
	for /f "delims==" %%b in ("%%a") do (
		if %%b == "<Identity Name=" (
			echo ^<Identity Name=^"& echo %idName%& echo ^" Publisher=^"CN=Microsoft Corporation, O=Microsoft Corporation, L=Redmond, S=Washington, C=US^" Version=^"& echo %mcVer%& echo ^" ProcessorArchitecture=^"& echo %appxArc%& echo ^" ^/^>
		) else
		if %%b == "<mp:PhoneIdentity PhoneProductId=" (
			echo ^<mp:PhoneIdentity PhoneProductId=^"& echo %uuid1%& echo ^" PhonePublisherId=^"& echo %uuid2%& echo^" ^/^>
		) else
		if %%b == "<build:Item Name=" (
			echo ^<build^:Item Name=^"ProjectGUID^" Value=^"& echo %projectGuid%& echo ^" ^/^>
		) else echo %%a
	)
))>temp.xml
