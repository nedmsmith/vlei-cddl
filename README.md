# vLEI CDDL Schema

This is the working area for the IETF Internet-Draft, "vLEI Credential Definition Language".

## Editor's Copy

[Editor's draft (Markdown)](draft-nsmith-vlei-cddl.md)

## Contributing

Contributions are welcome! Please submit issues or pull requests to improve the schema documentation and examples.

See the [Contributing Guidelines](CONTRIBUTING.md) for more details.

## Building

Formatted text and HTML versions of the draft can be built using `make`.

```bash
$ make
```

For command line usage, ensure you have the necessary software installed. See the [installation instructions](https://github.com/martinthomson/i-d-template/blob/main/doc/SETUP.md).

### Build Outputs

- `draft-nsmith-vlei-cddl.xml` - XML representation (for RFC processing)
- `draft-nsmith-vlei-cddl.html` - Formatted HTML
- `draft-nsmith-vlei-cddl.txt` - Plain text

### Clean Build

```bash
$ make clean
```

## Schema Organization

The CDDL schema is organized into modular subsections under `cddl/subsections/`:

- **common/** - Shared types (said-map, disclaimers, schema pairs)
- **lei/** - Legal Entity Credential
- **qvi/** - Qualified vLEI Issuer Credential
- **oor/** - Official Organizational Role Credential
- **ecr/** - Engagement Context Role Credential
- **oor-auth/** - OOR Authorization Credential
- **ecr-auth/** - ECR Authorization Credential
- **ixbri/** - iXBRL Data Value Attestation

See [cddl/subsections/README.md](cddl/subsections/README.md) for detailed documentation.

## External Dependencies

The schema imports external definitions from:

- **imports/said.cddl** - SAID (Self-Addressed Identifier Digest) types from [draft-ssmith-said](https://github.com/SmithSamuelM/draft-ssmith-said)

See [imports/README.md](imports/README.md) for integration instructions.

## Examples

Example CBOR and diagnostic notations for each credential type are located in `examples/diag/`.

## License

[Specify your license here - typically dual-licensed under CC0 and BSD-3-Clause for IETF work]
