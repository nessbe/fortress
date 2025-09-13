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

:: Syntax: generate-projects (action)
:: Arguments:
::  - action: Premake action (https://premake.github.io/docs/Using-Premake/)
::            Possible values:
::             - vs2026: Generate Visual Studio 2026 project files
::             - vs2022: Generate Visual Studio 2022 project files
::             - vs2019: Generate Visual Studio 2019 project files
::             - vs2017: Generate Visual Studio 2017 project files
::             - vs2015: Generate Visual Studio 2015 project files
::             - vs2013: Generate Visual Studio 2013 project files
::             - vs2012: Generate Visual Studio 2012 project files
::             - vs2010: Generate Visual Studio 2010 project files
::             - vs2008: Generate Visual Studio 2008 project files
::             - vs2005: Generate Visual Studio 2005 project files
::             - gmake: Generate GNU Makefiles (including Cygwin and MinGW)
::             - gmakelegacy: Generate GNU Makefiles (deprecated exporter)
::             - xcode4: XCode projects
::             - codelite: CodeLite projects

@echo off

:: Gather parameters
if "%~1"=="" (
	echo This script must be called with a valid Premake action.
	exit /b 1
)

set ACTION=%~1

:: Check if Premake is installed
where premake5 >nul 2>&1

if %errorlevel% neq 0 (
	echo Failed to found the Premake executable in the PATH or in the current directory.
	echo Please install the Premake binary at the following link and put it in the PATH or in the current directory:
	echo https://premake.github.io/download
	exit /b 1
)

:: Go to the root directory
pushd "%~dp0\..\"

echo Running Premake with action '%ACTION%'...
premake5 %ACTION%

:: Go back to the initial directory
popd

if %errorlevel% neq 0 (
	echo Failed to generate project files.
	exit /b 1
) else (
	echo Project files generated successfully.
	exit /b 0
)
