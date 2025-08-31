### TL;DR
- Most P0/P1 fixes are implemented (modular Cursor rules, missing phase docs, CI/Deployment hardening, Snyk guide, package template rename).
- Remaining gaps: a few stale references, non‑interactive support in setup.sh, checklist template table formatting, template naming normalization, markdown linting, and the “generalize to multi‑stack” track (rules/modules, profiles, generic MCP, setup split).
- The plan makes sense: it reduces confusion (versioning), prevents AI context bloat (modular rules), removes dead-ends (phase docs), hardens the setup path, and broadens the kit beyond a single stack.

### P0 — Critical
- Standardize framework versions or make docs version‑agnostic
  - Status: Not done. Generator text and example manifest diverge (Next.js 15+ vs Next 14.2.0/React 18.3.0). Update generator wording to “current LTS” or align versions across docs and `package.template.json`.
  - Evidence:
```308:314:Starting-Documents/setup.sh
## Tech Stack
- Next.js 15+ with App Router
- TypeScript
- Tailwind CSS + shadcn/ui
```
```35:38:Starting-Documents/package.template.json
"next": "^14.2.0",
"react": "^18.3.0",
"react-dom": "^18.3.0",
```
- Modernize Cursor rules to 2025 modular architecture
  - Status: Done. Index not alwaysApply, core/context alwaysApply, modules with proper `globs`, `priority`, `context_limit`. Evidence:
```1:24:Starting-Documents/01-templates/ai-config/.cursor/rules.mdc
---
description: "Index of modular rules - documentation only"
alwaysApply: false
priority: "low"
version: 1.0.0
---
```
```1:26:Starting-Documents/01-templates/ai-config/.cursor/rules/000-core.mdc
---
description: "Minimal universal rules - keep under 100 lines for performance"
alwaysApply: true
priority: "critical"
version: 1.0.0
tags: ["core", "universal"]
context_limit: 100
---
```
- Fix broken references and add missing phase templates
  - Status: Partially done.
    - Added: `phase-3-backend-sqlite.md`, `phase-4-testing-polish.md`, `phase-5-production-supabase.md` ✅
    - Still outdated references:
      - `README.md` tells users to “Start with GROK-NEW-PROJECT-SETUP.md” (file not present):
```43:46:Starting-Documents/README.md
- **Follow the Guide**: Start with GROK-NEW-PROJECT-SETUP.md for step-by-step prompts to generate your project's docs.
```
      - `START-HERE.md` still lists a non-existent `PHASE-0-CHECKLIST-TEMPLATE.md`:
```31:35:Starting-Documents/START-HERE.md
**checklists/** - Progress tracking templates:
- `PHASE-0-CHECKLIST-TEMPLATE.md` - Detailed setup checklist
```
- Harden `setup.sh` for reliability and non-interactive usage
  - Status: Partially done.
    - Good: Replaced brittle json CLI edits with Node script; Playwright note added; installs are split correctly; Prisma client installed as a runtime dep in the generated project.
    - Missing: Non-interactive mode (env var/flag); current script prompts and fails if empty:
```21:26:Starting-Documents/setup.sh
read -p "📝 Enter project name (kebab-case): " PROJECT_NAME
if [ -z "$PROJECT_NAME" ]; then
    echo "❌ Project name is required"
    exit 1
fi
```
- Split overlong GROK guide
  - Status: Done (the large guide is split; `START-HERE.md` is <500 lines, with the rest distributed across guides).
- Normalize workflow file names and label speculative content
  - Status: Done. “AI-Workflow-Combined.md” normalized; Gemini CLI doc clearly labeled theoretical:
```1:8:Starting-Documents/03-guides/workflow/Ai-workflow-Gemini-CLI.md
# This is a theoretical exploration—do not treat as current functionality. This document analyzes ...
```
  - Note: Consider renaming `Ai-workflow-Gemini-CLI.md` → `AI-Workflow-Gemini-CLI.md` for casing consistency.
