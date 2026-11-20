# Recommendations for WebOfTrust/ietf-said Repository

This document captures lessons learned from vlei-cddl's integration with ietf-said, with recommendations to make future integrations easier.

## Current Integration Status

✅ **Working Pattern**: vlei-cddl successfully imports SAID schemas with:
- Version-pinned downloads (cddl-0.1.1, jsons-0.1.1)
- Auto-detecting Makefile (no manual version updates needed)
- Regression testing support (environment variable overrides)

## Challenges Encountered

1. **Finding correct releases**: Required discovery that CDDL and JSON had separate release tags
2. **Version mismatch confusion**: CDDL at 0.1.1, JSON initially missing 0.1.1
3. **Release discoverability**: Had to check GitHub releases manually to find correct URLs
4. **Coordinating versions**: Downstream projects need to know which versions go together

## Recommended Improvements to ietf-said

### 1. Release Tag Naming Convention (CRITICAL)
**Current**: Separate release tags per artifact type (cddl-X.Y.Z, jsons-X.Y.Z)
**Recommendation**: Standardize and document clearly

**Option A** (Recommended): Use consistent core versions
```
Release: v0.1.1
  Assets:
    - said.cddl (from cddl-0.1.1 release)
    - said.schema.json (from jsons-0.1.1 release)
    - MANIFEST or versions.json listing included versions
```

**Option B**: Include a `.said-versions.json` in releases
```json
{
  "said": {
    "version": "0.1.1",
    "cddl": "0.1.1",
    "jsons": "0.1.1"
  },
  "published": "2024-01-19"
}
```

### 2. Release Notes (HIGH PRIORITY)
Every release should clearly state:
- Which artifact types are included
- Version numbers for each artifact (cddl, jsons, etc.)
- Compatibility notes
- Breaking changes (if any)
- Recommended usage patterns

**Example release note template**:
```
## ietf-said Release v0.1.1

### Included Artifacts
- **CDDL** (cddl-0.1.1): `said.cddl`
- **JSON Schema** (jsons-0.1.1): `said.schema.json`

### Compatibility
- CDDL v0.1.1 and JSON v0.1.1 are compatible
- Upgrade from 0.1.0: See CHANGELOG for breaking changes

### For Downstream Projects
Download with:
```bash
# CDDL
curl -L https://github.com/WebOfTrust/ietf-said/releases/download/cddl-0.1.1/said.cddl

# JSON Schema
curl -L https://github.com/WebOfTrust/ietf-said/releases/download/jsons-0.1.1/said.schema.json
```
```

### 3. Versioning Documentation (HIGH PRIORITY)
Add to main repository README:

```markdown
## Versioning Strategy

Each artifact (CDDL, JSON Schema) has its own version stream:
- **CDDL**: Released under tags like `cddl-X.Y.Z`
- **JSON Schema**: Released under tags like `jsons-X.Y.Z`

Major version updates typically stay in sync, but patch versions may differ.

### Finding Compatible Versions
Check release notes or `.said-versions.json` in each release to find compatible versions.

### Recommended Downloads
```

### 4. CHANGELOG (MEDIUM PRIORITY)
Maintain a CHANGELOG.md documenting:
- Version history of each artifact
- When CDDL versions were released
- When JSON versions were released
- Compatibility matrix

**Example**:
```
## CDDL Versions
- 0.1.1 (2024-01-19): Minor fixes
- 0.1.0 (2024-01-10): Initial release

## JSON Schema Versions
- 0.1.1 (2024-01-19): Synced with CDDL 0.1.1
- 0.1.0 (2024-01-10): Initial release

## Compatibility Matrix
| CDDL  | JSON Schema | Status |
|-------|-------------|--------|
| 0.1.1 | 0.1.1       | ✅ Compatible |
| 0.1.0 | 0.1.0       | ✅ Compatible |
```

### 5. API/Artifact Stability Guarantees (LOW PRIORITY)
Document semver promises:
- **Major**: Breaking changes to SAID type definitions
- **Minor**: New types or features added
- **Patch**: Bug fixes

---

## What Downstream Projects Need to Know

### Setup Phase
1. ✅ What repository/org hosts the schemas
2. ✅ Release tag naming convention (cddl-X.Y.Z, jsons-X.Y.Z)
3. ✅ Which versions are compatible with each other
4. ✅ Example curl commands for each artifact type

### Maintenance Phase
1. ✅ When new versions are released
2. ✅ Release notes documenting changes
3. ✅ Breaking change warnings
4. ✅ Regression test guidance

---

## Summary of Changes for ietf-said Maintainers

**Must Have** (blocks downstream adoption):
- [ ] Document release tag naming convention (cddl-X.Y.Z, jsons-X.Y.Z)
- [ ] Release notes showing which artifacts included in each version
- [ ] Example curl commands in README for each artifact type

**Should Have** (makes integration smoother):
- [ ] `.said-versions.json` manifest in releases
- [ ] CHANGELOG.md with artifact version history
- [ ] Compatibility matrix documentation

**Nice to Have** (reduces friction):
- [ ] GitHub action to publish versions manifest
- [ ] Automated compatibility testing between artifact versions
- [ ] Semantic versioning documentation

---

## Lessons Learned for All Schema/Artifact Repositories

This pattern can help any project providing multiple artifact types from a single repository:

1. **Separate but coordinated releases**: Document how they relate
2. **Version discovery**: Make latest versions easy to find
3. **Downstream documentation**: Include setup examples for common platforms
4. **Regression testing**: Support version pinning for maintenance projects
5. **Automated integration**: Provide version manifests that tools can parse

---

## Next Steps for vlei-cddl

- [ ] Add GitHub Actions workflow that checks for new ietf-said releases
- [ ] Document regression testing process
- [ ] Share this template with other CDDL schema projects
