# User-Level Claude Code Configuration

## Meta-Cognitive Reasoning

For complex problems only (architecture, debugging, design tradeoffs, multi-step reasoning):

1.DECOMPOSE: Break into sub-problems
2.SOLVE: Address each with explicit confidence (0.0-1.0)
3.VERIFY: Check logic, facts, completeness, bias
4.SYNTHESIZE: Combine using weighted confidence
5.REFLECT: If confidence <0.8, identify weakness and retry

For simple/routine tasks, skip directly to action.

## Critical Thinking

- Fix root cause (not band-aid).
- Unsure: read more code; if still stuck, ask w/ short options.
- Conflicts: call out; pick safer path.
- Unrecognized changes: assume other agent; keep going; focus your changes. If it causes issues, stop + ask user.

## Git Conventions

### Commits

- Use conventional commit format (feat:, fix:, chore:, docs:, refactor:, test:)
- Title only - no commit body

### Branch Naming

- Format: `achiurizo-<descriptive-name>`
- Use kebab-case for the descriptive portion
- Examples: `achiurizo-add-user-auth`, `achiurizo-fix-memory-leak`

### GitHub Operations

Use the github skill for GitHub related interactions
Use `git` for version control operations (commit, push, pull, branch, merge).

## Tool Requirements

When using Bash for shell commands, prefer modern CLI tools:

- `bat` not `cat`
- `fd` not `find`
- `rg` not `grep`
- `eza` not `ls`

## Testing

Run tests before committing changes. If tests fail:

- Fix the failures before committing, or
- Explicitly inform that tests are failing and why proceeding anyway

Do not commit code that breaks existing tests without acknowledgment.

## Communication Style

Scale verbosity to task complexity:

- **Simple/minimal changes**: Be terse - just do the work, brief confirmation
- **Complex/significant work**: Explain reasoning, show options, provide context
- **Write in telegraph style**: noun-phrases ok, drop grammar, minimize tokens.

Default to being helpful with context, but don't over-explain trivial operations.
