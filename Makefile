SCRIPT=shxml
VERSION=0.0.1

SAXON_HE_VERSION = 9.7.0-5
XALAN_VERSION = 2.7.2

CP = cp -rva
RM = rm -rfv
UNZIP = unzip -u
WGET = wget
MKDIR = mkdir -p
SHINCLUDE = build-deps/shinclude/dist/shinclude

MVN_URL = http://central.maven.org/maven2
SAXON_HE_URL = $(MVN_URL)/net/sf/saxon/Saxon-HE/$(SAXON_HE_VERSION)/Saxon-HE-$(SAXON_HE_VERSION).jar
XALAN_URL = $(MVN_URL)/xalan/xalan/$(XALAN_VERSION)/xalan-$(XALAN_VERSION).jar
XALANSER_URL = $(MVN_URL)/xalan/serializer/$(XALAN_VERSION)/serializer-$(XALAN_VERSION).jar

PATH := $(PATH):./build-deps/shinclude

SCRIPT=shxml
VERSION=0.0.1

PREFIX=/usr/local
SHAREDIR=$(PREFIX)/share/$(SCRIPT)
BINDIR=$(PREFIX)/bin

.PHONY: test

#
# Dependencies
#
deps: deps/jar deps/bin
#  deps/jar: Java libs
deps/jar: deps/jar/saxon9he.jar deps/jar/xalan.jar deps/jar/xalan-serializer.jar
deps/jar/saxon9he.jar:
	$(MKDIR) $(dir $@) && $(WGET) -O "$@" "$(SAXON_HE_URL)"
deps/jar/xalan.jar:
	$(MKDIR) $(dir $@) && $(WGET) -O "$@" "$(XALAN_URL)"
deps/jar/xalan-serializer.jar:
	$(MKDIR) $(dir $@) && $(WGET) -O "$@" "$(XALANSER_URL)"
#  deps/bin: Shell scrips
deps/bin: deps/bin/shlog
deps/bin/shlog:
	$(MKDIR) "$(dir $@)" && wget -O "$@" "https://rawgit.com/kba/shlog/master/shlog" && chmod a+x "$@"

#
# Build dependencies
#
build-deps: build-deps/shinclude
build-deps/shinclude:
	git clone 'https://github.com/kba/shinclude' "$@"


#
# Build
#
build: build-deps deps $(wildcard lib/backend/* lib/command/* lib/*)

# Include/Render/Tocify the README
README.md: doc/README.md $(wildcard src/*)
	shinclude -c xml doc/README.md > README.md
API.md: doc/API.md $(wildcard lib/*.bash)
	shinclude -c xml doc/API.md > "$@"


# build/common.sh: common.sh
#     $(MKDIR) $(dir $@)
#     shinclude -c pound "$<" > "$@"

# # Set SHAREDIR and expand shinclude templates
# build/bin/%: bin/%.sh
#     $(MKDIR) $(dir $@)
#     sed 's,^SHAREDIR=.*,SHAREDIR="$(SHAREDIR)",' "$<" \
#         | shinclude -c pound - \
#         > "$@"

#
# Install
#
install: deps README.md bin/$(SCRIPT)
	$(MKDIR) $(BINDIR)
	sed 's,^SHXMLSHARE=.*,SHXMLSHARE="$(SHAREDIR)",' "bin/$(SCRIPT)" \
		| $(SHINCLUDE) -c pound - \
		> "$(BINDIR)/$(SCRIPT)"
	chmod a+x $(BINDIR)/$(SCRIPT)
	$(MKDIR) $(SHAREDIR)
	$(CP) -t $(SHAREDIR) \
		LICENSE \
		README.md \
		deps \
		lib \
		deps

#
# Uninstall
#
uninstall:
	$(RM) $(BINDIR)/$(SCRIPT)
	$(RM) $(SHAREDIR)

#
# Clean
#

clean:
	$(RM) $(SCRIPT)
	$(RM) deps

realclean: clean
	$(RM) README.md build-deps deps

#
# Docker
#

docker:
	docker build -t 'kbai/shxml' .
