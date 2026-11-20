# CDDL Imports

This folder contains imported CDDL schemas from external repositories.

## said.cddl

The SAID (Self-Addressed Identifier Digest) schema is imported from the [WebOfTrust/ietf-said](https://github.com/WebOfTrust/ietf-said) repository.

### Versioning

SAID artifacts are pinned to immutable GitHub releases. This ensures reproducibility and traceability.

**Current versions**:
- CDDL: `said-0.1.1.cddl` (from GitHub release `cddl-0.1.1`)
- JSON Schema: `said-0.1.0.schema.json` (from GitHub release `jsons-0.1.0`)

### Setup

Fetch the SAID artifacts from the pinned GitHub releases:

```bash
make imports        # Fetch both CDDL and JSON artifacts
make imports-cddl   # Fetch only CDDL from release cddl-0.1.1
make imports-jsons  # Fetch only JSON Schema from release jsons-0.1.0
```

Or manually:

```bash
# CDDL artifact
curl -L https://github.com/WebOfTrust/ietf-said/releases/download/cddl-0.1.1/said.cddl \
  -o imports/said-0.1.1.cddl

# JSON Schema
curl -L https://github.com/WebOfTrust/ietf-said/releases/download/jsons-0.1.0/said.schema.json \
  -o imports/said-0.1.0.schema.json
```

### Integration

To reference the SAID CDDL schema in VLEI CDDL schemas:

```cddl
include "imports/said-0.1.1.cddl"
```

To reference the JSON Schema:

```json
{
  "$schema": "imports/said-0.1.0.schema.json"
}
```

### Maintenance

When updating to new SAID versions, update the version variables in the Makefile:
- `SAID_CDDL_VERSION`
- `SAID_JSON_VERSION`

This folder is maintained to keep external dependencies isolated and clearly documented for downstream consumers.
