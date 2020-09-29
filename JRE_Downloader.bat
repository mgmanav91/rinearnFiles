@echo off

setlocal ENABLEDELAYEDEXPANSION

cd /d "%~dp0"


rem ====================================================================================================
rem JRE_Downloader - v24-en / RINEARN 2020
rem ====================================================================================================


set JRE_PATH_SETTING_FILE=.\JRE_Path_Setting.txt
set CURRENT_JRE_PATH=


if exist "%JRE_PATH_SETTING_FILE%" (
	goto CHECK_JRE_PATH
) else (
	goto FIRST_DOWNLOAD
)
:CHECK_JRE_PATH
for /F "delims=" %%a in (%JRE_PATH_SETTING_FILE%) do (
	set CURRENT_JRE_PATH=%%a
)
if exist "%CURRENT_JRE_PATH%" (
	if "%1" == "--update" (
		goto UPDATE
	) else (
		goto END
	)
) else (
	goto FIRST_DOWNLOAD
)



:FIRST_DOWNLOAD

echo.
echo.
java -version 2> NUL
if %ERRORLEVEL%==0 (
	echo The Java^(R^) Runtime Environment ^(JRE^) is already install in this computer,
	echo but you can also download and use a new JRE to execute this software.
) else (
	echo The Java^(R^) Runtime Environment ^(JRE^) might not be installed in this computer.
)
echo.
echo If you want to download and use a new JRE suitable for this software from the 
echo offial website of the developer of this software ^(RINEARN^), press "Enter" key.
echo This is an optional operation, and if you take it once, 
echo this software will launch immediately from the next time.
echo.
echo    * JRE will be downloaded from the RINEARN website 
echo      (https://download.rinearn.com/jre/) to "jre" folder of this software, 
echo      and used only for the execution of this software. It does not affect other 
echo      software in your computer. You can download the JRE manually from the above URL.
echo.
echo    * JRE to download was generated as a subset of the JRE of the OpenJDK 
echo      by using "jlink" tool, so it is distrubuted under 
echo      "GNU General Public License version 2 with the Classpath Exception" license 
echo      ^(https://openjdk.java.net/legal/gplv2+ce.html^), 
echo      which is the license of the OpenJDK. Users can use that JRE for free 
echo      under the above license, however, it is provided without any kind of warranties.
echo      Also, if you want, you can also access to source code of the OpenJDK of the same 
echo      version as it used for generating the JRE to download, from the above URL.
echo.
echo      ^( * Oracle and Java are registered trademarks of Oracle and/or its affiliates. ^)
echo.
echo Do you want to download and use a new JRE to execute this software ?  ^(Free^)
set /p pushKey=  Press "Enter" or "y" key for Yes, or press "n" key for No:

if "%pushKey%"=="" (
	goto DOWNLOAD
) else if "%pushKey%"=="y" (
	goto DOWNLOAD
) else if "%pushKey%"=="yes" (
	goto DOWNLOAD
) else if "%pushKey%"=="Yes" (
	goto DOWNLOAD
) else if "%pushKey%"=="n" (
	goto END
) else if "%pushKey%"=="no" (
	goto END
) else if "%pushKey%"=="No" (
	goto END
)
goto END



:UPDATE

echo.
echo.
echo In "jre" folder of this software, the JRE already exists.
echo However, you might able to download more new version of JRE from the RINEARN website
echo ^(https://download.rinearn.com/jre/^). Do you check for update ?
echo.
echo    * This check operation will be taken by getting the fike name of the latest version 
echo      of the JRE described in "latest_w64.txt" at the above website, 
echo      and comparing it the file name of the JRE in the "jre" folder.
echo.
set /p pushKey=  Press "Enter" or "y" key for Yes, or press "n" key for No:

if "%pushKey%"=="" (
	goto COMPARE_CURRENT_AND_LATEST
) else if "%pushKey%"=="y" (
	goto COMPARE_CURRENT_AND_LATEST
) else if "%pushKey%"=="yes" (
	goto COMPARE_CURRENT_AND_LATEST
) else if "%pushKey%"=="Yes" (
	goto COMPARE_CURRENT_AND_LATEST
) else if "%pushKey%"=="n" (
	goto END
) else if "%pushKey%"=="no" (
	goto END
) else if "%pushKey%"=="No" (
	goto END
)
goto END


: COMPARE_CURRENT_AND_LATEST
echo Getting the file name of the latest version...

bitsadmin /transfer download_jre_name "https://download.rinearn.com/jre/latest_w64.txt" "%CD%\latest_w64.txt"
set LATEST_JRE_NAME=
for /F "delims=" %%a in (.\latest_w64.txt) do (
	set LATEST_JRE_NAME=%%a
)

if not "%CURRENT_JRE_PATH%"=="%LATEST_JRE_NAME%\%LATEST_JRE_NAME%\jre\bin" (
	goto UPDATE_AVAILABLE
)

echo.
echo.
echo The JRE in the "jre" folder is the latest version.
echo.
echo If there are no problems for current behaviour of this software and JRE, 
echo exit this operation here.
echo.
echo If there are any problems, or you have failed to introduce JRE correctly,
echo you can retry to download the JRE again.
echo. 
echo Do you want to download the latest version of the JRE again?
echo.
set /p pushKey=  Press "Enter" or "y" key for Yes, or press "n" key for No:

if "%pushKey%"=="" (
	goto DOWNLOAD
) else if "%pushKey%"=="y" (
	goto DOWNLOAD
) else if "%pushKey%"=="yes" (
	goto DOWNLOAD
) else if "%pushKey%"=="Yes" (
	goto DOWNLOAD
) else if "%pushKey%"=="n" (
	goto END
) else if "%pushKey%"=="no" (
	goto END
) else if "%pushKey%"=="No" (
	goto END
)
goto END


: UPDATE_AVAILABLE

echo.
echo.
echo The more new version of the JRE is available.
echo.
echo If you want to download and use a new JRE suitable for this software from the 
echo offial website of the developer of this software ^(RINEARN^), press "Enter" key.
echo This is an optional operation, and if you take it once, 
echo this software will launch immediately from the next time.
echo.
echo    * JRE will be downloaded from the RINEARN website 
echo      ^(https://download.rinearn.com/jre/^) to "jre" folder of this software, 
echo      and used only for the execution of this software. It does not affect other 
echo      software in your computer. You can download the JRE manually from the above URL.
echo.
echo    * JRE to download was generated as a subset of the JRE of the OpenJDK 
echo      by using "jlink" tool, so it is distrubuted under 
echo      "GNU General Public License version 2 with the Classpath Exception" license 
echo      ^(https://openjdk.java.net/legal/gplv2+ce.html^), 
echo      which is the license of the OpenJDK. Users can use that JRE for free 
echo      under the above license, however, it is provided without any kind of warranties.
echo      Also, if you want, you can also access to source code of the OpenJDK of the same 
echo      version as it used for generating the JRE to download, from the above URL.
echo.
echo      ^( * Oracle and Java are registered trademarks of Oracle and/or its affiliates. ^)
echo.
echo Do you want to download and use a new JRE to execute this software ?  ^(Free^)
set /p pushKey=  Press "Enter" or "y" key for Yes, or press "n" key for No:

if "%pushKey%"=="" (
	goto DOWNLOAD
) else if "%pushKey%"=="y" (
	goto DOWNLOAD
) else if "%pushKey%"=="yes" (
	goto DOWNLOAD
) else if "%pushKey%"=="Yes" (
	goto DOWNLOAD
) else if "%pushKey%"=="n" (
	goto END
) else if "%pushKey%"=="no" (
	goto END
) else if "%pushKey%"=="No" (
	goto END
)
goto END




:DOWNLOAD

bitsadmin /transfer download_jre_name "https://download.rinearn.com/jre/latest_w64.txt" "%CD%\latest_w64.txt"
set LATEST_JRE_NAME=
for /F "delims=" %%a in (.\latest_w64.txt) do (
	set LATEST_JRE_NAME=%%a
)

set LATEST_INFO_DOWNLOAD_FAILED=FALSE
if not %ERRORLEVEL%==0 set LATEST_INFO_DOWNLOAD_FAILED=TRUE
if not exist "%CD%\latest_w64.txt" set LATEST_INFO_DOWNLOAD_FAILED=TRUE
if %LATEST_INFO_DOWNLOAD_FAILED%==TRUE (
	echo. 
	echo. 
	echo ----------------------------------------------------------------------
	echo. 
	echo The downloading of: 
	echo     https://download.rinearn.com/jre/latest_w64.txt
	echo have failed.
	echo.
	echo If you can not access to the above URL manually ^(e.g. by your web browser^), 
	echo it might be caused by the trouble of the website, so please try again later.
	echo.
	echo Or, some permissions might be necessary to download the file on your environment.
	echo In such case, you might do it successfully by right clicking this batch file 
	echo and choosing "Run as administrator".
	echo.
	set /p pushKey="Press "Enter" key to exit."
	goto END
)

bitsadmin /TRANSFER download_jre_file "https://download.rinearn.com/jre/%LATEST_JRE_NAME%.zip" "%CD%\%LATEST_JRE_NAME%.zip"

set JRE_DOWNLOAD_FAILED=FALSE
if not %ERRORLEVEL%==0 set LATEST_DOWNLOAD_FAILED=TRUE
if not exist "%CD%\%LATEST_JRE_NAME%.zip" set LATEST_DOWNLOAD_FAILED=TRUE
if %JRE_DOWNLOAD_FAILED%==TRUE (
	echo. 
	echo. 
	echo ----------------------------------------------------------------------
	echo. 
	echo The downloading of: 
	echo     https://download.rinearn.com/jre/%LATEST_JRE_NAME%.zip
	echo have failed.
	echo.
	echo If you can not access to the above URL manually ^(e.g. by your web browser^), 
	echo it might be caused by the trouble of the website, so please try again later.
	echo.
	echo Or, some permissions might be necessary to download the file on your environment.
	echo In such case, you might do it successfully by right clicking this batch file 
	echo and choosing "Run as administrator".
	echo.
	set /p pushKey=Press "Enter" key to exit.
	goto END
)


echo. 
echo. 
echo The download completed.
echo The folder in which the downloaded JRE is locating will be open.
echo Then RIGHT-CLICK the following (downloaded) file:
echo. 
echo         %LATEST_JRE_NAME%.zip    ^(ZIP file^)
echo. 
echo and select "Extract All" or "Extract Here" from the menu to extract it.
echo. 

start "" "%CD%"
echo msgbox "Right-click '%LATEST_JRE_NAME%.zip  (ZIP file)' and select 'Extract All' or 'Extract Here' to extract it. Then return to the command-line window.",vbInformation,"" > %TEMP%\msgboxtest.vbs & %TEMP%\msgboxtest.vbs

echo.
set /p pushKey=After the extraction completed, click this window and press "Enter" key.


:EXPAND_RETRY


if exist %LATEST_JRE_NAME%\README_English.txt (
	echo %LATEST_JRE_NAME%\jre\bin> %JRE_PATH_SETTING_FILE%
	start notepad %LATEST_JRE_NAME%\README_English.txt
	goto SUCCEEDED
)

if exist %LATEST_JRE_NAME%\%LATEST_JRE_NAME%\README_English.txt (
	echo %LATEST_JRE_NAME%\%LATEST_JRE_NAME%\jre\bin> %JRE_PATH_SETTING_FILE%
	start notepad %LATEST_JRE_NAME%\%LATEST_JRE_NAME%\README_English.txt
	goto SUCCEEDED
)


echo.
echo.
echo The extraction does not seems to completed. Please try again.
echo.
echo * Right-click "%LATEST_JRE_NAME%.zip ^(ZIP file^)" and select "Extract All" or "Extract Here" to extract it.
echo.
start "" "%CD%"
echo.
set /p pushKey=After the extraction completed, click this window and press "Enter" key.
goto EXPAND_RETRY


echo %LATEST_JRE_NAME%\%LATEST_JRE_NAME%\jre\bin> %JRE_PATH_SETTING_FILE%

start notepad %LATEST_JRE_NAME%\%LATEST_JRE_NAME%\README_English.txt



:SUCCEEDED

echo.
echo.
echo ----------------------------------------------------------------------------------------------------
echo.
echo.

echo.
echo The JRE have been downloaded and introduced successfully.
echo It is locating in "%LATEST_JRE_NAME%" folder 
echo in "jre" folder of this software.
echo ^( Full-path: %CD%\%LATEST_JRE_NAME% ^)
echo.
echo.
echo The JRE will not be deleted automatically when more new JRE will be introduced.
echo You can switch the JRE to use for this software,
echo by specifying in "JRE_Path_Setting.txt" in "jre" folder.
echo.
echo Please remove old JREs in "jre" folder manually if they are no longer necessary.
echo They are not registered to any registries and any environment variables, 
echo so you can simply remove their folder.
echo You can recognize the version of JREs by their folder name: 
echo "openjdk-w64-jre-?.?.?-ga-rinearn", where "?" is version numbers.
echo.
echo.
echo You can read more detailed explanation in the document in "jre" folder.
echo.
echo.
echo.
set /p pushKey=Press "Enter" key to go to the next step ^(e.g. launching software^) or exit.
echo.
goto END

:END
