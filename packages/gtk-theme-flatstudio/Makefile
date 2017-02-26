.PHONY: clean fetch extract build-dep build install
all: build

INSTALL_DIR?=~/.themes/
DST_PREFIX=$(shell echo $(INSTALL_DIR))
REQUIRE_APT=curl

ARCHIVE=FlatStudio-1.03.tar.gz
THEMES=FlatStudio FlatStudioDark FlatStudioGray FlatStudioLight
DST_PATH=$(patsubst %, $(DST_PREFIX)%, $(THEMES))

$(ARCHIVE):
	curl -L https://dl.opendesktop.org/api/files/download/id/1460761605/154296-FlatStudio-1.03.tar.gz -o $(ARCHIVE)

$(THEMES):| $(ARCHIVE)
	tar -xzf $(ARCHIVE)

$(DST_PATH): $(DST_PREFIX)%: %
	ln -s $(abspath $<) $(DST_PREFIX)

clean:
	rm -r $(THEMES)
	rm $(ARCHIVE)

fetch: $(ARCHIVE)
extract: $(THEMES)
build-dep: apt

build: build-dep fetch extract

install: $(DST_PATH)

include ../../rules/apt.rules
