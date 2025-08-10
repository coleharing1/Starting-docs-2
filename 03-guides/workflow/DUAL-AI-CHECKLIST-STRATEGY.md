# Dual AI Assistant Checklist Strategy
## Claude Code + Cursor Claude Working in Harmony

This document outlines a synchronized workflow strategy for using Claude Code and Cursor Claude together on the same project, with separate but complementary checklists that prevent conflicts and maximize productivity.

## Core Principles

### 1. **Division of Labor**
- **Claude Code**: Deep reasoning, architecture, multi-file operations, testing, automation
- **Cursor Claude**: UI/frontend, quick edits, visual work, debugging, refinements

### 2. **Synchronized Timing**
- Both AIs work on different layers of the same phase
- Clear handoff points between tasks
- Built-in checkpoints to ensure neither gets ahead

### 3. **Shared Context**
- Both reference the same `CLAUDE.md` file
- Both follow `.cursor/rules.mdc` conventions
- Regular sync points via `project-history.md`

## Phase-Based Task Distribution

### Phase 0: Project Setup & Configuration

#### **Claude Code Tasks** (Backend/Infrastructure Focus)
```markdown
CC-0.1 □ Initialize project structure and Git repository
CC-0.2 □ Set up database schema (Prisma/SQLite)
CC-0.3 □ Create API route structure
CC-0.4 □ Configure authentication system
CC-0.5 □ Set up testing framework
CC-0.6 □ Create CI/CD pipeline (.github/workflows)
CC-0.7 □ Generate initial migrations
CC-0.8 □ Set up environment variables structure
CC-0.9 □ Create security configurations
CC-0.10 □ SYNC POINT: Update CLAUDE.md with architecture decisions
```

#### **Cursor Claude Tasks** (Frontend/Developer Experience Focus)
```markdown
CU-0.1 □ Wait for CC-0.1 completion
CU-0.2 □ Install and configure Tailwind CSS
CU-0.3 □ Set up shadcn/ui components
CU-0.4 □ Configure ESLint and Prettier
CU-0.5 □ Create VS Code/Cursor settings
CU-0.6 □ Set up Husky git hooks
CU-0.7 □ Configure TypeScript paths
CU-0.8 □ Create component folder structure
CU-0.9 □ Set up Storybook (if needed)
CU-0.10 □ SYNC POINT: Verify all configurations work together
```

### Phase 1: Frontend Foundation

#### **Claude Code Tasks** (System Architecture)
```markdown
CC-1.1 □ Create data models and types (src/types/)
CC-1.2 □ Build API client and hooks (src/lib/api/)
CC-1.3 □ Set up state management (Context/Zustand)
CC-1.4 □ Create authentication hooks
CC-1.5 □ Build error handling system
CC-1.6 □ Set up data fetching patterns
CC-1.7 □ Create utility functions (src/lib/utils/)
CC-1.8 □ Build form validation schemas (Zod)
CC-1.9 □ Set up routing configuration
CC-1.10 □ SYNC POINT: Document patterns in CLAUDE.md
```

#### **Cursor Claude Tasks** (UI Components)
```markdown
CU-1.1 □ Wait for CC-1.1 (need types)
CU-1.2 □ Create layout components (Header, Footer)
CU-1.3 □ Build navigation system
CU-1.4 □ Design button variants
CU-1.5 □ Create form components
CU-1.6 □ Build card and container components
CU-1.7 □ Design loading states and skeletons
CU-1.8 □ Create modal and dialog components
CU-1.9 □ Build notification system (toasts)
CU-1.10 □ SYNC POINT: Component library complete
```

### Phase 2: Feature Implementation

#### **Claude Code Tasks** (Business Logic)
```markdown
CC-2.1 □ Implement user registration flow
CC-2.2 □ Build authentication middleware
CC-2.3 □ Create CRUD operations for main entities
CC-2.4 □ Implement search and filtering logic
CC-2.5 □ Build data validation layer
CC-2.6 □ Create background jobs/queues
CC-2.7 □ Implement file upload handling
CC-2.8 □ Build notification system backend
CC-2.9 □ Create data export functionality
CC-2.10 □ SYNC POINT: All APIs documented and tested
```

#### **Cursor Claude Tasks** (User Interface)
```markdown
CU-2.1 □ Build registration/login pages (uses CC-2.1)
CU-2.2 □ Create dashboard interface
CU-2.3 □ Build data tables with sorting/filtering
CU-2.4 □ Design forms for CRUD operations
CU-2.5 □ Create user profile pages
CU-2.6 □ Build settings interface
CU-2.7 □ Design mobile-responsive layouts
CU-2.8 □ Create interactive visualizations
CU-2.9 □ Build onboarding flow
CU-2.10 □ SYNC POINT: All features visually complete
```

