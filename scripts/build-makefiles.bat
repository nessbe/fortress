:: File:       build-makefiles.bat
:: Project:    fortress
:: Repository: https://github.com/nessbe/fortress
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

:: Generate Makefiles
call generate-makefiles.bat

:: Check if Make is installed
where make >nul 2>&1

if %errorlevel% neq 0 (
	echo Make binary not found in the current directory or in the PATH.
	echo Install the Make binary and put it the current directory or in the PATH.
	exit /b 1
)

:: Go to the repository root directory
pushd "%~dp0\.."

echo Building project using Make...
make

:: Return to the initial directory
popd

if %errorlevel% neq 0 (
	echo Failed to build project.
	exit /b 1
) else (
	echo Project built successfully.
	exit /b 0
)
