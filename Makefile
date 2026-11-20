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

# SAID artifact versions (pinned to producer commit)
SAID_VERSION := d9f9bac
SAID_CDDL := imports/said-$(SAID_VERSION).cddl
SAID_JSON := imports/said-$(SAID_VERSION).json

SAID_CDDL_URL := https://github.com/SmithSamuelM/draft-ssmith-said/releases/download/cddl-$(SAID_VERSION)/said.cddl
SAID_JSON_URL := https://github.com/SmithSamuelM/draft-ssmith-said/releases/download/json-$(SAID_VERSION)/said.json

# Import SAID artifacts from release
imports: imports-cddl imports-jsons

imports-cddl: $(SAID_CDDL)

imports-jsons: $(SAID_JSON)

$(SAID_CDDL):
	@echo "Fetching SAID CDDL from release cddl-$(SAID_VERSION)..."
	curl -s -L -f $(SAID_CDDL_URL) -o $@ || (rm -f $@; echo "✗ Failed to fetch $(SAID_CDDL_URL)"; exit 1)
	@echo "✓ $(SAID_CDDL)"

$(SAID_JSON):
	@echo "Fetching SAID JSON from release json-$(SAID_VERSION)..."
	curl -s -L -f $(SAID_JSON_URL) -o $@ || (rm -f $@; echo "✗ Failed to fetch $(SAID_JSON_URL)"; exit 1)
	@echo "✓ $(SAID_JSON)"

.PHONY: imports imports-cddl imports-jsons
