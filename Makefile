SCRIPT=shxml
VERSION=0.0.1

SAXON_HE_VERSION = 9.7.0-5
XALAN_VERSION = 2.7.2

CP = cp -rva
RM = rm -rfv
UNZIP = unzip -u
WGET = wget
GIT = git
MKDIR = mkdir -p
SHINCLUDE = build-deps/shinclude/shinclude
WGET = wget

PATH := $(PATH):./build-deps/shinclude

PREFIX=/usr/local
SHAREDIR=$(PREFIX)/share/$(SCRIPT)
BINDIR=$(PREFIX)/bin

.PHONY: test all docs

all: build-deps deps docs $(wildcard lib/backend/* lib/command/* lib/*)

#------------------------------------------------------------------------------
# Dependencies
#  deps/jar: Java libs
#  deps/bin: Shell scrips
#------------------------------------------------------------------------------
deps: deps/jar deps/bin deps/drip

#------------------------------------------------------------------------------
deps/jar: deps/jar/saxon9he.jar deps/jar/xalan.jar deps/jar/xalan-serializer.jar

MVN_URL = http://central.maven.org/maven2

SAXON_HE_URL = $(MVN_URL)/net/sf/saxon/Saxon-HE/$(SAXON_HE_VERSION)/Saxon-HE-$(SAXON_HE_VERSION).jar
deps/jar/saxon9he.jar:
	$(MKDIR) $(dir $@) && $(WGET) -O "$@" "$(SAXON_HE_URL)"

XALAN_URL = $(MVN_URL)/xalan/xalan/$(XALAN_VERSION)/xalan-$(XALAN_VERSION).jar
deps/jar/xalan.jar:
	$(MKDIR) $(dir $@) && $(WGET) -O "$@" "$(XALAN_URL)"

XALANSER_URL = $(MVN_URL)/xalan/serializer/$(XALAN_VERSION)/serializer-$(XALAN_VERSION).jar
deps/jar/xalan-serializer.jar:
	$(MKDIR) $(dir $@) && $(WGET) -O "$@" "$(XALANSER_URL)"

#------------------------------------------------------------------------------
deps/bin: deps/bin/shlog 

SHLOG_URL = https://rawgit.com/kba/shlog/master/shlog
deps/bin/shlog:
	$(MKDIR) "$(dir $@)" && wget -O "$@" "$(SHLOG_URL)" && chmod a+x "$@"

#------------------------------------------------------------------------------
DRIP_URL = https://github.com/ninjudd/drip
deps/drip:
	$(GIT) clone "$(DRIP_URL)" "$@"
	$(MAKE) -C "$@"

#------------------------------------------------------------------------------
# Build dependencies
#------------------------------------------------------------------------------
build-deps: build-deps/shinclude

SHINCLUDE_URL = https://github.com/kba/shinclude
build-deps/shinclude:
	git clone "$(SHINCLUDE_URL)" "$@"

#------------------------------------------------------------------------------
# Documentation
#------------------------------------------------------------------------------
docs: README.md API.md

# Include/Render/Tocify the README
README.md: doc/README.md 
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

#------------------------------------------------------------------------------
# Install
#------------------------------------------------------------------------------
install: build-deps deps README.md bin/$(SCRIPT)
	$(MKDIR) $(BINDIR)
	sed 's,^SHXMLSHARE=.*,SHXMLSHARE="$(SHAREDIR)",' "bin/$(SCRIPT)" \
		| $(SHINCLUDE) -c pound - \
		> "$(BINDIR)/$(SCRIPT)"
	chmod a+x $(BINDIR)/$(SCRIPT)
	$(MKDIR) $(SHAREDIR)
	$(CP) -t $(SHAREDIR) \
		LICENSE \
		README.md \
		lib \
		deps

#------------------------------------------------------------------------------
# Uninstall
#------------------------------------------------------------------------------
uninstall:
	$(RM) $(BINDIR)/$(SCRIPT)
	$(RM) $(SHAREDIR)

#------------------------------------------------------------------------------
# Clean
#------------------------------------------------------------------------------
realclean:
	$(RM) build-deps deps
	$(RM) test/.tsht test/tsht
	$(RM) README.md API.md

#------------------------------------------------------------------------------
# Test
#------------------------------------------------------------------------------
TSHT_URL = https://rawgit.com/kba/tsht/master/tsht
test/tsht:
	$(MKDIR) test && $(WGET) -O "$@" "$(TSHT_URL)" && chmod a+x "$@"
test: test/tsht
	./test/tsht

#------------------------------------------------------------------------------
# Docker
#------------------------------------------------------------------------------
docker:
	docker build -t 'kbai/shxml' .