### Phase 3: Integration & Testing

#### **Claude Code Tasks** (Testing & Quality)
```markdown
CC-3.1 □ Write unit tests for all utilities
CC-3.2 □ Create integration tests for APIs
CC-3.3 □ Build E2E test scenarios
CC-3.4 □ Set up test data factories
CC-3.5 □ Create performance benchmarks
CC-3.6 □ Build security test suite
CC-3.7 □ Generate test coverage reports
CC-3.8 □ Create load testing scripts
CC-3.9 □ Document testing strategies
CC-3.10 □ SYNC POINT: 80% test coverage achieved
```

#### **Cursor Claude Tasks** (Polish & UX)
```markdown
CU-3.1 □ Fix visual bugs from testing
CU-3.2 □ Improve animations and transitions
CU-3.3 □ Optimize responsive breakpoints
CU-3.4 □ Enhance accessibility features
CU-3.5 □ Improve error messages UX
CU-3.6 □ Add loading optimizations
CU-3.7 □ Create help tooltips
CU-3.8 □ Build keyboard shortcuts
CU-3.9 □ Polish micro-interactions
CU-3.10 □ SYNC POINT: UI polish complete
```

## Synchronization Protocol

### Every 5 Tasks
```markdown
1. Both AIs pause
2. Update project-history.md
3. Review CLAUDE.md for consistency
4. Check for conflicts in recent changes
5. Align on next 5 tasks
```

### Daily Sync Points
```markdown
Morning Sync (Before Starting):
- [ ] Review yesterday's progress
- [ ] Check for blocking dependencies
- [ ] Agree on today's priorities
- [ ] Update task status

Evening Sync (End of Day):
- [ ] Document completed tasks
- [ ] Note any blockers
- [ ] Update project-history.md
- [ ] Plan tomorrow's tasks
```

## Conflict Prevention Rules

### 1. **File Ownership**
```yaml
Claude Code Owns:
  - /api/*
  - /lib/server/*
  - /prisma/*
  - /.github/*
  - /tests/*

Cursor Claude Owns:
  - /components/*
  - /app/* (pages only)
  - /styles/*
  - /public/*
  
Shared (Coordinate):
  - /lib/client/*
  - /hooks/*
  - /types/*
  - /app/api/* (coordinate on routes)
```

### 2. **Communication Patterns**

#### Via CLAUDE.md
```markdown
## Current Work Session - [Date]

### Claude Code Active Tasks:
- Working on: Authentication system
- Files being modified: /api/auth/*, /lib/server/auth.ts
- ETA: 2 hours
- Blocking: None

### Cursor Claude Active Tasks:
- Working on: Login form UI
- Files being modified: /components/auth/*, /app/login/*
- ETA: 1 hour
- Blocked by: Need auth types from CC-1.1
```

#### Via Git Commits
```bash
# Claude Code commits with prefix
git commit -m "CC: Add authentication middleware"

# Cursor Claude commits with prefix  
git commit -m "CU: Design login form component"
```

## Handoff Protocols

### Type 1: Sequential Handoff
```markdown
1. Claude Code completes API endpoint
2. Updates CLAUDE.md with endpoint details
3. Commits with "CC: Ready for UI - [endpoint name]"
4. Cursor Claude builds UI consuming that endpoint
```

### Type 2: Parallel Work Merge
```markdown
1. Both work on separate branches
2. Claude Code on feature/backend-[name]
3. Cursor Claude on feature/frontend-[name]
4. Merge both to develop branch at sync points
```

### Type 3: Review Handoff
```markdown
1. Cursor Claude implements feature
2. Commits with "CU: Ready for review - [feature]"
3. Claude Code reviews and adds tests
4. Claude Code commits "CC: Tests added for [feature]"
```

## Template Checklists

### Claude Code Phase Checklist Template
```markdown
# Claude Code - Phase [X] Checklist
<!-- Focus: Backend, Architecture, Testing, Automation -->

## Sync Requirements
- [ ] Cursor Claude has completed CU-[X-1].10
- [ ] CLAUDE.md is up to date
- [ ] No conflicting work in progress

## Tasks
| ID | Task | Files | Blocks | Time | Status |
|----|------|-------|--------|------|--------|
| CC-X.1 | [Architecture task] | /api/*, /lib/* | None | 30min | Not Started |
| CC-X.2 | [Database task] | /prisma/* | CC-X.1 | 20min | Not Started |
| CC-X.3 | [API task] | /api/* | CC-X.2 | 25min | Not Started |
| CC-X.4 | [Testing task] | /tests/* | CC-X.3 | 20min | Not Started |
| CC-X.5 | SYNC POINT | CLAUDE.md | All above | 5min | Not Started |

## Handoff Preparation
- [ ] Document new APIs in CLAUDE.md
- [ ] Update types in /types/*
- [ ] Commit with clear CC: prefix
- [ ] Note any breaking changes
```

