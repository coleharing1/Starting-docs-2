# New Project Kickoff Guide

This guide outlines a streamlined, AI-assisted workflow for initializing a new project in Cursor AI (or similar IDEs) as of July 2025. It emphasizes documentation-first development to ensure clarity, scalability, and collaboration.

For step-by-step manual setup, see `03-guides/setup/NEW-PROJECT-SETUP.md`.

## Available Template Documents
This repository is organized into clear categories for easy navigation:

### 📁 01-templates/ - Ready-to-Use Templates

**project-docs/** - Project documentation templates:
- `PROJECT-OVERVIEW-TEMPLATE.md` - Project overview structure
- `PROJECT-RULES-TEMPLATE.md` - Code conventions and rules
- `THEME-RULES-TEMPLATE.md` - Design system documentation
- `TECH-STACK-TEMPLATE.md` - Technology stack template
- `USER-FLOW-TEMPLATE.md` - User journey mapping template
- `UI-RULES-TEMPLATE.md` - UI design principles template
- `API-RULES-TEMPLATE.md` - API design patterns
- `TESTING-RULES-TEMPLATE.md` - Testing strategy

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

### 📁 02-examples/ - Example Implementations

**themes/** - Design examples:
- `TAN-THEME-RULES.md` - Complete earthy minimalist theme

### 📁 03-guides/ - Comprehensive Guides

**setup/** - Configuration and setup:
- `NEW-PROJECT-SETUP.md` - Manual step-by-step project setup
- `DATABASE-OVERVIEW.md` - SQLite to Supabase migration
- `DEPLOYMENT-GUIDE.md` - Vercel deployment
- `MCP-SETUP-GUIDE.md` - Model Context Protocol

**workflow/** - Development workflows:
- `AI-WORKFLOW-OPTIMIZATION.md` - Advanced AI techniques
- `BEGINNER-TIPS.md` - AI-first development tips
- `CREW-AI-OVERVIEW.md` - Multi-agent systems

**maintenance/** - Documentation maintenance:
- `PROJECT-HISTORY-INS.md` - History tracking guide

## Recommended Document Order
Build documents in this sequence to layer context naturally:

0. `project_brainstorm/` folder: Initial ideas, requirements, and research
1. `project-overview.md`: Define purpose, scope, goals, audience
2. `user-flow.md`: Map user journeys and feature interconnections
3. `tech-stack.md`: Select and detail technologies (SQLite for dev, Supabase for prod)
4. `ui-rules.md`: Set design principles and interaction guidelines
5. `theme-rules.md`: Outline colors, typography, spacing for consistency
6. `project-rules.md`: Specify folder structure, naming, code style
7. `./phases/`: 6 phase documents with detailed checklists (Phase 0–5)

Place all formal docs in `_docs/` for organization. Keep brainstorm materials in `project_brainstorm/` for reference.
