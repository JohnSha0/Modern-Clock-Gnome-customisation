UUID = modernclock@gnome-port
SRC_DIR = src
DIST_DIR = dist
BUILD_DIR = build/$(UUID)
INSTALL_DIR = $(HOME)/.local/share/gnome-shell/extensions/$(UUID)

.PHONY: all build install uninstall clean dist

all: build

# Собрать расширение в build/
build:
	@echo "▶ Building $(UUID)..."
	@mkdir -p $(BUILD_DIR)/fonts
	@cp $(SRC_DIR)/extension.js $(BUILD_DIR)/
	@cp $(SRC_DIR)/metadata.json $(BUILD_DIR)/
	@cp $(SRC_DIR)/stylesheet.css $(BUILD_DIR)/
	@cp $(SRC_DIR)/fonts/Anurati.otf $(BUILD_DIR)/fonts/
	@cp $(SRC_DIR)/fonts/Poppins.ttf $(BUILD_DIR)/fonts/
	@echo "  ✓ Build complete: $(BUILD_DIR)/"

# Собрать zip-архив для распространения
dist:
	mkdir -p dist
	cd src && zip -r ../dist/$(UUID).zip extension.js metadata.json stylesheet.css fonts/
	@echo "✓ Archive: dist/$(UUID).zip"
# Установить расширение
install: build
	@echo "▶ Installing to $(INSTALL_DIR)..."
	@rm -rf $(INSTALL_DIR)
	@mkdir -p $(INSTALL_DIR)
	@cp -r $(BUILD_DIR)/* $(INSTALL_DIR)/
	@echo "  ✓ Installed"
	@echo ""
	@echo "  Установка шрифтов..."
	@mkdir -p $(HOME)/.local/share/fonts/modernclock
	@cp -f $(SRC_DIR)/fonts/Anurati.otf $(HOME)/.local/share/fonts/modernclock/
	@cp -f $(SRC_DIR)/fonts/Poppins.ttf $(HOME)/.local/share/fonts/modernclock/
	@fc-cache -f $(HOME)/.local/share/fonts/modernclock 2>/dev/null || true
	@echo "  ✓ Fonts installed"
	@echo ""
	@echo "  Активация..."
	@gnome-extensions enable $(UUID) 2>/dev/null || true
	@echo "  ✓ Done! Перелогинься чтобы расширение заработало."

# Удалить расширение
uninstall:
	@echo "▶ Uninstalling..."
	@gnome-extensions disable $(UUID) 2>/dev/null || true
	@rm -rf $(INSTALL_DIR)
	@echo "  ✓ Extension removed"
	@echo "  Шрифты оставлены в ~/.local/share/fonts/modernclock/"
	@echo "  Удалить шрифты: rm -rf ~/.local/share/fonts/modernclock && fc-cache -f"

# Очистить сборку
clean:
	@rm -rf build/
	@echo "  ✓ Clean"
