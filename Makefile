TARGET := iphone:clang:latest:18.0
INSTALL_TARGET_PROCESSES = SpringBoard
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = WiFiModule
WiFiModule_BUNDLE_EXTENSION = bundle
WiFiModule_FILES = src/*.m
WiFiModule_CFLAGS = -fobjc-arc -I$(THEOS_PROJECT_DIR)/include
WiFiModule_FRAMEWORKS = UIKit
WiFiModule_PRIVATE_FRAMEWORKS = ControlCenterUIKit
WiFiModule_INSTALL_PATH = /Library/ControlCenter/Bundles/
WiFiModule_LDFLAGS += -Wl,-undefined,dynamic_lookup

include $(THEOS_MAKE_PATH)/bundle.mk
