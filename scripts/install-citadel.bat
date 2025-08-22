:: File:        install-citadel.bat
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

set "REPO_URL=https://github.com/nessbe/citadel"
set "OUTPUT_DIR=citadel"

:: Check if Git is installed
where git >nul 2>&1

if %errorlevel% neq 0 (
	echo Git is not installed, or is not in the PATH.
	echo Please install it and put it in the PATH, then try again.
	exit /b 1
)

cd "..\"

:: Check if the output directory already exists
if exist "%OUTPUT_DIR%" (
	echo Citadel library already installed. Continuing...
	goto success
)

git clone %REPO_URL% %OUTPUT_DIR%

if %errorlevel% equ 0 (
	echo Citadel installed successfully.
	goto success
) else (
	echo Failed to install Citadel.
	goto failure
)

:success
cd "scripts\"
exit /b 0

:failure
cd "scripts\"
exit /b 1