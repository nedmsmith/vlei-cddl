LIBDIR := lib
include $(LIBDIR)/main.mk
include examples/examples.mk

$(LIBDIR)/main.mk:
ifneq (,$(shell grep "path *= *$(LIBDIR)" .gitmodules 2>/dev/null))
	git submodule sync
	git submodule update $(CLONE_ARGS) --init
else
	git clone -q --depth 10 $(CLONE_ARGS) \
	    -b main https://github.com/martinthomson/i-d-template $(LIBDIR)
endif

# SAID artifact versions
# SAID_CDDL_VERSION_OVERRIDE can be set via environment for regression testing
# Example: SAID_CDDL_VERSION_OVERRIDE=0.1.0 make imports
#
# Normal operation: auto-detect latest from imports/ folder
# Regression testing: set env variable to test specific version

SAID_CDDL_VERSION_OVERRIDE ?=
SAID_JSON_VERSION_OVERRIDE ?=

# Auto-detect latest versions from imports/ folder
# If override is set, use that; otherwise use latest found
_SAID_CDDL_FILES := $(wildcard imports/said-*.cddl)
_SAID_JSON_FILES := $(wildcard imports/said-*.schema.json)

ifeq ($(SAID_CDDL_VERSION_OVERRIDE),)
  # Auto-detect: extract version from latest file (sorted, last is highest)
  _SAID_CDDL_LATEST := $(lastword $(sort $(_SAID_CDDL_FILES)))
  SAID_CDDL_VERSION := $(if $(_SAID_CDDL_LATEST),$(patsubst imports/said-%.cddl,%,$(_SAID_CDDL_LATEST)),0.1.1)
else
  SAID_CDDL_VERSION := $(SAID_CDDL_VERSION_OVERRIDE)
endif

ifeq ($(SAID_JSON_VERSION_OVERRIDE),)
  _SAID_JSON_LATEST := $(lastword $(sort $(_SAID_JSON_FILES)))
  SAID_JSON_VERSION := $(if $(_SAID_JSON_LATEST),$(patsubst imports/said-%.schema.json,%,$(_SAID_JSON_LATEST)),0.1.1)
else
  SAID_JSON_VERSION := $(SAID_JSON_VERSION_OVERRIDE)
endif

SAID_CDDL := imports/said-$(SAID_CDDL_VERSION).cddl
SAID_JSON := imports/said-$(SAID_JSON_VERSION).schema.json
SAID_CDDL_LINK := imports/said.cddl
SAID_JSON_LINK := imports/said.schema.json

SAID_CDDL_URL := https://github.com/WebOfTrust/ietf-said/releases/download/cddl-$(SAID_CDDL_VERSION)/said.cddl
SAID_JSON_URL := https://github.com/WebOfTrust/ietf-said/releases/download/jsons-$(SAID_JSON_VERSION)/said.schema.json

# Import SAID artifacts from release
imports: imports-cddl imports-jsons

imports-cddl: $(SAID_CDDL_LINK)

imports-jsons: $(SAID_JSON_LINK)

$(SAID_CDDL):
	@echo "Fetching SAID CDDL from release cddl-$(SAID_CDDL_VERSION)..."
	curl -s -L -f $(SAID_CDDL_URL) -o $@ || (rm -f $@; echo "✗ Failed to fetch $(SAID_CDDL_URL)"; exit 1)
	@echo "✓ $(SAID_CDDL)"

$(SAID_JSON):
	@echo "Fetching SAID JSON Schema from release jsons-$(SAID_JSON_VERSION)..."
	curl -s -L -f $(SAID_JSON_URL) -o $@ || (rm -f $@; echo "✗ Failed to fetch $(SAID_JSON_URL)"; exit 1)
	@echo "✓ $(SAID_JSON)"

$(SAID_CDDL_LINK): $(SAID_CDDL)
	@rm -f $@
	@ln -s $(notdir $(SAID_CDDL)) $@
	@echo "✓ $(SAID_CDDL_LINK) -> $(notdir $(SAID_CDDL))"

$(SAID_JSON_LINK): $(SAID_JSON)
	@rm -f $@
	@ln -s $(notdir $(SAID_JSON)) $@
	@echo "✓ $(SAID_JSON_LINK) -> $(notdir $(SAID_JSON))"

clean-imports:
	@rm -f imports/said-*.cddl imports/said-*.schema.json imports/said.cddl imports/said.schema.json
	@echo "✓ Cleaned imports"

.PHONY: imports imports-cddl imports-jsons clean-imports
