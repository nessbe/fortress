-- File:       sandbox.lua
-- Project:    fortress
-- Repository: https://github.com/nessbe/fortress
--
-- Copyright (c) 2025 nessbe
-- This file is part of the citadel project and is licensed
-- under the terms specified in the LICENSE file located at the
-- root of this repository.
--
-- Unless required by applicable law or agreed to in writing,
-- the software is distributed on an "AS IS" BASIS, WITHOUT
-- WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the LICENSE file for details.

project "sandbox"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++20"

	targetdir("build/bin")
	objdir("build/obj")

	files {
		"include/**.hpp",
		"include/**.inl",
		"source/**.cpp"
	}

	includedirs {
		"include"
	}

	filter "action:gmake"
		buildoptions "-Wall"

	filter "action:vs*"
		buildoptions "/Wall"

	filter "configurations:debug"
		defines "SANDBOX_DEBUG"
		symbols "On"
		runtime "Debug"

	filter "configurations:release"
		defines "SANDBOX_RELEASE"
		optimize "On"
		runtime "Release"
