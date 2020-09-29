@echo off


rem ====================================================================================================
rem Jar Application Launcher Script - v24-en / RINEARN 2020
rem ====================================================================================================


setlocal

set JAR_FILE_NAME=RinearnGraph3D.jar
set DEFAULT_OPTIONS=--dir "%CD:\=\\%"
set MEMORY_FILE_NAME=RinearnGraph3DMemory.ini
set SOFTWARE_NAME=RINEARN Graph 3D
set JRE_PATH_FILE=.\jre\JRE_Path_Setting.txt
set JRE_DOWNLOADER=.\jre\JRE_Downloader.bat


set ARGUMENTS_PREFIX=
set ARGUMENTS_PREFIX_TARGET=NONE

set ARGUMENTS_BUFFER=
for %%a in ( %* ) do call :REGISTER_ARG %%a

cd /d "%~dp0"
cd ..


goto LOAD_MEMORY


rem --------------------------------------------------------------------------------
rem --------------------------------------------------------------------------------
:LOAD_MEMORY
set MEMORY_LINE=
if exist %MEMORY_FILE_NAME% (
	for /F "delims=" %%a in (%MEMORY_FILE_NAME%) do (
		set MEMORY_LINE=%%a
		goto MEMORY_READ_END
	)
) else (
	echo.
	echo  - %SOFTWARE_NAME% -
	echo.
	echo ----------------------------------------------------------------------
	echo.
	echo   Welcome !
	echo.
	echo   Please input the memory allocation size [ MB ],
	echo   ande press Enter key.
	echo.
	echo   If you want to use the default setting,
	echo.  press Enter key without inputting anything.
	echo.
	echo ======================================================================
	echo.
	set /P MEMORY_LINE="Memory allocation size [ MB ] = "
	echo.
	echo The memory allocation size have set as the above.
	echo This setting is stored in the file folling file: %MEMORYFILE%
	echo.
	echo.
)

:MEMORY_READ_END

set /A MEMORY_LINE_NUM = MEMORY_LINE + 0
if not "%MEMORY_LINE%"=="%MEMORY_LINE_NUM%" (
	set MEMORY_LINE=DEFAULT
)

set /A MEMORY_LINE_NUM = MEMORY_LINE + 0
if "%MEMORY_LINE%"=="%MEMORY_LINE_NUM%" (
	set MEMORY_LINE= -Xmx%MEMORY_LINE%m 
) else (
	set MEMORY_LINE=  
)

goto JRE_TEST


rem --------------------------------------------------------------------------------
rem --------------------------------------------------------------------------------
:JRE_TEST

java -version 2> NUL
if %ERRORLEVEL%==0 (
	goto JRE_ADD_PATH
) else (
	goto :JRE_DOWNLOAD
)

:JRE_DOWNLOAD
if exist %JRE_DOWNLOADER% (
	call %JRE_DOWNLOADER%
	@echo off
)
goto JRE_ADD_PATH


rem --------------------------------------------------------------------------------
rem --------------------------------------------------------------------------------
:JRE_ADD_PATH
if exist %JRE_PATH_FILE% (
	for /F %%a in (%JRE_PATH_FILE%) do (
		set JRE_PATH=.\jre\%%a
	)
) else (
	goto RUN
)
set "PATH=%JRE_PATH%;%PATH%"
goto RUN


rem --------------------------------------------------------------------------------
rem --------------------------------------------------------------------------------
:RUN
java %MEMORY_LINE% -jar %JAR_FILE_NAME% %DEFAULT_OPTIONS% %ARGUMENTS_BUFFER%
goto SAVE


rem --------------------------------------------------------------------------------
rem --------------------------------------------------------------------------------
:SAVE
if %ERRORLEVEL%==0 (
	if not exist "%MEMORY_FILE_NAME%" (
		if %MEMORY_LINE_NUM%==0 (
			echo. >>"%MEMORY_FILE_NAME%"
		) else (
			echo %MEMORY_LINE_NUM%>>"%MEMORY_FILE_NAME%"
		)
	)
) else (
	echo.
	echo ======================================================================
	echo.
	echo - Launch Failed. Common cause:
	echo.
	echo * Specified memory allocation size might be too large.
	echo.
	echo * Some permissions might be necessary.
	echo.
	echo ( In such case, you might launch it by right clicking this batch file and choosing "Run as administrator". ^)
	echo.
	echo * There is no Java^(R^) Runtime Environment ^(JRE^) in your environment.
	echo.
	echo * JRE in your environment might be too old for this software.
	echo.
	echo ^( You can download and use the appropriate version of the JRE by double-clicking "UpdateJRE.bat" to execute. ^)
	echo.
	echo ^( Oracle and Java are registered trademarks of Oracle and/or its affiliates. ^)
	echo.
	echo.

	if exist "%MEMORY_FILE_NAME%" (
		del "%MEMORY_FILE_NAME%"
	)

	echo ======================================================================
	echo.
	pause
)
goto END


:END
exit /b


rem --------------------------------------------------------------------------------
rem --------------------------------------------------------------------------------
:REGISTER_ARG

	if "%ARGUMENTS_PREFIX_TARGET%"=="NONE" (
		set ARGUMENTS_PREFIX=
	)

	set PROCESSED_ARG="%ARGUMENTS_PREFIX%%~1"
	set PROCESSED_ARG=%PROCESSED_ARG:\=\\%

	if "%ARGUMENTS_PREFIX_TARGET%"=="ONLY_FIRST" (
		set ARGUMENTS_PREFIX=
	)

	set APPENDED_BUFFER=%ARGUMENTS_BUFFER% %PROCESSED_ARG%
	set ARGUMENTS_BUFFER=%APPENDED_BUFFER%

