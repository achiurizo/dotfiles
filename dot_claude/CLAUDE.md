# User-Level Claude Code Configuration

## Never Commit These Files

HARD BLOCK: Do not `git add` or commit these files under any circumstances.
Warn if attempted.

### Directories

- `docs/plans/` - Planning documents
- `.claude-artifacts/` - LLM working artifacts

### Patterns

- `*-plan.md` - Plan documents
- `*-design.md` - Design documents
- `*-implementation.md` - Implementation docs
- `*.plan.md` - Alternative plan format

These are working documents, not source artifacts.

## Git Conventions

### Commits

- Use conventional commit format (feat:, fix:, chore:, docs:, refactor:, test:)
- Title only - no commit body

### Branch Naming

- Format: `achiurizo-<descriptive-name>`
- Use kebab-case for the descriptive portion
- Examples: `achiurizo-add-user-auth`, `achiurizo-fix-memory-leak`

## Tool Requirements

Use modern CLI tools - legacy equivalents are forbidden:

- `bat` not `cat`
- `fd` not `find`
- `rg` not `grep`
- `eza` not `ls`

### GitHub Operations

Use `gh` CLI for all GitHub interactions:

- PR management: `gh pr create`, `gh pr view`, `gh pr checkout`
- Issues: `gh issue list`, `gh issue view`
- Actions/CI: `gh run list`, `gh run view`, `gh run watch`
- Repository info: `gh repo view`, `gh api`

**Read operations** (view, list, watch) - use freely as needed.
**Write operations** (create, edit, close, merge) - only when explicitly requested.

Use `git` for version control operations (commit, push, pull, branch, merge).

## Testing

Run tests before committing changes. If tests fail:

- Fix the failures before committing, or
- Explicitly inform that tests are failing and why proceeding anyway

Do not commit code that breaks existing tests without acknowledgment.

## Communication Style

Scale verbosity to task complexity:

- **Simple/minimal changes**: Be terse - just do the work, brief confirmation
- **Complex/significant work**: Explain reasoning, show options, provide context

Default to being helpful with context, but don't over-explain trivial operations.
