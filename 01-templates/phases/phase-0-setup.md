# Phase 0: Project Setup & Configuration

## Overview
**Objective**: Set up a complete, production-ready development environment and project foundation without implementing any features. This checklist is the single source of truth for Phase 0.

**Duration**: 2-4 hours for beginners

**Success Criteria**:
- [ ] Development environment fully configured.
- [ ] All dependencies installed and working.
- [ ] Git repository initialized with proper structure and remote connection.
- [ ] AI tools (`.cursor/` rules, `CLAUDE.md`) are configured.
- [ ] The project runs locally without errors (`npm run dev`).
- [ ] Linting, formatting, and testing commands execute successfully.
- [ ] Git hooks trigger on commit.
- [ ] CI/CD pipeline runs on push.

---

## Detailed Checklist

### 1. Environment Setup

| ✓ | Task | File/Location | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Install Node.js (v18+) | System | None | 10 min | Not Started | Use `nvm` for version management. Check with `node -v`. |
| [ ] | Install Cursor AI | System | None | 5 min | Not Started | Download from [cursor.com](https://cursor.com) |
| [ ] | Install Git | System | None | 5 min | Not Started | [git-scm.com](https://git-scm.com) |
| [ ] | Create GitHub account | github.com | Git installed | 5 min | Not Started | Free account is sufficient. |

### 2. Project Initialization

| ✓ | Task | File/Location | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Run `setup.sh` script | `/` | Environment Setup | 5 min | Not Started | `chmod +x setup.sh && ./setup.sh`. This bootstraps the project. |
| [ ] | Open project in Cursor | Editor | `setup.sh` complete | 1 min | Not Started | `File > Open Folder...` |
| [ ] | Test development server | Terminal | Project created | 2 min | Not Started | `npm run dev`. Visit `localhost:3000`. |
| [ ] | Create initial commit | Terminal | Git repo initialized | 2 min | Not Started | `git add . && git commit -m "feat: initial project setup"` |

### 3. Configuration Files

| ✓ | Task | File/Location | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Review TypeScript config | `tsconfig.json` | Next.js app | 5 min | Not Started | Ensure `strict: true` and path aliases are correct. |
| [ ] | Review ESLint config | `.eslintrc.json` | Next.js app | 5 min | Not Started | Customize rules as needed. |
| [ ] | Review Prettier config | `.prettierrc` | Project | 2 min | Not Started | Adjust formatting rules if necessary. |
| [ ] | Verify `.gitignore` | `.gitignore` | Git repo | 3 min | Not Started | Ensure `.env.local`, `node_modules`, `prisma/dev.db` are listed. |
| [ ] | Create & fill `.env.local` | `.env.local` | Project | 2 min | Not Started | Copy from `.env.local.example` and fill in secrets. |
| [ ] | Configure Tailwind theme | `tailwind.config.ts` | Tailwind installed | 10 min | Not Started | Add custom colors, fonts, and plugins per `theme-rules.md`. |

### 4. Project & Documentation Structure

| ✓ | Task | File/Location | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Verify folder structure | `/src` | Project created | 2 min | Not Started | `components`, `lib`, `hooks`, `types` should exist. |
| [ ] | Add initial ideas | `project_brainstorm/` | Project created | 10 min | Not Started | Create `initial-ideas.md`, `requirements.md`, etc. |
| [ ] | Create `_docs` structure | `/_docs` | Project created | 2 min | Not Started | Ready for generated docs. |
| [ ] | Initialize `CLAUDE.md` | `CLAUDE.md` | Project created | 5 min | Not Started | Add project overview and tech stack for AI context. |
| [ ] | Configure Cursor AI rules | `.cursor/rules/` | Cursor installed | 10 min | Not Started | Copy templates from `01-templates/ai-config/.cursor/`. |
| [ ] | Initialize `project-history.md` | `/_docs/project-history.md` | _docs folder | 2 min | Not Started | Add the first entry for project setup. |

### 5. Version Control & CI/CD

| ✓ | Task | File/Location | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Create GitHub repository | github.com | GitHub account | 5 min | Not Started | Keep it private initially. |
| [ ] | Add remote and push | Terminal | GitHub repo | 2 min | Not Started | `git remote add origin [url]` then `git push -u origin main`. |
| [ ] | Set up branch protection | GitHub settings | GitHub repo | 5 min | Not Started | Protect the `main` branch from direct pushes. |
| [ ] | Configure Vercel project | Vercel Dashboard | GitHub repo | 5 min | Not Started | Connect your GitHub repo for auto-deployments. |
| [ ] | Verify GitHub Actions CI | `.github/workflows/ci.yml`| GitHub repo | 5 min | Not Started | CI should run on the first push and pass. |

### 6. Development Tools & Database

| ✓ | Task | File/Location | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Install editor extensions | VS Code/Cursor | Editor | 5 min | Not Started | ESLint, Prettier, Tailwind CSS IntelliSense, Prisma. |
| [ ] | Configure editor settings | `.vscode/settings.json` | Editor | 5 min | Not Started | e.g., `"editor.formatOnSave": true`. |
| [ ] | Verify Prisma schema | `prisma/schema.prisma`| Prisma init | 5 min | Not Started | Check the initial schema provided by `setup.sh`. |
| [ ] | Verify database connection | Prisma Studio | Prisma configured | 2 min | Not Started | Run `npm run db:studio` to open the local DB GUI. |

### 7. Final Verification

| ✓ | Task | File/Location | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Test build process | Terminal | Dependencies installed | 3 min | Not Started | `npm run build` should complete without errors. |
| [ ] | Test linting & formatting | Terminal | ESLint/Prettier | 2 min | Not Started | `npm run lint` and `npm run format:check` should pass. |
| [ ] | Test test runner | Terminal | Vitest installed | 1 min | Not Started | `npm run test` should run (even if no tests exist yet). |
| [ ] | Test Git hooks | Terminal | Husky configured | 2 min | Not Started | Make a small change and commit; lint-staged should run. |
| [ ] | Document setup decisions | `_docs/adrs/` | All setup complete | 10 min | Not Started | Create an ADR for any key decisions made. |
| [ ] | Update project history | `_docs/project-history.md`| All setup complete | 5 min | Not Started | Document the completion of Phase 0. |

---

## Common Issues & Solutions

| Issue | Solution |
|---|---|
| **Node.js version too old** | Use `nvm` to switch to Node 18+: `nvm install 18 && nvm use 18`. |
| **Permission denied running script** | Make the script executable: `chmod +x setup.sh`. |
| **Port 3000 already in use** | Find and stop the process (`lsof -i :3000` then `kill -9 [PID]`) or run on a different port (`npm run dev -- -p 3001`). |
| **Prisma client not generated** | Run `npx prisma generate` manually. |

---

## Next Phase
Once all items are complete, proceed to [Phase 1: Frontend Foundation](phase-1-frontend-foundation.md).