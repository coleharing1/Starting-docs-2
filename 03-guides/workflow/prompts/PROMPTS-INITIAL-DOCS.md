# AI Prompts: Initial Docs (Part 1)

Use Cursor Chat (Cmd+L) or Composer (Cmd+I) for generation. Reference prior docs with @filename.md. If unclear, AI should ask questions—no assumptions.

See `03-guides/setup/NEW-PROJECT-SETUP.md` for a manual end-to-end flow.

### 0. Initialize Repo (User Action)
- Clone your template repo
- Create a `project_brainstorm/` folder with your initial project ideas, requirements, and any existing documentation
- Open in Cursor; enable Knowledge uploads for guides:
  - Upload this guide: @START-HERE.md and the PROMPTS-*.md guides.
  - Upload templates from 01-templates/project-docs/: @PROJECT-OVERVIEW-TEMPLATE.md, @PROJECT-RULES-TEMPLATE.md, @THEME-RULES-TEMPLATE.md, @TECH-STACK-TEMPLATE.md, @USER-FLOW-TEMPLATE.md, @UI-RULES-TEMPLATE.md, @API-RULES-TEMPLATE.md, @TESTING-RULES-TEMPLATE.md
  - Upload AI configs from 01-templates/ai-config/: @CLAUDE.md, @.cursor/
  - Upload phase templates from 01-templates/phases/: @phase-0-setup.md, @phase-1-frontend-foundation.md, etc.
  - Upload ADR templates from 01-templates/adr/: @ADR-TEMPLATE.md, @ADR-0001-sqlite-first-approach.md
  - Upload checklist templates from 01-templates/checklists/: @KEY-FEATURES-TEMPLATE.md, @PAGES-URLS-TEMPLATE.md
  - Upload examples from 02-examples/: @TAN-THEME-RULES.md (themes folder)
  - Upload setup guides from 03-guides/setup/: @DATABASE-OVERVIEW.md, @DEPLOYMENT-GUIDE.md, @MCP-SETUP-GUIDE.md, @NEW-PROJECT-SETUP.md
  - Upload workflow guides from 03-guides/workflow/: @AI-WORKFLOW-OPTIMIZATION.md, @BEGINNER-TIPS.md, @CREW-AI-OVERVIEW.md
  - Upload maintenance guides from 03-guides/maintenance/: @PROJECT-HISTORY-INS.md

### 1. Understand Project Context
**Initial Prompt:**
```
Please read all the documents in the folder "project_brainstorm" to understand what the project is about. These documents contain my initial ideas, requirements, and any existing plans for the project.
```

**Note**: This step ensures the AI fully understands your vision before generating formal documentation. Include any sketches, competitor analysis, user research, or technical requirements you have.

### 2. Create `project-overview.md`
**Prompt:**
```
Based on the documents in @project_brainstorm and using @PROJECT-OVERVIEW-TEMPLATE.md as a template guide, please generate project-overview.md as the foundational doc. Use this structure: Title, Executive Summary, Purpose/Objectives, Target Audience/Personas (table), Scope (in/out/assumptions), Goals/Metrics, Risks/Mitigations, Next Steps.

Make it concise, actionable, and SMART. If any critical information is missing from the brainstorm documents, ask for clarification rather than making assumptions.
```

**Alternative Prompt (if no brainstorm folder):**
```
Using @PROJECT-OVERVIEW-TEMPLATE.md as a template guide, generate project-overview.md as the foundational doc. Use this structure: Title, Executive Summary, Purpose/Objectives, Target Audience/Personas (table), Scope (in/out/assumptions), Goals/Metrics, Risks/Mitigations, Next Steps.

Base on my project idea: [Describe briefly, e.g., "AI recipe generator web app"]. Make it concise, actionable, and SMART. Ask for details on audience, scope, etc., if needed.
```

**Note**: The project overview sets the tone for all subsequent documents. Reference @PROJECT-OVERVIEW-TEMPLATE.md for detailed guidance on each section.

