CMAKE := cmake

BUILD_DIR := build

ifeq ($(UNAME), Darwin)
INSTALL_PREFIX := /usr/local
else
INSTALL_PREFIX := /usr
endif

.PHONY: all release debug configure build install uninstall clean

all: release build

release: BUILD_TYPE := Release
release: configure

debug: BUILD_TYPE := Debug
debug: configure

configure:
	@mkdir -p $(BUILD_DIR)
	$(CMAKE) -S . -B $(BUILD_DIR) \
		-DCMAKE_INSTALL_PREFIX=$(INSTALL_PREFIX) \
		-DCMAKE_BUILD_TYPE=$(BUILD_TYPE)

build:
	$(CMAKE) --build $(BUILD_DIR)

install:
	$(CMAKE) --install $(BUILD_DIR)

uninstall:
	@echo "Uninstalling cspecs..."
	@if [ -f $(BUILD_DIR)/install_manifest.txt ]; then \
	    xargs rm -fv < $(BUILD_DIR)/install_manifest.txt; \
	    echo "Uninstalled files listed in install_manifest.txt"; \
	else \
	    echo "No install_manifest.txt found. Skipping uninstall..."; \
	fi

clean:
	@rm -rf $(BUILD_DIR)
