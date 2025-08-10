# Phase 0: Project Setup & Configuration - Claude Code
<!-- Focus: Backend Architecture, Database, API Structure, Testing Framework -->

## Overview
Claude Code handles the deep architectural decisions, database setup, API structure, and automation framework while Cursor Claude handles the visual setup and developer experience.

## Prerequisites
- [ ] Project repository created
- [ ] Claude Code installed (`npm install -g @anthropic-ai/claude-code`)
- [ ] Running in project root directory
- [ ] CLAUDE.md file exists for context persistence

## Success Criteria
- [ ] Complete backend architecture established
- [ ] Database schema designed and implemented
- [ ] API structure created
- [ ] Testing framework configured
- [ ] CI/CD pipeline operational
- [ ] Handoff ready for Cursor Claude frontend setup

## Detailed Checklist

| ID | Task | Files/Location | Dependencies | Time | Status | Handoff Notes |
|----|------|---------------|-------------|------|--------|---------------|
| CC-0.1 | Initialize Git repository with .gitignore | `/` | - | 2 min | Not Started | Sets foundation for version control |
| CC-0.2 | Create comprehensive project structure | `/src/*` | CC-0.1 | 5 min | Not Started | Creates api/, lib/, types/ folders |
| CC-0.3 | Set up TypeScript configuration (strict) | `tsconfig.json` | CC-0.2 | 5 min | Not Started | Enables strict mode, path aliases |
| CC-0.4 | Initialize Prisma with SQLite | `/prisma/*` | CC-0.2 | 5 min | Not Started | Local-first development approach |
| CC-0.5 | Design initial database schema | `prisma/schema.prisma` | CC-0.4 | 15 min | Not Started | Users, auth, core entities |
| CC-0.6 | **SYNC POINT** - Document schema | `CLAUDE.md` | CC-0.5 | 5 min | Not Started | ⚠️ CU must wait for this |
| CC-0.7 | Create base API route structure | `/api/*` | CC-0.5 | 10 min | Not Started | RESTful endpoints skeleton |
| CC-0.8 | Set up authentication system | `/lib/auth/*` | CC-0.7 | 20 min | Not Started | JWT/session management |
| CC-0.9 | Create API client and types | `/lib/api-client.ts` | CC-0.8 | 15 min | Not Started | Typed API calls for frontend |
| CC-0.10 | Generate TypeScript types from schema | `/types/generated.ts` | CC-0.9 | 5 min | Not Started | Auto-generated from Prisma |
| CC-0.11 | **HANDOFF** - Types ready for UI | `CLAUDE.md` | CC-0.10 | 2 min | Not Started | 🔄 Cursor can start components |
| CC-0.12 | Set up testing framework (Vitest) | `vitest.config.ts` | CC-0.2 | 10 min | Not Started | Unit and integration tests |
| CC-0.13 | Create test utilities and mocks | `/tests/utils/*` | CC-0.12 | 10 min | Not Started | Test helpers, fixtures |
| CC-0.14 | Write first API tests | `/tests/api/*` | CC-0.13 | 15 min | Not Started | Smoke tests for endpoints |
| CC-0.15 | Set up GitHub Actions CI | `.github/workflows/ci.yml` | CC-0.14 | 10 min | Not Started | Automated testing |
| CC-0.16 | Create database seed script | `/prisma/seed.ts` | CC-0.5 | 10 min | Not Started | Development data |
| CC-0.17 | Set up environment variables | `.env.example` | CC-0.8 | 5 min | Not Started | Document all env vars |
| CC-0.18 | Configure error handling | `/lib/errors.ts` | CC-0.9 | 10 min | Not Started | Centralized error management |
| CC-0.19 | Create logging system | `/lib/logger.ts` | CC-0.18 | 10 min | Not Started | Structured logging |
| CC-0.20 | **SYNC POINT** - Backend ready | `CLAUDE.md` | All | 5 min | Not Started | ✅ Full backend foundation complete |

