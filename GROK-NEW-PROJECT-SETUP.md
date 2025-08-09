# New Project Setup Guide

This guide outlines a streamlined, AI-assisted workflow for initializing a new project in Cursor AI (or similar IDEs) as of July 2025. It emphasizes documentation-first development to ensure clarity, scalability, and collaboration. By creating core documents sequentially, we build a solid foundation: starting with context (overview, flows), moving to decisions (tech, UI, theme), then rules (code organization), and finally execution (phases).

This approach leverages Cursor's AI features like Composer, Chat, and rules for automation, reducing setup time to under an hour for most projects. It's tailored for web apps (e.g., AI-integrated full-stack), but adaptable. Assume a GitHub template repo for boilerplate (see Step 0 below).

## Available Template Documents
This repository is organized into clear categories for easy navigation:

### 📁 01-templates/ - Ready-to-Use Templates

**project-docs/** - Project documentation templates:
- `PROJECT-OVERVIEW-TEMP.md` - Project overview structure
- `PROJECT-RULES-TEMP.md` - Code conventions and rules
- `THEME-RULES-TEMP.md` - Design system documentation
- `TECH-STACK-TEMP.md` - Technology stack template
- `USER-FLOW-TEMP.md` - User journey mapping template
- `UI-RULES-TEMP.md` - UI design principles template
- `API-RULES-TEMP.md` - API design patterns
- `TESTING-RULES-TEMP.md` - Testing strategy

**ai-config/** - AI assistant configuration:
- `CLAUDE.md` - Persistent context for Claude Code
- `rules.mdc` - Cursor AI behavior rules (with clarifying questions)

**checklists/** - Progress tracking templates:
- `PHASE-0-CHECKLIST-TEMPLATE.md` - Detailed setup checklist
- `KEY-FEATURES-TEMPLATE.md` - Feature tracking template
- `PAGES-URLS-TEMPLATE.md` - Route status tracking

**phases/** - Pre-filled phase templates:
- `phase-0-setup.md` - Complete setup checklist (40+ tasks)
- `phase-1-frontend-foundation.md` - UI components checklist (50+ tasks)
- `phase-2-frontend-features.md` - Features checklist (50+ tasks)

**adr/** - Architecture Decision Records:
- `ADR-TEMPLATE.md` - Decision documentation template
- `ADR-0001-sqlite-first-approach.md` - Example ADR

### 📁 02-examples/ - Example Implementations

**themes/** - Design examples:
- `TAN-THEME-RULES.md` - Complete earthy minimalist theme

**project-brainstorm/** - Brainstorming examples:
- `initial-ideas-EXAMPLE.md` - Project concept example
- `requirements-EXAMPLE.md` - Requirements documentation example

### 📁 03-guides/ - Comprehensive Guides

**setup/** - Configuration and setup:
- `DATABASE-OVERVIEW.md` - SQLite to Supabase migration
- `DEPLOYMENT-GUIDE.md` - Vercel deployment
- `MCP-SETUP-GUIDE.md` - Model Context Protocol

**workflow/** - Development workflows:
- `AI-WORKFLOW-OPTIMIZATION.md` - Advanced AI techniques
- `BEGINNER-TIPS.md` - AI-first development tips
- `CREW-AI-OVERVIEW.md` - Multi-agent systems

**maintenance/** - Documentation maintenance:
- `PROJECT-HISTORY-INS.md` - History tracking guide

## Prerequisites
- **Tools**: Cursor AI (with Pro for advanced AI), Claude Code (for persistent context), Docker (for local DB if using Supabase), Git, npm/Yarn.
- **Best Practices (August 2025 Updates)**: 
  - Use both Cursor and Claude Code for maximum efficiency
  - Configure MCP (Model Context Protocol) for AI-DB interactions
  - Enforce <500-line files for AI compatibility
  - Enable auto-save in editor for faster hot-reload
  - Set up Yolo mode for automated test execution
  - Prioritize accessibility (WCAG 2.2) and performance optimization
- **Security Note (2025)**: When using MCP servers, always use `--read-only` flag for database connections. Enable manual approval for all tool calls. Test MCP configurations locally before production.
- **Template Repo**: Create/clone a GitHub template with:
  - `project_brainstorm/` folder (for initial ideas, requirements, sketches)
    - `README.md` (explaining what to include in brainstorm docs)
    - Example: `initial-ideas.md`, `requirements.md`, `competitor-analysis.md`
  - `_docs/` folder (empty placeholders for overview.md, etc.)
  - `.cursor/rules.mdc` (project-specific AI rules with YAML frontmatter)
  - `CLAUDE.md` (persistent memory for Claude Code)
  - `docs/ai-context/` folder (architecture.mermaid, technical.md, status.md)
  - `setup.sh` script for init (npm install, supabase init, MCP setup)
  - `package.json`: Pre-install dev dependencies such as `@supabase/cli`, `@supabase/mcp-server`, and `husky` (for Git hooks)
  - `.env.local.example` for env vars
  - `.github/workflows/` for CI/CD automation

Run `setup.sh` after cloning to bootstrap.

Example `setup.sh` (simplified):

```bash
#!/usr/bin/env bash

# Install app & dev dependencies
npm install

# Install MCP for AI-driven DB autonomy
npm install supabase-mcp --save-dev

# Initialize Supabase (if project requires a database)
npx supabase init

# Start local Supabase stack (Docker must be running)
npx supabase start

echo "✅  Project initialized. Edit _docs/project-overview.md first."
```

## Recommended Document Order
Build documents in this sequence to layer context naturally:

0. `project_brainstorm/` folder: Initial ideas, requirements, and research (created first by user)
1. `project-overview.md`: Define purpose, scope, goals, audience (based on brainstorm)
2. `user-flow.md`: Map user journeys and feature interconnections
3. `tech-stack.md`: Select and detail technologies (SQLite for dev, Supabase for prod)
4. `ui-rules.md`: Set design principles and interaction guidelines
5. `theme-rules.md`: Outline colors, typography, spacing for consistency
6. `project-rules.md`: Specify folder structure, naming, code style
7. `./phases/` (subdir in `_docs/`): 6 phase documents (Phase 0-5) with detailed checklists
   - `phase-0-setup.md`: Project initialization
   - `phase-1-frontend-foundation.md`: UI components
   - `phase-2-frontend-features.md`: Interactive features
   - `phase-3-backend-sqlite.md`: Database and API
   - `phase-4-testing-polish.md`: Quality assurance
   - `phase-5-production-supabase.md`: Production deployment

Place all formal docs in `_docs/` for organization. Keep brainstorm materials in `project_brainstorm/` for reference.

## Step-by-Step Workflow with AI Prompts
Use Cursor Chat (Cmd+L) or Composer (Cmd+I) for generation. Reference prior docs with @filename.md. If unclear, AI should ask questions—no assumptions.

### 0. Initialize Repo (User Action)

**Quick Start Option:**
```bash
# For a complete working project in 3 minutes:
chmod +x setup.sh
./setup.sh
```

**Or Manual Setup:**
- Clone your template repo
- Run `npm install` to install dependencies
- Create a `project_brainstorm/` folder with your initial project ideas, requirements, and any existing documentation
- Open in Cursor; enable Knowledge uploads for guides:
  - Upload this guide: @GROK-NEW-PROJECT-SETUP.md
  - Upload templates from 01-templates/project-docs/: @PROJECT-OVERVIEW-TEMP.md, @PROJECT-RULES-TEMP.md, @THEME-RULES-TEMP.md, @TECH-STACK-TEMP.md, @USER-FLOW-TEMP.md, @UI-RULES-TEMP.md, @API-RULES-TEMP.md, @TESTING-RULES-TEMP.md
  - Upload AI configs from 01-templates/ai-config/: @CLAUDE.md, @rules.mdc
  - Upload phase templates from 01-templates/phases/: @phase-0-setup.md, @phase-1-frontend-foundation.md, @phase-2-frontend-features.md
  - Upload ADR templates from 01-templates/adr/: @ADR-TEMPLATE.md, @ADR-0001-sqlite-first-approach.md
  - Upload checklist templates from 01-templates/checklists/: @PHASE-0-CHECKLIST-TEMPLATE.md, @KEY-FEATURES-TEMPLATE.md, @PAGES-URLS-TEMPLATE.md
  - Upload examples from 02-examples/: @TAN-THEME-RULES.md (themes folder)
  - Upload setup guides from 03-guides/setup/: @DATABASE-OVERVIEW.md, @DEPLOYMENT-GUIDE.md, @MCP-SETUP-GUIDE.md
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
Based on the documents in @project_brainstorm and using @PROJECT-OVERVIEW-TEMP.md as a template guide, please generate project-overview.md as the foundational doc. Use this structure: Title, Executive Summary, Purpose/Objectives, Target Audience/Personas (table), Scope (in/out/assumptions), Goals/Metrics, Risks/Mitigations, Next Steps.

Make it concise, actionable, and SMART. If any critical information is missing from the brainstorm documents, ask for clarification rather than making assumptions.
```

**Alternative Prompt (if no brainstorm folder):**
```
Using @PROJECT-OVERVIEW-TEMP.md as a template guide, generate project-overview.md as the foundational doc. Use this structure: Title, Executive Summary, Purpose/Objectives, Target Audience/Personas (table), Scope (in/out/assumptions), Goals/Metrics, Risks/Mitigations, Next Steps.

Base on my project idea: [Describe briefly, e.g., "AI recipe generator web app"]. Make it concise, actionable, and SMART. Ask for details on audience, scope, etc., if needed.
```

**Note**: The project overview sets the tone for all subsequent documents. Reference @PROJECT-OVERVIEW-TEMP.md for detailed guidance on each section.

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
- Frontend Framework: Next.js with App Router
- UI Library: React components
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

**Note**: Use LLM templates for these (e.g., from prior generations). Reference `@PROJECT-OVERVIEW-TEMP.md` for overviews and `@THEME-RULES-TEMP.md` for themes. For real-world examples, see `@TAN-THEME-RULES.md`. Ensure WCAG compliance (2.2) in themes.

### 6. Create `project-rules.md`
**Prompt:**
```
Build an AI-first codebase: modular, scalable, navigable. Files: descriptive names, top explanations, TSDoc comments; <500 lines.

Using @tech-stack.md, @user-flow.md, @project-overview.md, @ui-rules.md, @theme-rules.md, create project-rules.md: directory structure (e.g., app/, components/, lib/), naming conventions (kebab-case files, PascalCase components), code style (functional, no classes, descriptive vars).
```

**Note**: Align with 2025 trends: Use app router in Next.js; maps over enums.
Reference `@PROJECT-RULES-TEMP.md` for a structured template, including AI-first principles like modularity and descriptive conventions. Ensure rules promote functional patterns and <500-line files as per user guidelines.

### 7. Create Phase Documents with Detailed Checklists in `_docs/phases/`
**Prompt:**
```
Create a comprehensive 6-phase development plan (Phase 0 through Phase 5) with extremely detailed checklists for a frontend-first approach. Start with SQLite for rapid prototyping and migrate to Supabase in the final phase.

Phase Structure:
- Phase 0: Project Setup & Configuration
- Phase 1: Frontend Foundation & UI Components  
- Phase 2: Frontend Features & User Flows
- Phase 3: Backend Integration with SQLite
- Phase 4: Polish, Testing & Optimization
- Phase 5: Production Setup & Supabase Migration

For each phase, create a detailed checklist with:
- Every single task broken down into small, specific steps
- Tasks ordered by exact implementation sequence
- Frontend development prioritized in early phases
- Clear dependencies between tasks
- Estimated time for each task (for beginners)
- Specific file names and locations to create/modify

Use @project-overview.md, @user-flow.md, @tech-stack.md, @project-rules.md. Output as separate files in _docs/phases/.
```

**Detailed Phase Breakdown for Beginners:**

**Phase 0 - Project Setup & Configuration Checklist:**
- Environment setup (Node, npm, Git)
- Next.js project initialization
- Folder structure creation
- ESLint and Prettier configuration
- Tailwind CSS setup
- Component library setup
- Git repository initialization
- Environment variables configuration
- VS Code/Cursor settings

**Phase 1 - Frontend Foundation Checklist:**
- Layout components (Header, Footer, Navigation)
- Page templates and routing
- Design system implementation
- Responsive grid system
- Typography components
- Button variants
- Form components
- Loading states
- Error boundaries

**Phase 2 - Frontend Features Checklist:**
- All user-facing features (no backend)
- Mock data implementation
- State management setup
- Client-side routing
- Form validations
- Interactive components
- Animations and transitions
- Accessibility features

**Phase 3 - Backend with SQLite Checklist:**
- SQLite database setup
- Prisma/Drizzle ORM configuration
- Database schema creation
- API routes implementation
- Data fetching hooks
- Authentication (local)
- Basic CRUD operations
- Session management

**Phase 4 - Polish & Testing Checklist:**
- Unit tests for components
- Integration tests
- E2E testing setup
- Performance optimization
- SEO improvements
- Error handling
- Loading optimizations
- Code refactoring

**Phase 5 - Production & Supabase Migration Checklist:**
- Supabase project creation
- Database schema migration
- Authentication migration
- RLS policies setup
- Environment variables for production
- Vercel deployment configuration
- Domain setup
- Monitoring and analytics

**Note**: This frontend-first approach with SQLite allows rapid prototyping and proving concepts before committing to production infrastructure. Reference @DATABASE-OVERVIEW.md for Supabase migration details.

### 8. Create Phase-Based Implementation Checklists
**Prompt:**
```
Using @project-overview.md, @user-flow.md, and the 6-phase structure from _docs/phases/, create detailed implementation checklists for each phase (phase-0-checklist.md through phase-5-checklist.md).

Format each checklist as a detailed markdown table with:
- [ ] Checkbox for each task
- Task description (be extremely specific)
- File/Component to create or modify
- Dependencies (what must be done first)
- Estimated time for beginners
- Status (Not Started/In Progress/Complete/Blocked)
- Notes/Links to relevant docs

Example format:
| ✓ | Task | File/Component | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Create Next.js app with TypeScript | / | Node.js installed | 5 min | Not Started | Use `npx create-next-app@latest` |
| [ ] | Set up Tailwind CSS | tailwind.config.js | Next.js app created | 10 min | Not Started | Follow @theme-rules.md |

Make tasks small enough that each can be completed in 5-30 minutes. Order them by exact implementation sequence. Focus on frontend tasks in Phases 0-2, backend in Phase 3, testing in Phase 4, and production in Phase 5.
```

**Phase Checklist Guidelines for Beginners:**

**Phase 0 Checklist Focus:**
- Development environment setup
- Project initialization 
- Configuration files
- Folder structure
- Version control
- No actual features yet

**Phase 1 Checklist Focus:**
- Static UI components
- Layout structure
- Navigation
- Design system basics
- All visual elements without functionality

**Phase 2 Checklist Focus:**
- Interactive features (client-side only)
- Forms and inputs
- State management
- Mock data and placeholders
- All user interactions without backend

**Phase 3 Checklist Focus:**
- SQLite database setup
- API routes
- Data models
- CRUD operations
- Connect frontend to backend
- Local authentication

**Phase 4 Checklist Focus:**
- Testing everything
- Performance improvements
- Bug fixes
- Code cleanup
- Documentation
- Accessibility audit

**Phase 5 Checklist Focus:**
- Migrate SQLite to Supabase
- Production environment setup
- Deployment configuration
- Security hardening
- Monitoring setup
- Go-live tasks

**Note**: Each phase should have 20-50 detailed tasks. This granular approach helps beginners avoid overwhelm and provides clear progress tracking. Update checklist status after completing each task.

### 9. Create Pages and URLs Status Tracker
**Prompt:**
```
Based on @user-flow.md, @project-overview.md, and _docs/phases/, generate pages-urls-status.md as a markdown table listing key pages/routes, URLs, descriptions, initial status (Planned), and notes/links. This helps visualize app structure and monitor build progress.
```

**Note**: Update status (e.g., to In Progress or Complete) after implementing routes. Integrate with deployments for verification; see PAGES-URLS_INS.md for full instructions.

### 10. Create Project History Log
**Prompt:**
```
Initialize project-history.md as a reverse-chronological log starting with an entry for project setup (e.g., date, commit summary, changes, rationale). Base the first entry on this repo's initialization. Use it to track commits narratively for AI context.

IMPORTANT: This document is critical for maintaining context across AI sessions. It must be updated every 5-10 file changes to prevent context loss when working across multiple days.
```

**Critical Setup for Context Persistence:**
1. **Add to AI Rules**: Include automatic reminder in `.cursor/rules.mdc` (see Step 13)
2. **Set Update Frequency**: Every 5-10 file changes or at end of each work session
3. **Format**: Reverse chronological with clear summaries of what was done and why
4. **Reference**: Always include @project-history.md in prompts when resuming work

**Example Update Prompt (use every 5-10 files):**
```
Please update @project-history.md with a new entry summarizing the recent changes. Include:
- Date and time
- Files modified (list the 5-10 files)
- Summary of changes made
- Rationale for the changes
- Any important decisions or patterns established
- Next steps or pending work
```

**Note**: This is ESSENTIAL for multi-day projects. Without regular updates, AI loses context of previous work. Reference @PROJECT-HISTORY-INS.md for detailed maintenance tips.

### 11. (Optional) Create API Documentation
**If your project includes APIs, create `api-rules.md`:**
```
Using @API-RULES.md as a template and referencing @project-overview.md, @tech-stack.md, and @user-flow.md, create api-rules.md defining our API conventions: endpoint naming, authentication methods, error handling, rate limiting, and security practices.

Include examples for our specific tech stack and use cases.
```

**Note**: Essential for projects with backend APIs. Skip for static sites.

### 12. (Optional) Create Testing Strategy
**If emphasizing testing, create `testing-rules.md`:**
```
Using @TESTING-RULES.md as a template and referencing @project-overview.md, @tech-stack.md, and @project-rules.md, create testing-rules.md defining our testing strategy: coverage goals, testing types (unit, integration, e2e), tools, and automation.

Include specific examples for our tech stack.
```

**Note**: Highly recommended for production applications. Reference @BEGINNER-TIPS.md if new to testing.

### 12.5 (Optional) Consider AI Agent Integration
**For complex automation needs, review @CREW-AI-OVERVIEW.md:**
- Multi-agent systems for automated workflows
- Useful for projects requiring content generation, data analysis, or complex task automation
- Skip if your project doesn't need autonomous AI agents

### 13. Set Up AI Assistant Rules (User Action)

#### For Cursor:
Create `.cursor/rules.mdc` with YAML frontmatter:

```yaml
---
description: "Project-specific AI behavior rules"
alwaysApply: true
---
# AI Assistant Rules

## Code Quality Rules
- Only modify code directly relevant to requests
- Never use placeholders like "// ... rest of code"
- Reference similar existing components when creating new ones
- Follow patterns in @CLAUDE.md and @project-rules.md

## Context Persistence Rules - CRITICAL
- **PROJECT HISTORY TRACKING**: After every 5-10 file modifications, remind to update @project-history.md
- Track file change count internally during the session
- When count reaches 5-10, prompt: "You've modified [X] files. Please update @project-history.md with a summary of recent changes."
- Always check @project-history.md when starting a new session or resuming work
- If @project-history.md exists but hasn't been updated recently, suggest updating it before proceeding

## Session Management
- At start of session: Read @project-history.md to understand previous work
- During session: Track files modified and suggest history updates
- At end of session: Remind to update project history before closing
```

#### For Claude Code:
Initialize with `/init` command to create CLAUDE.md, then maintain it as persistent project memory across sessions.

#### Workflow Configuration:
1. **Enable Auto-Save**: In editor settings for faster hot-reload
2. **Set Up Yolo Mode**: Allow Cursor to run tests without confirmation
3. **Configure MCP**: Add Supabase MCP server in Settings > MCP (see @MCP-SETUP-GUIDE.md)
4. **Git Hooks**: Install Husky for pre-commit testing

**Note**: Both `.cursor/rules.mdc` and `CLAUDE.md` should be version controlled and updated as project evolves.

### 14. Update README.md
**Prompt:**
```
Using @project-overview.md, @user-flow.md, @tech-stack.md, @project-rules.md, update README.md: Brief overview, setup instructions, conventions, contribution guidelines.
```

### 15. Final Checks (User Action)
- Review all generated documentation for consistency
- Ensure all cross-references between documents are valid
- Verify that the project brainstorm content has been properly incorporated
- Test that all technical configurations (MCP, Git hooks, etc.) are working
- Reference @AI-WORKFLOW-OPTIMIZATION.md for productivity tips
- Review @BEGINNER-TIPS.md if you're new to any concepts

### 16. Clean Up Template Files (User Action)
Once your project-specific documentation is complete, you can remove the template files that are no longer needed:

**Files to KEEP (still useful during development):**
- `CLAUDE.md` - Your project's persistent memory
- `.cursor/rules.mdc` - Your project-specific AI rules
- `_docs/` folder with all your generated project docs
- `project_brainstorm/` folder for reference
- Helper guides: @AI-WORKFLOW-OPTIMIZATION.md, @MCP-SETUP-GUIDE.md, @BEGINNER-TIPS.md

**Files to REMOVE (templates no longer needed):**
```bash
# Remove template files that have been replaced by project-specific versions
rm 01-templates/project-docs/*-TEMP.md
rm 02-examples/themes/TAN-THEME-RULES.md  # Unless you're using this specific theme
rm GROK-NEW-PROJECT-SETUP.md  # This guide itself

# Remove example brainstorm files
rm 02-examples/project-brainstorm/*-EXAMPLE.md

# Optional: Archive templates instead of deleting
mkdir _archive_templates
mv 01-templates/ _archive_templates/
mv 02-examples/ _archive_templates/
mv 03-guides/ _archive_templates/  # Keep only what you need for reference
```

**Note**: Consider keeping @DATABASE-OVERVIEW.md, @DEPLOYMENT-GUIDE.md, @API-RULES.md, and @TESTING-RULES.md as reference during development.

---

### 17. Ongoing Maintenance

1. **Project History Updates (CRITICAL)**: Update @project-history.md every 5-10 file changes to maintain AI context across sessions. This prevents context loss when working across multiple days.
2. **Accessibility & Performance Audits**: Run Lighthouse (or the 2025 open-source equivalent) regularly to track Core Web Vitals and WCAG compliance.
3. **Dependency Updates**: Monitor release notes for Next.js, Supabase, and supabase-mcp. Apply security patches promptly (e.g., July 2025 MCP leak fix).
4. **AI Workflow Upgrades**: Enable Cursor's background agents and enhanced Composer (May 2025) for multi-file edits; adjust `.cursorrules.md` as features evolve.
5. **CI/CD Enhancements**: Expand GitHub Actions to include automated test, lint, and accessibility checks before deploys.
6. **Knowledge Base Refresh**: Periodically re-upload updated docs to Cursor Knowledge to keep AI responses aligned.
7. **Context Recovery Protocol**: If AI loses context, immediately reference @project-history.md and @CLAUDE.md to restore understanding of the project state.

---

**Let's Get Started**: Prompt AI with your project idea to generate project-overview.md first!

### Appendix: Alternative Prompts and Rules from Legacy Setup
This section incorporates elements from an earlier setup guide (PALMER-NEW-PROJECT-SETUP.md) for completeness. Use these as variations if the main prompts don't fit your style.

#### Alternative Agent Rules Example
```
You are an expert in TypeScript, Node.js, NextJS + App Router, React, Shadcn, Radix UI and Tailwind CSS.
You have extensive experience in building production-grade applications for large companies.
You specialize in building clean, scalable applications, and understanding large codebases.
Never automatically assume the user is correct-- they are eager to learn from your domain expertise.
Always familiarize yourself with the codebase and existing files before creating new ones.

We are building an AI-first codebase, which means it needs to be modular, scalable, and easy to understand. The file structure should be highly navigable, and the code should be well-organized and easy to read.

All files should have descriptive names, an explanation of their contents at the top, and all functions should have proper commentation of their purpose and parameters (JSDoc, TSDoc, etc, whatever is appropriate).
To maximize compatibility with modern AI tools, files should not exceed 500 lines.

Code Style and Structure:

- Write concise, technical code.
- Use functional and declarative programming patterns; avoid classes.
- Decorate all functions with descriptive block comments.
- Prefer iteration and modularization over code duplication.
- Throw errors instead of adding fallback values.
- Use descriptive variable names with auxiliary verbs (e.g., isLoading, hasError).
- Avoid enums; use maps instead.
- Use the "function" keyword for pure functions.
- Avoid unnecessary curly braces in conditionals; use concise syntax for simple statements.
```

#### Prompt Variations
- For Tech Stack: "Walk me through pros/cons for each category before finalizing."
- For UI/Theme: "If I want [specific style, e.g., neumorphic], adjust the prompts accordingly."

**Note**: This appendix consolidates from a legacy version to reduce redundancy—prefer the main GROK workflow for new projects.