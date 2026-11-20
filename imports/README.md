# CDDL Imports

This folder contains imported CDDL schemas from external repositories.

## said.cddl & said.schema.json

The SAID (Self-Addressed Identifier Digest) schemas are imported from the [WebOfTrust/ietf-said](https://github.com/WebOfTrust/ietf-said) repository.

### Versioning

SAID artifacts are pinned to immutable GitHub releases. This ensures reproducibility and traceability.

**Current version: 0.1.1**
- CDDL: `said-0.1.1.cddl` (from GitHub release `cddl-0.1.1`)
- JSON Schema: `said-0.1.1.schema.json` (from GitHub release `jsons-0.1.1`)

### Setup

Fetch the SAID artifacts from the pinned GitHub releases:

```bash
make imports        # Fetch both CDDL and JSON artifacts
make imports-cddl   # Fetch only CDDL from release cddl-0.1.1
make imports-jsons  # Fetch only JSON Schema from release jsons-0.1.1
make clean-imports  # Remove all imported artifacts
```

Or manually:

```bash
# CDDL artifact
curl -L https://github.com/WebOfTrust/ietf-said/releases/download/cddl-0.1.1/said.cddl \
  -o imports/said-0.1.1.cddl

# JSON Schema
curl -L https://github.com/WebOfTrust/ietf-said/releases/download/jsons-0.1.1/said.schema.json \
  -o imports/said-0.1.1.schema.json
```

### Integration

To reference the SAID CDDL schema in VLEI CDDL schemas:

```cddl
include "imports/said.cddl"
```

The generic symlink `said.cddl` -> `said-0.1.1.cddl` automatically points to the latest version.

To reference the JSON Schema:

```json
{
  "$schema": "imports/said.schema.json"
}
```

### Maintenance

The build system auto-detects the latest SAID version from the imports/ folder. When a new SAID release arrives:

```bash
make clean-imports
make imports
# No Makefile changes needed!
```

For regression testing against a specific version:

```bash
SAID_CDDL_VERSION_OVERRIDE=0.1.0 \
SAID_JSON_VERSION_OVERRIDE=0.1.0 \
make imports
```

---

## Template for Other Projects

If your project needs to import CDDL or JSON schemas from external sources, you can follow this same pattern. Here's what worked well:

### Key Pattern Elements

1. **Versioned Downloads**: Always include version in filename
   ```
   imports/schema-0.1.1.cddl
   imports/schema-0.1.1.schema.json
   ```

2. **Generic Symlinks for Autogen**: Draft generators need stable paths
   ```makefile
   imports/schema.cddl -> schema-0.1.1.cddl
   imports/schema.schema.json -> schema-0.1.1.schema.json
   ```

3. **Makefile Targets**: Make symlinks build targets, not manual files
   ```makefile
   SCHEMA_VERSION_OVERRIDE ?=
   _SCHEMA_FILES := $(wildcard imports/schema-*.cddl)
   SCHEMA_VERSION := $(if $(SCHEMA_VERSION_OVERRIDE),$(SCHEMA_VERSION_OVERRIDE),$(patsubst imports/schema-%.cddl,%,$(lastword $(sort $(_SCHEMA_FILES)))))
   
   imports/schema.cddl: imports/schema-$(SCHEMA_VERSION).cddl
   	@rm -f $@
   	@ln -s $(notdir $<) $@
   ```

4. **Minimal Makefile Changes**: Auto-detect latest version
   - New release arrives? Just run `make imports`
   - No version variables to update

5. **Regression Test Support**: Environment variables allow testing specific versions
   ```bash
   SCHEMA_VERSION_OVERRIDE=0.1.0 make imports
   ```

### Setup Checklist for Downstream Projects

- [ ] Create `imports/` folder with README.md
- [ ] Document external schema sources and versions
- [ ] Add Makefile targets for `imports`, `imports-{type}`, and `clean-imports`
- [ ] Create generic symlinks as build targets
- [ ] Add `.gitignore` entry: `imports/schema-*` (keep README and symlinks)
- [ ] Update draft autogen to reference symlinks (`imports/schema.cddl` not `imports/schema-0.1.1.cddl`)
- [ ] Document regression test workflow in README

---

## Coordination Between Repos

This pattern requires coordination between upstream (ietf-said) and downstream (vlei-cddl) repositories:

### For Upstream SAID Repo
- ✅ Create separate releases for CDDL and JSON (cddl-X.Y.Z, jsons-X.Y.Z)
- ✅ Ensure consistent versioning across artifact types
- ✅ Document release contents and compatibility in release notes
- 🎯 Consider: Add a `.said-versions.json` manifest in releases listing all published versions

### For Downstream Repos
- ✅ Version-pin all external artifacts by filename
- ✅ Use auto-detecting Makefiles (environment variable overrides)
- ✅ Document import pattern in README.md
- ✅ Commit symlinks to git (they're stable, point to versioned files)
- 🎯 Consider: Share `Makefile.imports` snippet for reuse by third repos

This folder is maintained to keep external dependencies isolated and clearly documented for downstream consumers.