### Cursor Claude Phase Checklist Template
```markdown
# Cursor Claude - Phase [X] Checklist
<!-- Focus: UI, Frontend, Visual Polish, User Experience -->

## Sync Requirements
- [ ] Claude Code has completed CC-[X].5 minimum
- [ ] Required types/APIs are available
- [ ] Component library is ready

## Tasks
| ID | Task | Files | Depends On | Time | Status |
|----|------|-------|------------|------|--------|
| CU-X.1 | [UI Component] | /components/* | CC-X.1 | 20min | Not Started |
| CU-X.2 | [Page Layout] | /app/* | CU-X.1 | 15min | Not Started |
| CU-X.3 | [Form/Input] | /components/* | CC-X.2 | 25min | Not Started |
| CU-X.4 | [Visual Polish] | /styles/* | CU-X.3 | 15min | Not Started |
| CU-X.5 | SYNC POINT | CLAUDE.md | All above | 5min | Not Started |

## Integration Checklist
- [ ] Test with real API endpoints
- [ ] Verify responsive design
- [ ] Check accessibility
- [ ] Update component docs
```

## Performance Metrics

### Measuring Success
```markdown
Weekly Metrics:
- Tasks completed by each AI
- Sync conflicts encountered
- Handoff efficiency (time between handoffs)
- Rework required (changes to other AI's code)
- Overall velocity increase

Target Metrics:
- Zero sync conflicts per week
- <30 min average handoff time
- <5% rework rate
- 3-5x velocity vs single AI
```

## Emergency Protocols

### Conflict Resolution
```markdown
If both AIs modify same file:
1. STOP both AIs immediately
2. Review changes in Git
3. Manually merge if possible
4. Update ownership rules
5. Document in project-history.md
6. Resume with clear ownership
```

### Context Loss Recovery
```markdown
If one AI loses context:
1. Stop affected AI
2. Have it read:
   - project-history.md
   - CLAUDE.md  
   - Recent commits
3. Review last 5 completed tasks
4. Verify understanding with test task
5. Resume normal operations
```

## Best Practices

### DO's
✅ Update CLAUDE.md every 5 tasks
✅ Use clear commit prefixes (CC: or CU:)
✅ Respect file ownership boundaries
✅ Communicate blockers immediately
✅ Sync at natural pause points
✅ Document decisions in ADRs

### DON'Ts
❌ Work on same files simultaneously
❌ Skip sync points
❌ Make assumptions about other AI's work
❌ Change interfaces without coordination
❌ Rush through handoffs
❌ Ignore test failures

## Quick Reference

### Command Aliases
```bash
# Add to your shell profile
alias cc-sync="git add . && git commit -m 'CC: Sync point - updating CLAUDE.md' && git push"
alias cu-sync="git add . && git commit -m 'CU: Sync point - updating component library' && git push"
alias ai-status="git log --oneline -10 | grep -E 'CC:|CU:'"
alias ai-conflicts="git diff --name-only HEAD~5"
```

### VS Code/Cursor Tasks
```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Sync Claude Code",
      "type": "shell",
      "command": "echo 'Syncing with Claude Code' && git pull && npm run test",
      "group": "none"
    },
    {
      "label": "Sync Cursor Claude",
      "type": "shell",
      "command": "echo 'Syncing with Cursor' && git pull && npm run lint",
      "group": "none"
    }
  ]
}
```

## Appendix: Sample Working Session

### Morning Session (2 hours)
```markdown
9:00 AM - Morning Sync
- Both AIs read project-history.md
- Review today's goals

9:15 AM - Parallel Work Begins
- Claude Code: Implements user service (CC-2.1 to CC-2.3)
- Cursor Claude: Builds component library (CU-1.1 to CU-1.3)

10:00 AM - Mini Sync
- Quick status check
- No conflicts, continue

10:45 AM - Handoff Point
- Claude Code: Completes auth API, commits
- Cursor Claude: Begins login form using new API

11:00 AM - Session End
- Update project-history.md
- Plan afternoon tasks
```

This strategy ensures both AIs work efficiently together, maximizing the 5-30x productivity gains while minimizing conflicts and rework.