### 3. Create `user-flow.md`
**Prompt:**
```
Using @project-overview.md, create user-flow.md defining user journeys. Cover key segments: landing, onboarding, core interactions, navigation, errors/redirects.

Account for features and connections (e.g., from registration to dashboard). Use diagrams (Mermaid syntax) or bullet flows. No assumptions—ask if flows are unclear.

This guides architecture and UI.
```

**Note**: For complex apps, include edge cases like auth failures.

### 4. Recommend and Finalize `tech-stack.md`
**Prompt (Initial Recommendations):**
```
Using @project-overview.md and @user-flow.md, recommend a stack optimized for frontend-first development with a migration path from local to production.

I prefer: TypeScript, React/Next.js, Tailwind CSS, SQLite for development (migrating to Supabase for production).

For each category, propose options with this development approach in mind:
- Language: TypeScript
- Frontend Framework: Next.js (current LTS) with App Router
- UI Library: React (current LTS) components
- CSS Framework: Tailwind CSS
- Development Database: SQLite with Prisma/Drizzle ORM
- Production Database: Supabase (PostgreSQL)
- Authentication: NextAuth for development, Supabase Auth for production
- Deployment: Vercel

Explain the SQLite-first approach benefits: faster local development, no Docker required initially, easier for beginners, prove concept before cloud costs.
```

**User Action**: Review proposals. Understand the migration path from SQLite to Supabase. Then prompt:
```
Output finalized tech-stack.md with the development-first approach clearly explained. Include:
- Development stack (SQLite, local auth)
- Production stack (Supabase, cloud auth)
- Migration strategy between them
- Benefits of this approach for beginners
```

**Prompt (Enhance):**
```
Update @tech-stack.md with:
- SQLite setup and best practices for development
- Prisma/Drizzle configuration for both SQLite and PostgreSQL
- Migration scripts from SQLite to Supabase
- Environment variable management for dev vs prod
- Clear separation of Phase 0-4 tools (SQLite) vs Phase 5 tools (Supabase)

Reference @DATABASE-OVERVIEW.md for Supabase migration details. Be thorough about the transition process.
```

**Note**: This approach lets beginners focus on building features without cloud complexity initially. SQLite provides a full SQL database experience locally.

### 5. Explore and Create `ui-rules.md` & `theme-rules.md`
**Prompt (Design Exploration):**
```
Walk through common design principles for this app type (from @project-overview.md, @user-flow.md). Recommend styles: minimalist, glassmorphic, neumorphic, etc., with fits/why.

Suggest accessibility, responsiveness, animations. Teach basics if I'm new.
```

**User Action**: Decide preferences (e.g., "mobile-first, responsive; theme: minimalist").

**Prompt (Generate Files):**
```
I want: mobile-first, responsive, subtle animations.

Theme: minimalist.

Using @project-overview.md, @user-flow.md, @tech-stack.md, create ui-rules.md (principles: hierarchy, consistency, feedback) and theme-rules.md (colors/table, typography, spacing, shadows; code examples for Tailwind/CSS vars).
```

**Note**: Use LLM templates for these (e.g., from prior generations). Reference `@PROJECT-OVERVIEW-TEMPLATE.md` for overviews and `@THEME-RULES-TEMPLATE.md` for themes. For real-world examples, see `@TAN-THEME-RULES.md`. Ensure WCAG compliance (2.2) in themes.

### 6. Create `project-rules.md`
**Prompt:**
```
Build an AI-first codebase: modular, scalable, navigable. Files: descriptive names, top explanations, TSDoc comments; <500 lines.

Using @tech-stack.md, @user-flow.md, @project-overview.md, @ui-rules.md, @theme-rules.md, create project-rules.md: directory structure (e.g., app/, components/, lib/), naming conventions (kebab-case files, PascalCase components), code style (functional, no classes, descriptive vars).
```

**Note**: Align with 2025 trends: Use app router in Next.js; maps over enums.
Reference `@PROJECT-RULES-TEMPLATE.md` for a structured template, including AI-first principles like modularity and descriptive conventions. Ensure rules promote functional patterns and <500-line files as per user guidelines.
