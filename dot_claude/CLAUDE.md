
# Slack Integration Reference
## Commit Message Format
When creating commits and PRs, always append this to the end of the commit message:
Co-Authored-By: Claude <svc-devxp-claude@slack-corp.com>

Example:
```
fix: Update widget display logic

Co-Authored-By: Claude <svc-devxp-claude@slack-corp.com>
```

IMPORTANT: Use 'bd' for task tracking
Do not use TodoWrite. Use bd (beads) for any task tracking needs.

# When to Use Beads (bd) for Task Tracking

Beads is external memory for AI agents, solving the "dementia problem" where context is lost across sessions or after compaction.

## Default to beads when:
- **Discovered work**: You find a sub-problem or dependency issue that needs tracking (e.g., "DateTime has missing SwiftExtensions dependency")
- **Multi-step investigations**: Findings need to persist across potential session boundaries
- **Why not just what**: The reasoning behind a decision matters for future context
- **Follow-up work**: Tasks that aren't blocking current work but shouldn't be forgotten
- **Complex refactors**: Multi-phase work where "DONE" on phase 3 shouldn't mean forgetting phases 4-6

## Skip beads when:
- Single, simple task that completes in minutes
- Purely reactive work following explicit user instructions
- No discovered sub-problems or follow-up needed

## Key insight
If you're about to write something like "Note: we should also..." or "Future improvement:", that's a bead. Don't let it get lost in chat history.

# Git Configuration
## GPG Signing
Use `--no-gpg-sign` when committing (GPG pinentry doesn't work well in this terminal context).

# Obsidian Long-Term Memory

Use the Obsidian MCP as persistent memory for project-specific knowledge. This survives across sessions and context compaction.

## Directory Structure
Store project memories in: `Claude Memory/<project-name>/`

## Proactive Memory Check
At the START of any conversation involving code work:
1. Identify the project from the working directory
2. Check if `Claude Memory/<project-name>/` exists using obsidian_list_files_in_dir
3. If it exists, read the relevant files before proceeding
4. Reference this knowledge naturally - don't announce "I'm checking memory"

## What to Capture

For large codebase work, prioritize:

**Architecture & Navigation**
- Module boundaries and ownership
- Where specific functionality lives (and why)
- Key abstractions and how they connect
- "To do X, you need to touch Y and Z"

**Build & Tooling**
- Build system patterns and quirks
- Common build errors and fixes
- Test execution patterns
- CI/CD considerations

**Patterns & Conventions**
- Team/codebase coding patterns
- Naming conventions
- Error handling approaches
- How similar problems were solved before

**Landmines & Gotchas**
- Things that look right but break subtly
- Non-obvious dependencies
- Migration states (old vs new patterns)
- "Never do X because Y"

**Investigation History**
- Past debugging sessions and conclusions
- Root causes that were hard to find
- Useful debugging techniques for this codebase

## When to Write - IMPORTANT: Be Proactive
**Write to Obsidian WITHOUT being asked.** Don't wait for the user to prompt you. If you learned something worth remembering, write it immediately.

- When the user corrects you or expresses a preference
- After discovering a non-obvious pattern or gotcha
- After completing investigations (capture the trail)
- When you learn codebase-specific knowledge that future sessions would benefit from
- After touching unfamiliar parts of the codebase
- **At the END of significant problem-solving sessions** - capture what you learned before context is lost

## Writing Guidelines
- Append to existing files (obsidian_append_content)
- Date-stamp entries: `## 2026-01-12: <topic>`
- Be concise - reference material, not documentation
- Focus on "why" and "where" - the code shows "what"
- Include file paths when referencing specific locations

## Bazel
- **IMPORTANT**: Never perform a `clean` under any circumstances.
