:: File:        generate-projects.bat
:: Project:     fortress
:: Repository:  https://github.com/nessbe/fortress
::
:: Copyright (c) 2025 nessbe
:: Licensed under the Apache License, Version 2.0 (the "License");
:: you may not use this file except in compliance with the License.
:: You may obtain a copy of the License at:
::
::     https://www.apache.org/licenses/LICENSE-2.0
::
:: Unless required by applicable law or agreed to in writing, software
:: distributed under the License is distributed on an "AS IS" BASIS,
:: WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
:: See the License for the specific language governing permissions and
:: limitations under the License.
::
:: For more details, see the LICENSE file at the root of the project.

@echo off
setlocal enabledelayedexpansion

cd "..\"
set "PREMAKE_DIR=%cd%\vendor\premake\bin"

echo Searching Premake executable inside %PREMAKE_DIR%

:: Change the current directory to the folder containing Premake
if exist "%PREMAKE_DIR%" (
	cd /d "%PREMAKE_DIR%"
) else (
	echo Premake directory not found: %PREMAKE_DIR%.
	goto :from_path
)

:: Search a file called premake*.exe inside the Premake bin folder
set "PREMAKE_EXE="

for %%f in (premake*.exe) do (
	set "PREMAKE_EXE=%cd%\%%f"
	goto :found
)

echo No Premake executable found in %PREMAKE_DIR%.
goto :from_path

:from_path
echo Trying to find Premake in the PATH...

where premake5.exe >nul 2>&1

if %errorlevel% neq 0 (
	echo Premake not found in the PATH.
	echo Please install it the %PREMAKE_DIR% folder or add it to the PATH.
) else (
	echo Found Premake executable in the PATH.
	set "PREMAKE_EXE=premake5.exe"
	goto :found
)

:found
echo Found Premake executable: %PREMAKE_EXE%.

cd "..\..\..\"

echo Premake root directory: %cd%
echo Executing Premake for Visual Studio 2022...

:: Execute Premake for Visual Studio 2022
call "%PREMAKE_EXE%" vs2022

endlocal
