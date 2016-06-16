CP = cp -rv
RM = rm -rfv
UNZIP = unzip -u
WGET = wget
MKDIR = mkdir -p

SAXON_HE_VERSION_MAJOR = 9
SAXON_HE_VERSION_MINOR = 7
SAXON_HE_VERSION_PATCH = 0-4J
SAXON_HE_VERSION = $(SAXON_HE_VERSION_MAJOR).$(SAXON_HE_VERSION_MINOR).$(SAXON_HE_VERSION_PATCH)
SAXON_HE_ZIP = SaxonHE$(SAXON_HE_VERSION_MAJOR)-$(SAXON_HE_VERSION_MINOR)-$(SAXON_HE_VERSION_PATCH).zip
SAXON_HE_URL = https://sourceforge.net/projects/saxon/files/Saxon-HE/$(SAXON_HE_VERSION_MAJOR).$(SAXON_HE_VERSION_MINOR)/$(SAXON_HE_ZIP)/download

SCRIPT=saxon-cli
VERSION=0.0.1

PREFIX=/usr/local
SHAREDIR=$(PREFIX)/share/$(SCRIPT)
BINDIR=$(PREFIX)/bin

BINARIES += $(shell find bin -type f|sed 's,^,build/,'|sed 's,\.sh$$,,')

.PHONY: README.md

jar: saxon9he.jar

# Extract the Saxon JAR
saxon9he.jar:
	$(MAKE) $(SAXON_HE_ZIP)
	$(UNZIP) "$(SAXON_HE_ZIP)" "$@"

# Download Saxon-HE
$(SAXON_HE_ZIP):
	$(WGET) -O "$@" "$(SAXON_HE_URL)"

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