## Git Commit Strategy
```bash
# Use CC: prefix for all commits
git add .
git commit -m "CC: Initialize project architecture and database"
git push

# After sync points
git commit -m "CC: SYNC - Database schema documented in CLAUDE.md"
```

## Handoff Communication Template
```markdown
## Claude Code Handoff - Phase 0 Complete

### ✅ Completed Setup:
- Database schema with User, Session, [other] tables
- API routes at /api/v1/* 
- Authentication system using JWT
- TypeScript types in /types/generated.ts
- Testing framework with Vitest
- CI/CD pipeline via GitHub Actions

### 📦 Available for Frontend:
- Typed API client: import { apiClient } from '@/lib/api-client'
- User types: import { User, Session } from '@/types/generated'
- Auth hooks ready in: /lib/auth/hooks.ts

### ⚠️ Important Notes:
- Database uses SQLite for development (no Docker needed)
- Auth endpoints: POST /api/auth/login, /api/auth/register
- All API responses follow { data?, error? } pattern

### 🔄 Cursor Claude can now:
- Start building UI components with proper types
- Use the API client for data fetching
- Implement auth UI with provided hooks

### 📝 Next CC Tasks (Phase 1):
- Will implement business logic after UI components exist
- Will add complex queries once data models are tested
```

## Coordination Rules

### What Claude Code OWNS in Phase 0:
- `/api/**/*` - All API routes
- `/lib/server/*` - Server-side utilities  
- `/lib/auth/*` - Authentication logic
- `/prisma/*` - Database schema and migrations
- `/tests/*` - Test files
- `.github/*` - CI/CD configuration
- `/types/generated.ts` - Auto-generated types

### What Claude Code must NOT touch:
- `/components/*` - UI components (Cursor territory)
- `/app/*` - Next.js pages (except api routes)
- `/styles/*` - Styling files
- `.prettierrc` - Formatting config (Cursor manages)
- `/public/*` - Static assets

### Blocking Dependencies for Cursor:
- CU-0.1 blocked until CC-0.1 complete (Git repo)
- CU-0.8 blocked until CC-0.6 complete (needs types)
- CU-1.1 blocked until CC-0.11 complete (component types)

## Common Issues & Solutions

### Issue: Cursor Claude started before types ready
**Solution:** 
```bash
# Claude Code quickly generates types
npx prisma generate
git add types/
git commit -m "CC: URGENT - Generated types for Cursor"
git push
```

### Issue: API route naming conflict
**Solution:** Follow strict convention
```typescript
// Claude Code always uses:
/api/v1/[resource]/[action]
// Never: /api/[resource] (might conflict with Next.js)
```

### Issue: Database schema needs change after UI built
**Solution:** 
```bash
# Create migration, not direct edit
npx prisma migrate dev --name update_schema
# Update types
npx prisma generate
# Commit with BREAKING prefix
git commit -m "CC: BREAKING - Schema change, regenerate types"
```

## Verification Before Handoff

### Claude Code Must Verify:
```bash
# 1. All tests pass
npm run test

# 2. Build succeeds
npm run build

# 3. Types are generated
npx prisma generate

# 4. Database is seeded
npm run db:seed

# 5. API documentation updated
# Update CLAUDE.md with all endpoints
```

### Communication Checklist:
- [ ] CLAUDE.md updated with architecture decisions
- [ ] API endpoints documented with examples
- [ ] Types exported and documented
- [ ] Breaking changes clearly noted
- [ ] Handoff message posted in project

## Phase 0 Complete Criteria
- [ ] ✅ All 20 tasks complete
- [ ] ✅ Tests passing (even if minimal)
- [ ] ✅ No TypeScript errors
- [ ] ✅ CLAUDE.md fully updated
- [ ] ✅ Handoff communication sent
- [ ] ✅ Cursor Claude unblocked for UI work

## Next Phase
Once complete and Cursor Claude has finished CU-0.20, proceed to [Phase 1: Claude Code Backend](phase-1-claude-code.md)