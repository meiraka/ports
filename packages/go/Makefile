.PHONY: clean fetch extract build-dep build install
all: extract

INSTALL_PREFIX?=$(HOME)
REQUIRE_APT=curl

OS=$(shell uname -s | tr A-Z a-z)
_ARCH=$(shell uname -m)
ifeq ($(_ARCH), armv6l)
ARCH=armv6l
else ifeq ($(_ARCH), armv7l)
# ARMv6 is upwards compatible with ARMv7
ARCH=armv6l
else ifeq ($(_ARCH), x86_64)
ARCH=amd64
else
ARCH=386
endif

VERSION=1.8

ARCHIVE=go$(VERSION).$(OS)-$(ARCH).tar.gz
WORKDIR=go$(VERSION)
INSTALL_PATH=$(INSTALL_PREFIX)/local/go

$(ARCHIVE):
	curl -L https://storage.googleapis.com/golang/$(ARCHIVE) -o $(ARCHIVE)

$(WORKDIR):| $(ARCHIVE)
	tar -xzf $(ARCHIVE)
	mv go $(WORKDIR)

clean:
	rm -rf $(WORKDIR)
	rm $(ARCHIVE)

fetch: $(ARCHIVE)
extract: $(WORKDIR)
build-dep: apt

install: $(WORKDIR)
	@touch $(INSTALL_PATH)
	@rm $(INSTALL_PATH)
	ln -si $(CURDIR)/$(WORKDIR) $(INSTALL_PATH)

include ../../rules/apt.rules
