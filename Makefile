SAXON_HE_VERSION = 9.7.0-5
XALAN_VERSION = 2.7.2

CP = cp -rv
RM = rm -rfv
UNZIP = unzip -u
WGET = wget
MKDIR = mkdir -p

MVN_URL = http://central.maven.org/maven2
SAXON_HE_URL = $(MVN_URL)/net/sf/saxon/Saxon-HE/$(SAXON_HE_VERSION)/Saxon-HE-$(SAXON_HE_VERSION).jar
XALAN_URL = $(MVN_URL)/xalan/xalan/$(XALAN_VERSION)/xalan-$(XALAN_VERSION).jar
XALANSER_URL = $(MVN_URL)/xalan/serializer/$(XALAN_VERSION)/serializer-$(XALAN_VERSION).jar

SCRIPT=saxon-cli
VERSION=0.0.1

PREFIX=/usr/local
SHAREDIR=$(PREFIX)/share/$(SCRIPT)
BINDIR=$(PREFIX)/bin

BINARIES += $(shell find bin -type f|sed 's,^,build/,'|sed 's,\.sh$$,,')

.PHONY: README.md

jar: jar/saxon9he.jar jar/xalan.jar jar/xalan-serializer.jar

jar/saxon9he.jar:
	$(MKDIR) jar && $(WGET) -O "$@" "$(SAXON_HE_URL)"

jar/xalan.jar:
	$(MKDIR) jar && $(WGET) -O "$@" "$(XALAN_URL)"

jar/xalan-serializer.jar:
	$(MKDIR) jar && $(WGET) -O "$@" "$(XALANSER_URL)"

# Remove the compiled file and ZIP
clean:
	$(RM) $(SCRIPT)
	$(RM) $(SAXON_HE_ZIP)

# Include/Render/Tocify the README
README.md:
	shinclude -i -c xml README.md

build: $(BINARIES) build/common.sh

build/common.sh: common.sh
	$(MKDIR) $(dir $@)
	shinclude -c pound "$<" > "$@"

# Set SHAREDIR and expand shinclude templates
build/bin/%: bin/%.sh
	$(MKDIR) $(dir $@)
	sed 's,^SHAREDIR=.*,SHAREDIR="$(SHAREDIR)",' "$<" \
		| shinclude -c pound - \
		> "$@"

install: build jar README.md $(SCRIPT)
	$(CP) $(SCRIPT) $(BINDIR)/$(SCRIPT)
	chmod a+x $(BINDIR)/$(SCRIPT)
	$(MKDIR) $(SHAREDIR)
	$(CP) -t $(SHAREDIR) \
		LICENSE \
		README.md \
		saxon9he.jar

check:
	which unzip wget
