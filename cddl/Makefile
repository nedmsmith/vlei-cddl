.DEFAULT_GOAL := stream

include frags.mk

VLEI_AUTOGEN := vlei-autogen.cddl
VLEI_EXPORT := ../exports/vlei.cddl

.PHONY: stream clean

# Builds the complete vLEI schema by concatenating all fragments in dependency order.
# Output: vlei-autogen.cddl and exports/vlei.cddl
#
# Usage:
#   make                           # Build schema
#   make clean                     # Clean generated files
#
# Using the generated schema with cddlc:
#   cddlc vlei-autogen.cddl -s lei-cred -c credential.cbor
#   cddlc vlei-autogen.cddl -s oor-cred -c credential.cbor
#
# Composing a custom schema (for applications supporting only specific types):
#   # Create app-defs.cddl with: app-cred = lei-cred / oor-cred
#   cddlc vlei-autogen.cddl -I app-defs.cddl -s app-cred -t cddl -o app-schema.cddl
#
# Validating with custom entry point:
#   cddlc app-schema.cddl -s app-cred -c credential.cbor

stream: $(VLEI_AUTOGEN) $(VLEI_EXPORT)

$(VLEI_AUTOGEN): frags.mk $(VLEI_FRAGS)
	@cat $(VLEI_FRAGS) > $@.tmp
	mv $@.tmp $@

$(VLEI_EXPORT): $(VLEI_AUTOGEN)
	mkdir -p ../exports
	cp $(VLEI_AUTOGEN) $(VLEI_EXPORT)

clean:
	$(RM) $(VLEI_AUTOGEN) $(VLEI_AUTOGEN).tmp