- Clarify templates vs generated files
  - Status: Done. `README.md`’s structure sections cleanly separate “Contained here” vs “Generated in your new project.”

### P1 — High
- Consolidate MCP naming to a single package
  - Status: Done. The guide consistently uses `@supabase/mcp-server-supabase`.
- Expand DEPLOYMENT-GUIDE with troubleshooting/rollback
  - Status: Done. Pre-deploy checks, error tables, rollback flows present.
- Move/rename example `package.json`
  - Status: Done as `package.template.json` with explicit “template” header.
- Fix formatting in DATABASE-OVERVIEW.md
  - Status: Done (clean and coherent now).
- Document Snyk setup (optional)
  - Status: Done. Dedicated guide present; CI includes Snyk step (optional).
  - Follow-up: Ensure `SNYK_TOKEN` is optional in CI and `security` job continues-on-error for convenience (already configured).

### P2 — Medium
- Fix formatting in checklist templates (valid markdown tables)
  - Status: Not done.
    - `PAGES-URLS-TEMPLATE.md` example table isn’t a valid pipe table:
```13:17:Starting-Documents/01-templates/checklists/PAGES-URLS-TEMPLATE.md
Page/Route	URL	Description	Status	Notes/Links
Landing Page	/	Welcome screen with login/signup.	In Progress	Ref @user-flow.md; UI in @components/Landing.tsx.
```
    - `KEY-FEATURES-TEMPLATE.md` uses narrative bullets instead of a proper table; could benefit from a checklist table.
- Add markdown linting to docs workflow; optional pre-commit
  - Status: Not done. No markdownlint config or CI step present.
  - Addition: Add `.markdownlint.json` with a minimal ruleset; update CI to run `npx markdownlint '**/*.md'`.
- Document optional vs essential dependencies
  - Status: Not done. Tech stack and `setup.sh` install a wide set by default (Radix/shadcn breadth). Suggest segmenting core vs optional (use shadcn add-on flow).
- Provide a minimal “Start Here” nav index
  - Status: Mostly done. `START-HERE.md` is a short kickoff; you might add a 10-minute “do these 3 prompts + links” summary at the top.
  - Addition: Replace stale references in `README.md` (GROK file) and `START-HERE.md` (PHASE-0-CHECKLIST-TEMPLATE.md → phase-0-setup.md).
- Normalize naming across templates to `-TEMPLATE.md`
  - Status: Not done. Many are `*-TEMP.md` (`PROJECT-RULES-TEMP.md`, `UI-RULES-TEMP.md`, etc.).
- Add `fix-structure.sh` helper script
  - Status: Not done.
  - Scope: Normalize `*-TEMP.md` → `*-TEMPLATE.md`, optionally rename speculative workflow docs, run markdownlint, validate rules index and always-apply counts.
- Create validation runbook/script
  - Status: Not done (`VALIDATION.md` or `validate-kit.sh`).
  - Checks: required files exist, no stale references, files < 500 lines, `.cursor/rules` structure valid, CI files present, scripts executable.
- Add migration guide for existing users
  - Status: Not done.
- Create `CHANGELOG.md`
  - Status: Not done.

### Generalization for multi‑stack Cursor projects
- P0 — De‑specificize core docs and rules
  - Status: Partially done. Much is LTS/generic, but Next-specific bias remains across README/stack/templates (acceptable if you keep a “Next profile,” but the plan aims for a neutral core).
- Expand modular rules beyond React/Node
  - Status: Not done. Index lists `python.mdc` as an optional module, but that file isn’t present:
