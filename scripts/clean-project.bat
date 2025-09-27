:: File:       clean-project.bat
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
setlocal enabledelayedexpansion

set "PROJECT_FILES_EXTENSIONS=sln vcxproj vcxproj.filters vcxproj.user mk"
set "PROJECT_FILES_NAMES=Makefile GNUMakefile"

:: Go to the repository root directory
pushd "%~dp0\.."

for /r %%f in (*) do (
	set "file=%%f"
	set "file_dir=%%~dpf"
	set "file_name=%%~nxf"
	set "file_basename=%%~nf"
	set "file_extension=%%~xf"

	set "ignored=0"
	set "is_project=0"

	:: Check if the file matches a known project extension
	for %%x in (%PROJECT_FILES_EXTENSIONS%) do (
		if /i "%%x"=="!file_extension:.=!" (
			set "is_project=1"
		)
	)

	:: Check if the file matches a known project file name
	for %%n in (%PROJECT_FILES_NAMES%) do (
		if /i "%%n"=="!file_name!" (
			set "is_project=1"
		)
	)

	:: Display the file if it's not ignored and is a project file
	if !ignored! equ 0 if !is_project! equ 1 (
		echo Removing: !file!.
		del !file!
	)
)

:: Return to the initial directory
popd

endlocal

