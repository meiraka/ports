.PHONY: clean fetch extract patch build-dep build install
all: build

INSTALL_PREFIX?=$(HOME)
REQUIRE_APT=libevent-dev

USER=tmux
REPO=tmux
TAG=2.3

ARCHIVE=$(TAG).tar.gz
WORKDIR=$(REPO)-$(TAG)
CONFIGURE_ARGS+= CFLAGS="-I$(INSTALL_PREFIX)/include" LDFLAGS="-L$(INSTALL_PREFIX)/lib" --prefix=$(INSTALL_PREFIX)

$(ARCHIVE):
	curl -L https://github.com/$(USER)/$(REPO)/archive/$(ARCHIVE) -o $(ARCHIVE)

$(WORKDIR):| $(ARCHIVE)
	tar -xzf $(ARCHIVE)

clean:
	rm -rf $(WORKDIR)
	rm $(ARCHIVE)

fetch: $(ARCHIVE)
extract: $(WORKDIR)
build-dep: apt

build: $(WORKDIR) build-dep
	cd $(WORKDIR); sh autogen.sh
	cd $(WORKDIR); ./configure $(CONFIGURE_ARGS)
	cd $(WORKDIR); make

install:
	cd $(WORKDIR); make install

include ../../rules/apt.rules
