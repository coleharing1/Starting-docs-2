# AI Prompts: Planning & Tracking (Part 2)

This guide covers the prompts for creating phase-based plans, detailed checklists, and status trackers for your project.

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

**Note**: Update status (e.g., to In Progress or Complete) after implementing routes. Integrate with deployments for verification; see PAGES-URLS-TEMPLATE.md for full instructions.

### 10. Create Project History Log
**Prompt:**
```
Initialize project-history.md as a reverse-chronological log starting with an entry for project setup (e.g., date, commit summary, changes, rationale). Base the first entry on this repo's initialization. Use it to track commits narratively for AI context.

IMPORTANT: This document is critical for maintaining context across AI sessions. It must be updated every 5-10 file changes to prevent context loss when working across multiple days.
```

**Critical Setup for Context Persistence:**
1. **Add to AI Rules**: Include automatic reminder in `.cursor/rules/900-context.mdc`
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
