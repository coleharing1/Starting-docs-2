# Phase 0: Project Setup & Configuration

## Overview
Initial project setup, environment configuration, and development tooling installation.

## Success Criteria
- [ ] Development environment fully configured
- [ ] All dependencies installed and working
- [ ] Git repository initialized with proper structure
- [ ] AI tools configured (Cursor/Claude Code)
- [ ] Team can run the project locally

## Detailed Checklist

| ✓ | Task | File/Location | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Install Node.js 18+ and npm/pnpm | System | - | 5 min | Not Started | Check with `node -v` |
| [ ] | Create project directory | `/project-name` | Node.js installed | 1 min | Not Started | Use kebab-case naming |
| [ ] | Run setup.sh script | `/` | Project directory created | 3 min | Not Started | `chmod +x setup.sh && ./setup.sh` |
| [ ] | Initialize Next.js with TypeScript | `/` | Setup script complete | 5 min | Not Started | Included in setup.sh |
| [ ] | Configure Tailwind CSS | `tailwind.config.ts` | Next.js initialized | 3 min | Not Started | Included in setup.sh |
| [ ] | Install shadcn/ui | `/src/components` | Tailwind configured | 5 min | Not Started | `npx shadcn-ui init` |
| [ ] | Set up Prisma with SQLite | `/prisma` | Project initialized | 5 min | Not Started | `npx prisma init --datasource-provider sqlite` |
| [ ] | Create folder structure | `/src/*` | Project initialized | 2 min | Not Started | components, lib, hooks, types |
| [ ] | Configure ESLint | `.eslintrc.json` | Project initialized | 3 min | Not Started | Use Next.js config + Prettier |
| [ ] | Configure Prettier | `.prettierrc` | ESLint configured | 2 min | Not Started | Set formatting rules |
| [ ] | Set up Husky git hooks | `/.husky` | Git initialized | 3 min | Not Started | `npx husky-init` |
| [ ] | Configure lint-staged | `.lintstagedrc.json` | Husky installed | 2 min | Not Started | Run linter on commit |
| [ ] | Create .env.local | `.env.local` | - | 2 min | Not Started | Copy from .env.local.example |
| [ ] | Set up .gitignore | `.gitignore` | Git initialized | 1 min | Not Started | Include node_modules, .env.local |
| [ ] | Configure TypeScript | `tsconfig.json` | TypeScript installed | 3 min | Not Started | Strict mode, path aliases |
| [ ] | Initialize Git repository | `/` | Project created | 1 min | Not Started | `git init` |
| [ ] | Create initial commit | `/` | Git initialized | 1 min | Not Started | `git add . && git commit -m "Initial"` |
| [ ] | Set up VS Code/Cursor | `.vscode/settings.json` | - | 5 min | Not Started | Format on save, ESLint integration |
| [ ] | Configure Cursor AI rules | `.cursor/rules.mdc` | Cursor installed | 5 min | Not Started | Copy from template |
| [ ] | Create CLAUDE.md | `CLAUDE.md` | - | 3 min | Not Started | Project context for Claude Code |
| [ ] | Set up project brainstorm folder | `/project_brainstorm` | - | 5 min | Not Started | Add initial ideas and requirements |
| [ ] | Create _docs structure | `/_docs` | - | 2 min | Not Started | phases, project-history folders |
| [ ] | Install testing libraries | `package.json` | npm configured | 5 min | Not Started | Vitest, React Testing Library |
| [ ] | Configure Vitest | `vitest.config.ts` | Vitest installed | 3 min | Not Started | Test configuration |
| [ ] | Set up Playwright | `playwright.config.ts` | - | 5 min | Not Started | E2E testing setup |
| [ ] | Create GitHub repository | GitHub | Git initialized | 3 min | Not Started | Public or private repo |
| [ ] | Push to remote | GitHub | Remote added | 1 min | Not Started | `git push -u origin main` |
| [ ] | Set up GitHub Actions | `.github/workflows/ci.yml` | GitHub repo created | 5 min | Not Started | Copy CI template |
| [ ] | Configure Vercel project | Vercel Dashboard | GitHub connected | 5 min | Not Started | Connect GitHub repo |
| [ ] | Test development server | `localhost:3000` | All setup complete | 2 min | Not Started | `npm run dev` |
| [ ] | Test build process | `.next/` | Dependencies installed | 3 min | Not Started | `npm run build` |
| [ ] | Test linting | Terminal | ESLint configured | 1 min | Not Started | `npm run lint` |
| [ ] | Test formatting | Terminal | Prettier configured | 1 min | Not Started | `npm run format` |
| [ ] | Verify database connection | Prisma Studio | Prisma configured | 2 min | Not Started | `npm run db:studio` |
| [ ] | Document setup decisions | `_docs/decisions.md` | - | 10 min | Not Started | Record why choices were made |
| [ ] | Update README.md | `README.md` | Setup complete | 5 min | Not Started | Project description, setup instructions |
| [ ] | Create project-overview.md | `_docs/project-overview.md` | Brainstorm complete | 15 min | Not Started | Use GROK guide |
| [ ] | Team onboarding | - | Setup complete | 30 min | Not Started | Walk through setup with team |

## Common Issues & Solutions

### Issue: Node version too old
**Solution:** Use nvm to install Node 18+
```bash
nvm install 18
nvm use 18
```

### Issue: Permission denied running scripts
**Solution:** Make scripts executable
```bash
chmod +x setup.sh
```

### Issue: Port 3000 already in use
**Solution:** Kill the process or use different port
```bash
lsof -i :3000
kill -9 [PID]
# or
npm run dev -- -p 3001
```

### Issue: Prisma client not generated
**Solution:** Generate Prisma client
```bash
npx prisma generate
```

## Verification Steps
1. ✅ `npm run dev` starts without errors
2. ✅ `npm run build` completes successfully
3. ✅ `npm run lint` passes
4. ✅ `npm run test` runs (even if no tests yet)
5. ✅ Database connection works (`npm run db:studio`)
6. ✅ Git hooks trigger on commit
7. ✅ GitHub Actions run on push

## Next Phase
Once all items are complete, proceed to [Phase 1: Frontend Foundation](phase-1-frontend-foundation.md)