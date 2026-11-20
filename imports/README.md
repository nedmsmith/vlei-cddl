# CDDL Imports

This folder contains imported CDDL schemas from external repositories.

## said.cddl

The `said.cddl` file is imported from the [draft-ssmith-said](https://github.com/SmithSamuelM/draft-ssmith-said) repository.

### Versioning

SAID artifacts are pinned to immutable GitHub releases identified by producer commit hash. This ensures both CDDL and JSON representations originate from the same SAID source state.

**Current version**: commit `d9f9bac`
- CDDL: `said-d9f9bac.cddl` (from GitHub release `cddl-d9f9bac`)
- JSON: `said-d9f9bac.json` (from GitHub release `json-d9f9bac`)

### Setup

Fetch the SAID artifacts from the pinned GitHub releases:

```bash
# CDDL artifact
curl -L https://github.com/SmithSamuelM/draft-ssmith-said/releases/download/cddl-d9f9bac/said.cddl \
  -o imports/said-d9f9bac.cddl

# JSON artifact
curl -L https://github.com/SmithSamuelM/draft-ssmith-said/releases/download/json-d9f9bac/said.json \
  -o imports/said-d9f9bac.json
```

Do **not** use moving repository contents (main branch exports/) as these change over time. Always use release assets for reproducibility.

### Integration

To reference the SAID schema in VLEI CDDL schemas:

```cddl
include "imports/said-d9f9bac.cddl"
```

Or use a path relative to your importing CDDL file.

### Maintenance

The commit suffix (e.g., `-d9f9bac`) is preserved so both formats are known to originate from the same SAID source state. When updating to a new SAID version, update both the CDDL and JSON artifacts from their respective release assets.

