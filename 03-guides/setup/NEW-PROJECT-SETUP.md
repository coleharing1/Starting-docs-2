# New Project Setup (Manual, Copy-Paste Prompts)

This guide walks you through creating all core project documents manually using Cursor. It combines the clarity of a strict order (context → decisions → rules → phases) with copy‑paste prompts you can run one by one. No scripts or automation are required.

If a step is not applicable to your project, skip it. Optional tasks are marked as Optional.

## Prerequisites
- Tools: Cursor (Pro recommended), Git, Node 18+, a GitHub repo
- Best Practices: files < 500 lines; descriptive names; TSDoc/JSDoc for exported APIs
- AI Rules: modular `.cursor/rules/` (see `01-templates/ai-config/.cursor/`)

## Folder References
- Templates: `01-templates/project-docs/*-TEMPLATE.md`
- Phases: `01-templates/phases/`
- Checklists: `01-templates/checklists/`
- ADRs: `01-templates/adr/`
- AI Rules: `01-templates/ai-config/`
- Guides: `03-guides/**`
- Examples: `02-examples/**`

---

## Step 0 – Initialize Repo and Brainstorm (User Action)
- Create a new empty repository on GitHub.
- Clone it locally and open in Cursor.
- Create `project_brainstorm/` and add initial notes: `initial-ideas.md`, `requirements.md`, `user-stories.md` (Optional), `competitor-analysis.md` (Optional).

Prompt (optional helper to summarize brainstorm into bullets):
```
Read all files in project_brainstorm/. Summarize key goals, target users, and constraints as 5-10 bullets for use in future docs.
```

---

## Step 1 – Create `project-overview.md`
Prompt:
```
Using project_brainstorm/ and the template @01-templates/project-docs/PROJECT-OVERVIEW-TEMPLATE.md, generate _docs/project-overview.md.
Follow the template sections and keep it 300–800 words.
Ask clarifying questions instead of assuming.
```

---

## Step 2 – Create `user-flow.md`
Prompt:
```
Using @_docs/project-overview.md, create _docs/user-flow.md mapping user journeys:
- Landing → discovery
- Authentication (email + OAuth optional) with edge cases
- Core interactions (list/detail/create/edit/delete flows)
- Settings & profile
- Errors & recovery
Use Mermaid diagrams where helpful.
```

---

## Step 3 – Decide and Document `tech-stack.md`
Prompt 1 (options):
```
Using @_docs/project-overview.md and @_docs/user-flow.md, recommend a tech stack.
For each category, provide: default + one alternative + tradeoffs.
Categories: language, frontend framework/router, styling, component library, state/data fetching, dev DB/ORM, prod DB/auth, deployment, testing.
Use SQLite (dev) → Supabase (prod) as a suggested path, with an alternative if needed.
```
Prompt 2 (finalize):
```
Produce @_docs/tech-stack.md using @01-templates/project-docs/TECH-STACK-TEMPLATE.md.
Include a Migration Strategy (SQLite → Supabase) and Environment Variables section.
```
References: `03-guides/setup/DATABASE-OVERVIEW.md`, `03-guides/setup/DEPLOYMENT-GUIDE.md`.

---

## Step 4 – Create UI Standards: `ui-rules.md` and `theme-rules.md`
Prompt:
```
Using @_docs/project-overview.md, @_docs/user-flow.md, and @_docs/tech-stack.md:
- Generate @_docs/ui-rules.md based on @01-templates/project-docs/UI-RULES-TEMPLATE.md
- Generate @_docs/theme-rules.md based on @01-templates/project-docs/THEME-RULES-TEMPLATE.md
Ensure WCAG 2.2 AA and include Tailwind examples where appropriate.
```
Optional: review `02-examples/themes/TAN-THEME-RULES.md` for reference.

---

## Step 5 – Project Conventions: `project-rules.md`
Prompt:
```
We need an AI-first codebase: modular, searchable, and readable.
Using @_docs/tech-stack.md, @_docs/user-flow.md, @_docs/project-overview.md, @_docs/ui-rules.md, and @_docs/theme-rules.md,
create @_docs/project-rules.md from @01-templates/project-docs/PROJECT-RULES-TEMPLATE.md.
Cover directory structure (app/components/lib/hooks/types/styles), naming conventions, code style, and files < 500 lines.
```

---

## Step 6 – Optional Docs (skip if not applicable)
- API rules: `@01-templates/project-docs/API-RULES-TEMPLATE.md` → `_docs/api-rules.md`
- Testing rules: `@01-templates/project-docs/TESTING-RULES-TEMPLATE.md` → `_docs/testing-rules.md`
- UI/Pages checklists: `@01-templates/checklists/KEY-FEATURES-TEMPLATE.md`, `@01-templates/checklists/PAGES-URLS-TEMPLATE.md`
- ADRs: `@01-templates/adr/ADR-TEMPLATE.md` for key decisions

Prompts:
```
Using @_docs/project-overview.md and @_docs/tech-stack.md, create @_docs/api-rules.md from @01-templates/project-docs/API-RULES-TEMPLATE.md.
```
```
Using @_docs/project-overview.md and @_docs/project-rules.md, create @_docs/testing-rules.md from @01-templates/project-docs/TESTING-RULES-TEMPLATE.md.
```
```
Create @_docs/key-features-checklist.md and @_docs/pages-urls-status.md using templates in 01-templates/checklists/ and fill initial items from @_docs/user-flow.md.
```
```
Create an ADR markdown file in _docs/adrs/ for any decision that will shape architecture for weeks/months.
```

---

## Step 7 – Phases (`_docs/phases/`)
Prompt:
```
Create _docs/phases/phase-0-setup.md through phase-5-production-supabase.md using templates in 01-templates/phases/.
Tailor checklists to this project. Keep each task specific, ordered, and 5–30 minutes in scope.
```
References: `01-templates/phases/`.

---

## Step 8 – AI Rules & Context
- Copy `01-templates/ai-config/.cursor/` into your project’s `.cursor/` and adjust as needed.
- Create a `CLAUDE.md` in your project root using `01-templates/ai-config/CLAUDE.md` as a seed.

Prompt:
```
Read @_docs/* and generate a first version of CLAUDE.md containing: tech stack, current phase, recent changes, conventions, and reminders.
```
References: `03-guides/setup/CURSOR-RULES-SETUP-GUIDE-2025.md`.

---

## Step 9 – CI/CD and Deployment (Optional)
- Use `03-guides/setup/DEPLOYMENT-GUIDE.md` to configure Vercel + Supabase.
- Optionally enable Snyk per `03-guides/setup/SNYK-SETUP-GUIDE.md`.

Prompt:
```
Generate a minimal .github/workflows/ci.yml with jobs for type-check, lint, test, and build.
```

---

## Step 10 – Project History
Create `_docs/project-history.md` and update every 5–10 file changes.

Prompt:
```
Create _docs/project-history.md with an initial entry summarizing the setup and decisions so far. Keep entries short (3–5 bullets) and reverse chronological.
```
Reference: `03-guides/maintenance/PROJECT-HISTORY-INS.md`.

---

## Final Checks
- All core docs exist in `_docs/` and cross-reference each other
- Prompts used from `03-guides/workflow/prompts/`
- Optional docs created if applicable (API/testing rules, ADRs, checklists)
- Phases tailored with specific tasks
- AI rules configured; `CLAUDE.md` created

You’re ready to begin implementation with Phase 0.
