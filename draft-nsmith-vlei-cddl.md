---
title: "Verifiable Legal Entity Identifier (vLEI) CDDL Schema"
abbrev: "vLEI CDDL Schema"
category: std

docname: draft-nsmith-vlei-cddl-latest
submissiontype: IETF
number:
date:
consensus: true
v: 3
keyword:
 - vLEI
 - schema
 - CDDL
 - verifiable credentials
 - legal entity identifiers
venue:
  github: nedmsmith/vlei-cddl

author:
 -
    name: N. Smith
    organization: EntropyWorks LLC
    email: entropyworks@outlook.com

normative:

informative:

...

--- abstract

TODO


--- middle

# Introduction {#intro}

## Scope

## Goals

## Non-Goals


# Conventions and Definitions

{::boilerplate bcp14-tagged}


# Terminology


# vLEI Schema Overview

## Schema Structure

## Data Model

## Extensibility

## Versioning


# CDDL Schema

The CDDL fragments below collectively define the vLEI credential schemas.
The root fragment defines the top-level credential choice; the remaining
fragments define credential-specific properties and the shared identifiers,
node references, and disclaimer types used by those credentials.

## vLEI Credential Types

The top-level vLEI defines the supported vLEI credential types.

~~~ cddl
{::include cddl/vlei-root.cddl}
~~~

## Legal Entity vLEI Credential

The Legal Entity credential defines issuer, subject, edge, and rule blocks.

### Top-level Credential Definition

~~~ cddl
{::include cddl/vlei-root-lei.cddl}
~~~

### Credential Properties

~~~ cddl
{::include cddl/subsections/lei/lei-properties.cddl}
~~~

### Credential Boilerplate

~~~ cddl
{::include cddl/subsections/lei/lei-boilerplate.cddl}
~~~

## Qualified vLEI Issuer Credential

The Qualified vLEI Issuer credential defines attributes and disclaimers for
the issuer qualification credential.

### Top-level Credential Definition

~~~ cddl
{::include cddl/vlei-root-qvi.cddl}
~~~

### Credential Properties

~~~ cddl
{::include cddl/subsections/qvi/qvi-properties.cddl}
~~~

### Credential Boilerplate

~~~ cddl
{::include cddl/subsections/qvi/qvi-boilerplate.cddl}
~~~

## Official Organizational Role vLEI Credential

The Official Organizational Role credential defines role attributes and either
authorization or Legal Entity credential edges.

### Top-level Credential Definition

~~~ cddl
{::include cddl/vlei-root-oor.cddl}
~~~

### Credential Properties

~~~ cddl
{::include cddl/subsections/oor/oor-properties.cddl}
~~~

### Credential Boilerplate

~~~ cddl
{::include cddl/subsections/oor/oor-boilerplate.cddl}
~~~

## Engagement Context Role Credential

The Engagement Context Role credential defines role attributes and either
authorization or Legal Entity credential edges.

### Top-level Credential Definition

~~~ cddl
{::include cddl/vlei-root-ecr.cddl}
~~~

### Credential Properties

~~~ cddl
{::include cddl/subsections/ecr/ecr-properties.cddl}
~~~

### Credential Boilerplate

~~~ cddl
{::include cddl/subsections/ecr/ecr-boilerplate.cddl}
~~~

## OOR Authorization Credential

The Official Organizational Role authorization credential defines the requested
recipient, role, Legal Entity edge, and disclaimer blocks.

### Top-level Credential Definition

~~~ cddl
{::include cddl/vlei-root-oor-auth.cddl}
~~~

### Credential Properties

~~~ cddl
{::include cddl/subsections/oor-auth/oor-auth-properties.cddl}
~~~

### Credential Boilerplate

~~~ cddl
{::include cddl/subsections/oor-auth/oor-auth-boilerplate.cddl}
~~~

## ECR Authorization Credential

The Engagement Context Role authorization credential defines the requested
recipient, role, Legal Entity edge, and disclaimer blocks.

### Top-level Credential Definition

~~~ cddl
{::include cddl/vlei-root-ecr-auth.cddl}
~~~

### Credential Properties

~~~ cddl
{::include cddl/subsections/ecr-auth/ecr-auth-properties.cddl}
~~~

### Credential Boilerplate

~~~ cddl
{::include cddl/subsections/ecr-auth/ecr-auth-boilerplate.cddl}
~~~

## iXBRL Data Value Attestation

The iXBRL Data Value Attestation credential provides attestation of data values
extracted from iXBRL reports, linked to either a vLEI OOR or vLEI ECR credential.

### Top-level Credential Definition

~~~ cddl
{::include cddl/vlei-root-ixbri.cddl}
~~~

### Credential Properties

~~~ cddl
{::include cddl/subsections/ixbri/ixbri-properties.cddl}
~~~

### Credential Boilerplate

~~~ cddl
{::include cddl/subsections/ixbri/ixbri-boilerplate.cddl}
~~~

## Shared Types and Disclaimers

The shared fragment defines identifier types, node and schema references,
and canonical disclaimer text. The SAID type is imported from the IETF SAID
specification.

### SAID Type

The SAID (Self-Addressed Identifier Digest) type is imported from the IETF
SAID specification and supports multiple representation profiles.

~~~ cddl
{::include imports/said.cddl}
~~~

### Core Primitives

Core data type primitives including identifiers, maps, and date-time values
used across all vLEI credentials.

~~~ cddl
{::include cddl/subsections/common/said-map.cddl}
~~~

### Node-Schema Pairs

Schema node pairs for linking credentials to their schemas, with both generic
and credential-specific variants.

~~~ cddl
{::include cddl/subsections/common/node-schema-pair.cddl}
~~~

### Node-Schema Triples

Schema node triples for OOR and ECR authorization credentials, including
operator constraints.

~~~ cddl
{::include cddl/subsections/common/node-schema-triple.cddl}
~~~

### Disclaimer Text Constants

Canonical literal text for disclaimers including usage, issuance, and privacy
considerations.

~~~ cddl
{::include cddl/subsections/common/usage-disclaimer-text.cddl}
~~~

### Disclaimer Objects

Concrete disclaimer object definitions that reference the canonical text
constants.

~~~ cddl
{::include cddl/subsections/common/disclaimer-object.cddl}
~~~


# JSON Schema



# Examples


# Security Considerations {#security}


# Privacy Considerations {#privacy}


# IANA Considerations {#iana}

This document has no IANA actions.

--- back

# Acknowledgments
{:numbered="false"}
