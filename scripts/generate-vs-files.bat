:: File:       generate-vs-files.bat
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

:: Check if Premake is installed
where premake5 >nul 2>&1

if %errorlevel% neq 0 (
	echo Premake binary not found in the current directory or in the PATH.
	echo Install the Premake binary and put it the current directory or in the PATH.
	exit /b 1
)

:: Go to the repository root directory
pushd "%~dp0\.."

echo Generating Visual Studio 2022 project files using Premake...
premake5 vs2022

:: Return to the initial directory
popd

if %errorlevel% neq 0 (
	echo Failed to generate project files.
	exit /b 1
) else (
	echo Project files generated successfully.
	exit /b 0
)
