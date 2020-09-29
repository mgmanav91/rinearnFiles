@ECHO OFF


setlocal

cd /d "%~dp0"


set MEMORYFILE=RinearnGraph3DMemory.ini

type nul > RinearnGraph3DMemory.ini

SET MEMORYLINE=



	ECHO  - RINEARN Graph3D -
	ECHO ----------------------------------------------------------------------
	ECHO.
	ECHO   Welcome !
	ECHO.
	ECHO   Please input the memory allocation size [ MB ],
	ECHO   ande press Enter key.
	ECHO.
	ECHO   If you want to use the default setting,
	ECHO.  please Enter key without inputting anything.
	ECHO.
	ECHO ======================================================================
	ECHO.
	SET /P MEMORYLINE="Memory allocation size [ MB ] = "
	ECHO.
	ECHO The memory allocation size have set as the above.
	ECHO This setting is stored in the file folling file: %MEMORYFILE%
	ECHO.
	ECHO.



SET /A MEMORYLINE_NUM = MEMORYLINE + 0
IF "%MEMORYLINE%"=="%MEMORYLINE_NUM%" (
	ECHO.
) ELSE (
	SET MEMORYLINE=DEFAULT
)

SET /A MEMORYLINE_NUM = MEMORYLINE + 0
IF "%MEMORYLINE%"=="%MEMORYLINE_NUM%" (
	SET MEMORYLINE= -Xmx%MEMORYLINE%m 
) ELSE (
	SET MEMORYLINE=  
)


ECHO %MEMORYLINE_NUM%>>%MEMORYFILE%
ECHO. >>%MEMORYFILE%

cmd



endlocal
