-- File:        premake5.lua (sandbox)
-- Project:     fortress
-- Repository:  https://github.com/nessbe/fortress
--
-- Copyright (c) 2025 nessbe
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at:
--
--     https://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--
-- For more details, see the LICENSE file at the root of the project.

root_dir = "%{wks.location}/"
output_dir = "%{cfg.system}/%{cfg.architecture}/%{cfg.buildcfg}/"

project "sandbox"
	kind "ConsoleApp"

	language "C++"
	cppdialect "C++20"

	targetdir(root_dir .. "bin/" .. output_dir .. "%{prj.name}")
	objdir(root_dir .. "obj/" .. output_dir .. "%{prj.name}")

	defines {
		"CITADEL_LINKAGE_DYNAMIC",
	}

	files {
		"include/**.h",
		"inline/**.inl",
		"source/**.cpp",
		"**.editorconfig",
	}

	includedirs {
		"include/",
		"inline/",
		root_dir .. "citadel/include/",
		root_dir .. "citadel/inline/",
	}

	links {
		"citadel",
	}

	postbuildcommands {
		"{COPY} " .. root_dir .. "bin/" .. output_dir .. "citadel/citadel.dll %{cfg.targetdir}"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		defines {
			"SANDBOX_DEBUG",
			"CITADEL_ENABLE_DEBUGBREAK",
			"CITADEL_ENABLE_ASSERTIONS",
		}
		symbols "On"
		runtime "Release"

	filter "configurations:Release"
		defines {
			"SANDBOX_RELEASE",
		}
		optimize "on"
		runtime "Release"

	filter "configurations:Dist"
		defines {
			"SANDBOX_DIST",
		}
		optimize "Full"
		runtime "Release"
		staticruntime "On"
