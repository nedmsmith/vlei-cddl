# CDDL

This directory contains Concise Data Definition Language (CDDL) schemas for
the vLEI data structures specified by this draft.

The schema is maintained as logical fragments and assembled into
`../exports/vlei.cddl` by running `make`.

## Schema Organization

Schemas are organized by credential type in the `subsections/` directory:

- `common/` - Shared types (primitives, node-schema pairs, disclaimers)
- `lei/` - Legal Entity credential
- `oor/` - Official Organizational Role credential
- `ecr/` - Engagement Context Role credential
- `qvi/` - Qualified vLEI Issuer credential
- `oor-auth/` - OOR Authorization credential
- `ecr-auth/` - ECR Authorization credential
- `ixbri/` - iXBRL Data Value Attestation credential

Each credential type directory contains:
- `01-boilerplate.cddl` - JSON-Schema metadata
- `02-properties.cddl` - Top-level structure
- `03-attributes.cddl` - Content/data fields (or `03-fact.cddl` for ixbri)
- `04-edges.cddl` - Credential linking (not in QVI)
- `05-rules.cddl` - Disclaimer/governance constraints

## Using the vLEI Schema

### Direct validation with cddlc

Validate a CBOR credential against a specific credential type:

```bash
cddlc ../exports/vlei.cddl -s lei-cred -c credential.cbor
cddlc ../exports/vlei.cddl -s oor-cred -c credential.cbor
cddlc ../exports/vlei.cddl -s ecr-cred -c credential.cbor
```

### Composing a custom schema

For applications that only support specific credential types, use `cddlc` to
compose a subset:

```bash
# Create app-defs.cddl with custom entry point:
# app-cred = lei-cred / oor-cred / ecr-cred

cddlc ../exports/vlei.cddl -I app-defs.cddl -s app-cred -t cddl -o app-schema.cddl
```

Then validate against your custom schema:

```bash
cddlc app-schema.cddl -s app-cred -c credential.cbor
```

### Using subsections directly

For modular composition, reference subsections directly:

```bash
cddlc imports/said.cddl subsections/common/*.cddl subsections/lei/*.cddl \
  -s lei-cred -c credential.cbor
```

## Build

Run `make` in this directory to regenerate `../exports/vlei.cddl`.

