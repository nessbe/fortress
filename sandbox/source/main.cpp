// File:       main.cpp
// Project:    fortress
// Repository: https://github.com/nessbe/fortress
//
// Copyright (c) 2025 nessbe
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at:
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// For more details, see the LICENSE file at the root of the project.

#include <iostream>

#include <citadel/citadel.hpp>

class sandbox_application : public citadel::application {
public:
	sandbox_application() = default;
	virtual ~sandbox_application() override = default;

private:
	virtual void _initialize() override { }

	virtual int _run(const citadel::command_line& arguments) override {
		citadel::scope<citadel::window> window = citadel::window::create(240, 135, 480, 270, "Sandbox window");

		if (window) {
			window->open();
			window->show();

			while (window->is_open()) {
				window->update();
			}
		}

		return 0;
	}

	virtual void _shutdown() override { }
};

citadel::application* citadel::create_application() {
	return new sandbox_application();
}
