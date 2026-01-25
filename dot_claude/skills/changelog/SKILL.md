---
name: changelog
description: Generate changelog entries from git history. Use when preparing releases, summarizing work done on a branch, or creating release notes.
---

# Changelog Generation

Generate structured changelog entries from git commit history. Groups changes by type, links PRs/issues, and formats for common changelog standards.

## Process

1. **Determine scope** - Branch comparison, tag range, or date range
2. **Extract commits** - Parse conventional commit format
3. **Group by type** - Features, fixes, breaking changes, etc.
4. **Enrich with context** - Link PRs, extract issue references
5. **Format output** - Keep a Changelog, GitHub Releases, or custom

## Step 1: Determine Commit Range

```bash
# Branch comparison (default: vs main)
git log main..HEAD --oneline

# Between tags
git log v1.0.0..v1.1.0 --oneline

# Since date
git log --since="2024-01-01" --oneline

# Last N commits
git log -n 20 --oneline
```

Ask user if scope is ambiguous.

## Step 2: Extract Commit Information

```bash
# Get structured commit data
git log <range> --pretty=format:'%H|%s|%b|%an|%ae|%aI' --no-merges
```

Parse conventional commit prefixes:

| Prefix | Category | Changelog Section |
|--------|----------|-------------------|
| `feat:` | Feature | Added |
| `fix:` | Bug Fix | Fixed |
| `docs:` | Documentation | Documentation |
| `refactor:` | Refactor | Changed |
| `perf:` | Performance | Performance |
| `test:` | Testing | (omit or Testing) |
| `chore:` | Maintenance | (omit or Maintenance) |
| `BREAKING CHANGE:` | Breaking | Breaking Changes |

## Step 3: Enrich with PR/Issue Context

```bash
# Find PR for commit
gh pr list --search "<commit-sha>" --state merged --json number,title

# Extract issue references from commit messages
# Patterns: #123, fixes #123, closes #123, GH-123
```

## Step 4: Output Formats

### Keep a Changelog (default)

```markdown
## [Unreleased]

### Added
- Add user authentication system (#42)
- Add dark mode toggle (#38)

### Fixed
- Fix memory leak in event handler (#45)

### Changed
- Refactor database connection pooling (#41)

### Breaking Changes
- Remove deprecated `getUser()` API - use `fetchUser()` instead (#40)
```

### GitHub Release Notes

```markdown
## What's Changed

### New Features
* Add user authentication by @author in #42
* Add dark mode toggle by @author in #38

### Bug Fixes
* Fix memory leak in event handler by @author in #45

**Full Changelog**: https://github.com/org/repo/compare/v1.0.0...v1.1.0
```

### Compact (for commit messages)

```
feat: release v1.1.0

- Add user authentication (#42)
- Add dark mode toggle (#38)
- Fix memory leak in event handler (#45)
```

## Step 5: User Interaction

After generating:

1. Present draft changelog
2. Ask if any entries need editing
3. Ask where to save (CHANGELOG.md, clipboard, stdout)
4. Offer to create git tag if releasing

## Options

| Flag | Description |
|------|-------------|
| `--format` | Output format: keepachangelog, github, compact |
| `--since` | Start date or tag |
| `--until` | End date or tag |
| `--include-all` | Include chore/test commits |
| `--breaking-only` | Only show breaking changes |

## Common Mistakes

| Mistake | Instead |
|---------|---------|
| Including merge commits | Use `--no-merges` |
| Missing PR links | Query gh CLI for PR numbers |
| Duplicate entries | Dedupe by PR number |
| Wrong commit range | Confirm range with user first |
