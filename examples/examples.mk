# Build rules for credential examples

DIAG_DIR := examples/diag
DIAG_FILES := $(wildcard $(DIAG_DIR)/*.diag)
CBOR_FILES := $(DIAG_FILES:.diag=.cbor)
PRETTY_FILES := $(DIAG_FILES:.diag=.pretty)
PYTHON3 := /Users/nedsmith/.pyenv/versions/3.11.9/bin/python3

.PHONY: examples clean-examples

examples: $(CBOR_FILES) $(PRETTY_FILES)

$(DIAG_DIR)/%.cbor $(DIAG_DIR)/%.pretty: $(DIAG_DIR)/%.diag
	@$(PYTHON3) examples/convert_examples.py $<

clean-examples:
	rm -f $(CBOR_FILES) $(PRETTY_FILES)
