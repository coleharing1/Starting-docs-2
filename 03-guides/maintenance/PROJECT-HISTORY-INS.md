Project History Log
Overview
The Project History Log is a chronological summary of commits and changes, providing context for LLMs (or yourself) when context windows are limited or sessions restart. It condenses git history into readable prose, highlighting what was added/fixed/removed, why, and impacts. This prevents "reinventing the wheel" and helps debug by tracing evolution. For beginners, it's a narrative journal of progress.

Format as a markdown file (project-history.md) in your _docs/. Append entries reverse-chronologically (newest first). Each entry includes date, commit summary, changes, and rationale.

Instructions for Use and Maintenance
Creation: Initialize with an empty log or first entry (e.g., "Project Init"). Prompt AI after setup: "Create project-history.md with initial entry for repo creation."
Structure Example:
July 12, 2025 - Commit: abcdef1 (Initial Setup)
Summary: Bootstrapped project from template; added _docs/ folder and placeholders.
Changes:
Added: project-overview.md, setup.sh.
Modified: package.json with deps.
Removed: None.
Rationale/Impact: Establishes foundation per @START-HERE.md and PROMPTS docs; enables quick starts with AI prompts.
Related: Ref @project-overview.md; Tests: Passed locally.
Older Entry - Commit: ...
...
Maintenance:
Update After Commits: After git commit, prompt AI: "Summarize this commit [git log output or description] and append to @project-history.md in reverse-chron order."
Automation: Use git hooks (Husky) to trigger AI summary (e.g., post-commit script prompts Cursor Chat).
Pruning: If log grows long (>50 entries), archive old ones or summarize quarters.
LLM Context: When querying AI, attach: "Reference @project-history.md for past changes."
Tips for Beginners: Keep summaries concise (3-5 bullets). Use this to reflect: "What worked well?" If context lost, prompt "Based on @project-history.md, suggest fixes for [issue]." Integrate with Git—copy commit messages as starters.