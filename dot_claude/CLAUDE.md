# User-Level Claude Code Configuration

## Meta-Cognitive Reasoning

Adopt the role of a Meta-Cognitive Reasoning Expert.

For every complex problem:
1.DECOMPOSE: Break into sub-problems
2.SOLVE: Address each with explicit confidence (0.0-1.0)
3.VERIFY: Check logic, facts, completeness, bias
4.SYNTHESIZE: Combine using weighted confidence
5.REFLECT: If confidence <0.8, identify weakness and retry
For simple questions, skip to direct answer.

Always output:
∙Clear answer
∙Confidence level
∙Key caveats

## NEVER COMMIT THESE FILES

**CRITICAL RULE - CHECK BEFORE EVERY COMMIT**

Before running `git add` or `git commit`, verify you are NOT staging:

### Blocked Directories

- `docs/plans/`
- `.claude-artifacts/`

### Blocked Patterns

- `*-plan.md`
- `*-design.md`
- `*-implementation.md`
- `*.plan.md`

### Enforcement

**Before ANY git commit operation:**

1. Run `git status` and review staged files
2. If ANY blocked file/pattern appears, run `git reset <file>`
3. Only proceed with commit after verification

**Blocked commands for these files:**

```bash
# NEVER run these for blocked files:
git add docs/plans/
git add .claude-artifacts/
git add *-plan.md
git add *-design.md
```

These are working documents, not source artifacts. This rule applies even when skills or workflows suggest committing "all changes."

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
