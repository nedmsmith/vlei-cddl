# CDDL Imports

This folder contains imported CDDL schemas from external repositories.

## said.cddl

The `said.cddl` file is imported from the [draft-ssmith-said](https://github.com/SmithSamuelM/draft-ssmith-said) repository.

### Setup

Once the PR merging `said.cddl` is complete in draft-ssmith-said, the export can be obtained from:
- **Source**: `draft-ssmith-said/exports/said.cddl`
- **Location**: This file should be placed at `imports/said.cddl`

### Integration

To use the SAID schema in VLEI CDDL schemas, reference it as:

```cddl
include "imports/said.cddl"
```

Or use a path relative to your importing CDDL file.

### Maintenance

This folder is maintained to keep external dependencies isolated and clearly documented for downstream consumers.