```18:24:Starting-Documents/01-templates/ai-config/.cursor/rules.mdc
### Optional Modules (`rules/modules/`)
- `frontend-react.mdc` - React/Next.js frontend patterns
- `backend-node.mdc` - Node.js/Express/Fastify API rules
- `python.mdc` - Python-specific rules (e.g., FastAPI/Flask)
- `testing.mdc` - Test requirements and best practices
- `docs.mdc` - Documentation standards
```
- P1 — Introduce profiles and variant phases
  - Add `profiles/` and move Next-specific content under that
    - Status: Not done.
  - Provide phase variants (App/API/CLI/Library/Docs)
    - Status: Not done (no `INDEX.md`/variants).
  - MCP docs generalization (rename current; add generic)
    - Status: Not done. Only `MCP-SETUP-GUIDE.md` (Supabase-specific) exists.
- P2 — Scripts/prompts/options breadth
  - Generalize setup scripts (rename current; add `bootstrap-docs.sh`)
    - Status: Not done.
  - Add choice prompts; mark optional sections in prompts
    - Status: Not done (prompts still assume web UI stack).
  - Broaden options in `TECH-STACK/PROJECT-RULES/DEPLOYMENT`
    - Status: Partially done; still mostly Next/Vercel-centric.
- P3 — Low
  - Add more example themes
    - Status: Not done (`TAN` only).
  - Add “authoring voice” notes in instruction-style templates
    - Status: Not done (inconsistent author/audience voice across templates).

### Why this plan makes sense
- Version standardization avoids setup drift and “why does my version differ?” confusion.
- Modular Cursor rules are essential to prevent context bloat and ensure the AI follows only relevant rules.
- Fixing references and providing phase docs removes dead-ends and keeps the workflow linear.
- Hardening the setup path eliminates first-run breakages and supports non-interactive CI/demos.
- Normalizing templates and adding linting fosters consistency (important for AI tooling).
- Generalization (profiles, modules) lets you use the same kit across multiple stacks without losing the Next.js sweet spot.

### What’s left (actionable)
- Stale references
  - Replace `README` “GROK-NEW-PROJECT-SETUP.md” line; point to `START-HERE.md` and `PROMPTS-*.md`.
  - Replace `START-HERE`’s `PHASE-0-CHECKLIST-TEMPLATE.md` with the real `phase-0-setup.md`.
- setup.sh improvements
  - Add non-interactive mode: respect `PROJECT_NAME` env var; default when missing; add `--yes` flags where appropriate.
- Checklist templates
  - Convert examples to valid markdown tables; include headers/pipe separators and correct code fences.
- Linting and consistency
  - Add `markdownlint-cli` config + CI step; optional pre-commit hook.
  - Normalize file names from `*-TEMP.md` → `*-TEMPLATE.md`; update internal references.
- Helper scripts/docs
  - `fix-structure.sh`: normalize names, optionally remove speculative docs, and run markdownlint.
  - `VALIDATION.md` or `validate-kit.sh`: quick checks for required files, references, line count < 500, rules structure.
  - `MIGRATION.md` and `CHANGELOG.md`.
- Multi‑stack generalization track
  - Add optional rule modules: `python.mdc` and `docs.mdc`.
  - Create `profiles/nextjs-react/` and move stack-specific notes there; keep core docs neutral.
  - Split MCP docs: `MCP-SETUP-SUPABASE.md` (current), `MCP-SETUP-GENERIC.md` (placeholders for other servers).
  - Script split: `setup-next-web.sh` (current), plus `bootstrap-docs.sh` for docs-only starts.
  - Expand options sections in `TECH-STACK/PROJECT-RULES/DEPLOYMENT`.
- Examples
  - Add 2+ more theme examples: “Minimalist Neutral”, “Dark Pro”.
- Authoring guidance
  - Add a short “authoring voice” note at the top of instruction-style templates for consistency.

### Additional housekeeping
- Add `LICENSE` to the repo (README references it). Choose MIT (consistent with README) unless you prefer another.

### Suggested immediate sequence (1–2 hours)
1) Fix references in `README.md` and `START-HERE.md` (remove GROK mention; fix phase-0 link).
2) Add non-interactive mode to `setup.sh`.
3) Convert example tables in `KEY-FEATURES-TEMPLATE.md` and `PAGES-URLS-TEMPLATE.md` to valid markdown tables.
4) Add `markdownlint` config and CI step; wire optional pre-commit.
5) Normalize `*-TEMP.md` to `*-TEMPLATE.md` and update references.


