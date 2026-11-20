# vLEI Credential Definition Language

This is the working area for the IETF Internet-Draft, "vLEI Credential Definition Language".

* [Editor's Copy](https://nedmsmith.github.io/vlei-cddl/#go.draft-nsmith-vlei-cddl.html)
* [Working Group Draft](https://datatracker.ietf.org/doc/draft-nsmith-vlei-cddl) (when published)

## Contributing

See the [guidelines for contributions](CONTRIBUTING.md).

Contributions can be made by creating pull requests. The GitHub interface supports creating pull requests using the Edit (✏) button.

## Command Line Usage

Formatted text and HTML versions of the draft can be built using `make`.

```sh
$ make
```

Command line usage requires that you have the necessary software installed. See [the instructions](https://github.com/martinthomson/i-d-template/blob/main/doc/SETUP.md).

## Schema Structure

The CDDL schema is modular and organized by credential type:

* `cddl/vlei-cred.cddl` - Main entry point
* `cddl/subsections/` - Credential type subsections
* `imports/said.cddl` - External SAID type definitions
* `examples/` - Example credentials and diagnostics

## External Imports

This project imports CDDL and JSON schemas from upstream repositories:

* **SAID schemas** from [WebOfTrust/ietf-said](https://github.com/WebOfTrust/ietf-said)
  * Auto-detects latest version: `make imports`
  * Regression test specific version: `SAID_CDDL_VERSION_OVERRIDE=0.1.0 make imports`
  * See [imports/README.md](imports/README.md) for details

### Reusable Pattern for Other Projects

The import pattern used here is documented as a template for other projects:
* [Makefile.imports.template](Makefile.imports.template) - Reusable Makefile snippet
* [imports/README.md](imports/README.md) - Full documentation including setup checklist
* See "Template for Other Projects" section in imports/README.md
