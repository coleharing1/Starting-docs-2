# New Project Kickoff Guide

This guide outlines a streamlined, AI-assisted workflow for initializing a new project in Cursor AI (or similar IDEs) as of July 2025. It emphasizes documentation-first development to ensure clarity, scalability, and collaboration. By creating core documents sequentially, we build a solid foundation.

This approach leverages Cursor's AI features to reduce setup time to under an hour for most projects. It's tailored for web apps but is adaptable.

For the detailed, step-by-step prompts to generate your project documentation, please see the following guides:
- **Part 1: Initial Documentation:** `PROMPTS-INITIAL-DOCS.md`
- **Part 2: Planning & Tracking Docs:** `PROMPTS-PLANNING-TRACKING.md`
- **Part 3: Advanced Docs & Maintenance:** `PROMPTS-ADVANCED-MAINTENANCE.md`

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
- `.cursor/` - Modular Cursor AI behavior rules (with clarifying questions)

**checklists/** - Progress tracking templates:
- `KEY-FEATURES-TEMPLATE.md` - Feature tracking template
- `PAGES-URLS-TEMPLATE.md` - Route status tracking

**phases/** - Pre-filled phase templates:
- `phase-0-setup.md` - Complete setup checklist (40+ tasks)
- `phase-1-frontend-foundation.md` - UI components checklist (50+ tasks)
- `phase-2-frontend-features.md` - Features checklist (50+ tasks)
- `phase-3-backend-sqlite.md` - Backend with SQLite
- `phase-4-testing-polish.md` - Testing and QA
- `phase-5-production-supabase.md` - Production deployment

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
  - `docs/ai-context/` folder (architecture.mermaid, technical.md, status.md)
  - `setup.sh` script for init (npm install, supabase init, MCP setup)
  - `package.json`: Pre-install dev dependencies such as `@supabase/cli`, `@supabase/mcp-server-supabase`, and `husky` (for Git hooks)
  - `.env.local.example` for env vars
  - `.github/workflows/` for CI/CD automation

Run `setup.sh` after cloning to bootstrap.

Example `setup.sh` (simplified):

```bash
#!/usr/bin/env bash

# Install app & dev dependencies
npm install

# Install MCP for AI-driven DB autonomy
npm install @supabase/mcp-server-supabase --save-dev

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