## Progress Checklists

### P0 — Critical
- [ ] Standardize framework versions or make docs version-agnostic (align generator wording and `package.template.json`)
- [x] Modernize Cursor rules to 2025 modular architecture (index not alwaysApply; core/context with priority/context_limit)
- [ ] Fix stale references in docs
  - [ ] `README.md`: replace GROK reference with `START-HERE.md` and `PROMPTS-*.md`
  - [ ] `START-HERE.md`: replace `PHASE-0-CHECKLIST-TEMPLATE.md` with `phase-0-setup.md`
- [ ] Add non-interactive mode to `setup.sh` (respect `PROJECT_NAME` env/default; avoid blocking prompts)
- [x] Split overlong GROK guide into sub-guides (<500 lines each)
- [x] Normalize workflow filenames and label speculative content (Gemini CLI doc labeled theoretical)
  - [ ] (Optional) Rename `Ai-workflow-Gemini-CLI.md` → `AI-Workflow-Gemini-CLI.md` for casing consistency
- [x] Clarify templates vs generated files in documentation

### P1 — High
- [x] Consolidate MCP naming to `@supabase/mcp-server-supabase`
- [x] Expand `DEPLOYMENT-GUIDE.md` with troubleshooting and rollback
- [x] Rename example `package.json` to `package.template.json` with clear header
- [x] Fix formatting issues in `DATABASE-OVERVIEW.md`
- [x] Document Snyk token setup and optional CI usage (continue-on-error configured)

### P2 — Medium
- [ ] Fix formatting in checklist templates to valid pipe tables
  - [ ] `01-templates/checklists/PAGES-URLS-TEMPLATE.md`
  - [ ] `01-templates/checklists/KEY-FEATURES-TEMPLATE.md`
- [ ] Add markdown linting
  - [ ] Create `.markdownlint.json`
  - [ ] Add CI step (e.g., `npx markdownlint '**/*.md'`)
  - [ ] Optional: Pre-commit hook
- [ ] Document essential vs optional dependencies (shadcn/Radix add-on guidance)
- [ ] Provide a 10-minute “Start Here” nav summary at top of `START-HERE.md`
- [ ] Normalize template names `*-TEMP.md` → `*-TEMPLATE.md` and update references
- [ ] Add `fix-structure.sh` (rename/cleanup + markdownlint + rules validation)
- [ ] Create validation runbook/script (`VALIDATION.md` or `validate-kit.sh`)
- [ ] Add `MIGRATION.md` for users upgrading from older kit versions
- [ ] Create `CHANGELOG.md` (Keep a Changelog format)

### Generalization for Multi‑Stack
- P0
  - [ ] Neutralize core docs/rules language; add “choose-your-stack” decision matrix
  - [ ] Add optional rules modules: `python.mdc` and `docs.mdc`
- P1
  - [ ] Introduce `profiles/nextjs-react/` and move stack-specific guidance there
  - [ ] Add `01-templates/phases/INDEX.md` and variants by project type (App/API/CLI/Library/Docs)
  - [ ] Split MCP docs: `MCP-SETUP-SUPABASE.md` and `MCP-SETUP-GENERIC.md`
- P2
  - [ ] Generalize setup scripts: `setup-next-web.sh` (current) and `bootstrap-docs.sh`
  - [ ] Add choice prompts; mark optional sections in prompts
  - [ ] Broaden options in `TECH-STACK/PROJECT-RULES/DEPLOYMENT`
- P3
  - [ ] Add more example themes (e.g., “Minimalist Neutral”, “Dark Pro”)
  - [ ] Add “authoring voice” note to instruction-style templates

### Additional Housekeeping
- [ ] Add `LICENSE` (MIT), matching README reference