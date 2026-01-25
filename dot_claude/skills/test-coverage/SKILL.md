---
name: test-coverage
description: Analyze test coverage and suggest missing tests. Use when reviewing test quality, before refactoring, or when adding tests to existing code.
---

# Test Coverage Analysis

Analyze existing test coverage, identify gaps, and generate targeted test suggestions. Focuses on meaningful coverage, not just line percentages.

## Core Philosophy

- **Coverage is a tool, not a goal** - 100% coverage with bad tests is worse than 70% with good tests
- **Test behavior, not implementation** - Tests should verify what code does, not how
- **Prioritize risk** - Focus on critical paths, edge cases, error handling

## Process

1. **Run coverage report** - Get current metrics
2. **Identify gaps** - Find untested code
3. **Prioritize by risk** - Rank what matters most
4. **Suggest tests** - Provide specific test cases
5. **Optionally generate** - Write the tests if requested

## Step 1: Run Coverage Analysis

Detect the project's test framework and run coverage with appropriate tooling. Look for existing coverage config in project files.

## Step 2: Identify Coverage Gaps

Parse coverage output to find:

| Gap Type | Priority | Example |
|----------|----------|---------|
| Uncovered functions | High | Entire function never called |
| Uncovered branches | High | If/else paths not tested |
| Uncovered error paths | Critical | Catch blocks, error returns |
| Uncovered edge cases | Medium | Empty arrays, null values |
| Uncovered integrations | Medium | External API calls |

### Reading Coverage Reports

Focus on:
- Files < 80% statement coverage
- Files < 70% branch coverage
- Critical business logic with any gaps

## Step 3: Prioritize by Risk

Rank uncovered code by impact:

| Risk Level | Characteristics | Action |
|------------|-----------------|--------|
| Critical | Auth, payments, data mutation | Must test |
| High | Core business logic, public APIs | Should test |
| Medium | Utilities, helpers, internal APIs | Test if time |
| Low | Logging, formatting, dev tools | Optional |

### Risk Assessment Questions

1. What happens if this code fails in production?
2. How often is this code path executed?
3. Has this code caused bugs before?
4. Is this code complex or simple?

## Step 4: Suggest Specific Tests

For each gap, provide:

```markdown
### Gap: `validatePayment()` lines 24-35

**What's untested:** Card expiration validation and CVV format check

**Risk:** High - Payment validation bugs could allow invalid transactions

**Suggested tests:**

1. `should reject expired cards`
   - Input: card with past expiration date
   - Expected: ValidationError with code CARD_EXPIRED

2. `should reject invalid CVV format`
   - Input: CVV with letters, CVV too short, CVV too long
   - Expected: ValidationError with code INVALID_CVV

3. `should accept valid card details`
   - Input: valid card number, future expiration, 3-digit CVV
   - Expected: returns validated payment object
```

## Step 5: Test Generation (Optional)

If user requests, generate tests following project conventions:

### Detect Test Patterns

Find existing test files and analyze:
- Testing framework
- Assertion style
- Mocking approach
- Test organization

### Generate Following Conventions

Match existing style:
- File naming patterns
- Import patterns
- Describe/it nesting
- Setup/teardown patterns
- Mocking style

## Output Format

```markdown
## Coverage Analysis: src/auth/

**Current Coverage:** 67% statements, 52% branches

### Critical Gaps (must address)

| Location | Gap | Risk |
|----------|-----|------|
| `validateToken:18-24` | Token expiration check | Auth bypass |
| `refreshToken:45-52` | Error handling | Silent failures |

### Suggested Tests

[Specific test suggestions with inputs/outputs]

### Lower Priority Gaps

- `formatError:88-92` - Logging format (Low risk)
- `debugLog:101-105` - Dev tooling (No risk)

## Next Steps

Would you like me to:
1. Generate all suggested tests
2. Focus on critical gaps only
3. Explain any specific gap in more detail
```

## Common Patterns to Test

| Pattern | What to Test |
|---------|--------------|
| Validation | Valid input, each invalid case, edge cases |
| CRUD | Create, read, update, delete, not found |
| Auth | Valid creds, invalid creds, expired, permissions |
| API calls | Success, network error, timeout, bad response |
| State machines | Each state, each transition, invalid transitions |
| Calculations | Normal cases, zero, negative, overflow, precision |

## IDE Integration (Neovim)

When connected to Neovim, leverage LSP for enhanced coverage analysis:

### Available IDE Tools

| Tool | Purpose |
|------|---------|
| `mcp__ide__getDiagnostics` | Get LSP errors/warnings from editor |

### Usage for Coverage Analysis

1. **Find problem areas** - Files with LSP warnings often need more tests
   ```
   getDiagnostics()  # Check all open files
   ```

2. **Identify untested error paths** - LSP can reveal:
   - Nullable values that need null-check tests
   - Unused code paths (potential dead code or missing tests)
   - Type narrowing gaps

3. **Validate test files** - Check test files for:
   - Type errors in mocks
   - Assertion type mismatches
   - Missing imports

### Diagnostic-Driven Test Priorities

| LSP Diagnostic | Test Priority |
|----------------|---------------|
| Possible null/undefined | High - add null case tests |
| Unreachable code | Medium - verify intentional or add path tests |
| Unused parameter | Low - check if test coverage would use it |
| Type assertion | High - test the asserted type boundaries |

## Integration with Other Skills

- **refactor**: Run coverage before refactoring to ensure safety net
- **systematic-debugging**: Check if failing code has test coverage
- **local-review**: Flag low-coverage code in reviews
