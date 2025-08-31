# Manual New Project Setup

This manual flow replaces automation. Follow these steps one at a time. It mirrors the order in which documents and context should be created so each step naturally builds on the previous.

## Recommended document order

1. `project-overview.md`
   - Establish purpose, scope, goals.
2. `user-flow.md`
   - Map user journeys (landing, onboarding, navigation, redirects, errors).
3. `tech-stack.md`
   - Describe chosen technologies and their roles; include alternatives.
4. `ui-rules.md`
   - Visual and interaction guidelines (hierarchy, consistency, feedback).
5. `theme-rules.md`
   - Colors, typography, spacing, shadows; accessible contrast.
6. `project-rules.md`
   - Folder structure, naming, code style, file size limits (<500 lines).
7. `_docs/phases/` (subdirectory)
   - Phase documents (0–5) with detailed, actionable checklists.

## Prompts to create each document

- Create `user-flow.md` from `project-overview.md`:
```
Use @project-overview.md to create user-flow.md defining the end-to-end user journey, including edge cases.
Ask clarifying questions instead of assuming.
```

- Recommend a stack and finalize `tech-stack.md`:
```
Using @project-overview.md and @user-flow.md, recommend a stack optimized for a docs-first, frontend-first workflow.
For each category, propose an industry standard and one popular alternative.
Then output the final tech-stack.md once selections are made.
```

- Expand `tech-stack.md` with best practices:
```
Update @tech-stack.md with best-practices, limitations, conventions, and common pitfalls for each chosen tool.
```

- Generate `ui-rules.md` and `theme-rules.md`:
```
Use @project-overview.md, @user-flow.md, and @tech-stack.md to create ui-rules.md (design principles) and theme-rules.md (tokens and examples).
Ensure WCAG 2.2 AA or better.
```

- Create `project-rules.md`:
```
We are building an AI-first codebase: modular, scalable, searchable.
Files must be <500 lines with @fileoverview and TSDoc where appropriate.
Using @tech-stack.md, @user-flow.md, @project-overview.md, @ui-rules.md, and @theme-rules.md, create project-rules.md with directory structure, naming conventions, and code style.
```

- Create phase docs in `_docs/phases/`:
```
Define phases 0–5. Each phase doc includes scope, deliverables, and a detailed table of tasks with dependencies and estimates.
Focus on shipping a functional product at the end of each phase.
```

## Where to find templates and prompts

- Templates: `01-templates/project-docs/*-TEMPLATE.md`
- Phase templates: `01-templates/phases/`
- Prompts: `03-guides/workflow/prompts/`
- Audits: `03-guides/maintenance/audits/`

## Notes
- Prefer small, iterative commits; update `_docs/project-history.md` every 5–10 file changes.
- Avoid automation for setup; run tools and installs explicitly when you need them.
