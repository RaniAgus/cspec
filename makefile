CMAKE := cmake

BUILD_DIR := build
INSTALL_PREFIX := /usr

.PHONY: all configure build install uninstall clean

all: configure build

configure:
	@mkdir -p $(BUILD_DIR)
	$(CMAKE) -S . -B $(BUILD_DIR) -DCMAKE_INSTALL_PREFIX=$(INSTALL_PREFIX)

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
	    echo "No install_manifest.txt found. Run 'make install' first."; \
	fi

clean:
	@rm -rf $(BUILD_DIR)
