# CDDL Subsections

This directory contains modularized CDDL schema definitions, organized by credential type and functional block. Each subsection is broken down into logical, reusable components.

## Directory Structure

### Common (`common/`)
Shared primitives, types, and structures used across all vLEI credentials:
- `01-primitives.cddl` - Core data types (said, aid, date-time)
- `02-node-schema-pairs.cddl` - Node-schema pair definitions for credential linking
- `03-node-schema-triples.cddl` - Node-schema triple definitions for auth credentials
- `04-disclaimer-texts.cddl` - Canonical legal disclaimer text definitions
- `05-disclaimer-objects.cddl` - Disclaimer object shapes

### Credential Types

Each credential type is organized with the following structure:

#### Legal Entity (LEI) - `lei/`
- `01-boilerplate.cddl` - JSON Schema boilerplate metadata
- `02-properties.cddl` - Top-level credential properties
- `03-attributes.cddl` - Attributes block definitions
- `04-edges.cddl` - Edge block for credential linking
- `05-rules.cddl` - Rules block with legal disclaimers

#### Official Organizational Role (OOR) - `oor/`
- `01-boilerplate.cddl` - JSON Schema boilerplate metadata
- `02-properties.cddl` - Top-level credential properties
- `03-attributes.cddl` - Attributes block with person and role details
- `04-edges.cddl` - Edge block variants (auth and LE)
- `05-rules.cddl` - Rules block with legal disclaimers

#### Engagement Context Role (ECR) - `ecr/`
- `01-boilerplate.cddl` - JSON Schema boilerplate metadata
- `02-properties.cddl` - Top-level credential properties
- `03-attributes.cddl` - Attributes block with person and engagement role
- `04-edges.cddl` - Edge block variants (auth and LE)
- `05-rules.cddl` - Rules block with legal disclaimers

#### Qualified vLEI Issuer (QVI) - `qvi/`
- `01-boilerplate.cddl` - JSON Schema boilerplate metadata
- `02-properties.cddl` - Top-level credential properties
- `03-attributes.cddl` - Attributes block with QVI details
- `04-rules.cddl` - Rules block with legal disclaimers

#### OOR Authorization - `oor-auth/`
- `01-boilerplate.cddl` - JSON Schema boilerplate metadata
- `02-properties.cddl` - Top-level credential properties
- `03-attributes.cddl` - Attributes block with intended recipient details
- `04-edges.cddl` - Edge block linking to LE credential
- `05-rules.cddl` - Rules block with legal disclaimers

#### ECR Authorization - `ecr-auth/`
- `01-boilerplate.cddl` - JSON Schema boilerplate metadata
- `02-properties.cddl` - Top-level credential properties
- `03-attributes.cddl` - Attributes block with intended recipient details
- `04-edges.cddl` - Edge block linking to LE credential
- `05-rules.cddl` - Rules block with legal disclaimers and privacy notice

#### iXBRL Data Attestation - `ixbri/`
- `01-boilerplate.cddl` - JSON Schema boilerplate metadata
- `02-properties.cddl` - Top-level credential properties
- `03-fact.cddl` - Individual iXBRL fact structure
- `04-attributes.cddl` - Data block containing iXBRL facts
- `05-edges.cddl` - Edge block variants (OOR and ECR)

## Naming Convention

Files are numbered for load order:
- `01-*` - Boilerplate (metadata)
- `02-*` - Properties (structural)
- `03-*` - Attributes or specific sub-blocks
- `04-*` - Edges or additional sub-blocks
- `05-*` - Rules or concluding definitions

## Usage

Each subsection is self-contained but references common definitions. To include a full credential type schema, include all files in the respective directory:

```
include "cddl/subsections/lei/01-boilerplate.cddl"
include "cddl/subsections/lei/02-properties.cddl"
include "cddl/subsections/lei/03-attributes.cddl"
include "cddl/subsections/lei/04-edges.cddl"
include "cddl/subsections/lei/05-rules.cddl"
```

For external consumption, the aggregated schema is available at `exports/vlei.cddl`.
