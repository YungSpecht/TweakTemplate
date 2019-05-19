ARCHS = armv7 arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AwesomeTweak
Gasolina_FILES = Tweak.xm
Gasolina_EXTRA_FRAMEWORKS += Cephei


include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += tweakprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
