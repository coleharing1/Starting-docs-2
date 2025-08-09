# Phase 0: Project Setup & Configuration Checklist

**Objective**: Set up the development environment and project foundation without implementing any features.

**Duration**: 2-4 hours for beginners

**Prerequisites**: Computer with internet connection

## Environment Setup

| ✓ | Task | File/Location | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Install Node.js (v18+) | System | None | 10 min | Not Started | Download from nodejs.org |
| [ ] | Install VS Code or Cursor | System | None | 5 min | Not Started | cursor.com for Cursor |
| [ ] | Install Git | System | None | 5 min | Not Started | git-scm.com |
| [ ] | Create GitHub account | github.com | Git installed | 5 min | Not Started | Free account is fine |
| [ ] | Install npm packages globally | Terminal | Node.js | 5 min | Not Started | `npm install -g npm@latest` |

## Project Initialization

| ✓ | Task | File/Location | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Create project folder | `/your-project-name` | None | 1 min | Not Started | Choose descriptive name |
| [ ] | Initialize Git repository | Terminal in project | Git | 2 min | Not Started | `git init` |
| [ ] | Create Next.js app | Terminal | Node.js | 5 min | Not Started | `npx create-next-app@latest . --typescript --tailwind --app` |
| [ ] | Open project in Cursor/VS Code | Editor | Project created | 1 min | Not Started | File → Open Folder |
| [ ] | Test development server | Terminal | Next.js app | 2 min | Not Started | `npm run dev` then visit localhost:3000 |
| [ ] | Create initial commit | Terminal | Git repo | 2 min | Not Started | `git add . && git commit -m "Initial commit"` |

## Configuration Files

| ✓ | Task | File/Location | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Configure TypeScript | `tsconfig.json` | Next.js app | 5 min | Not Started | Set strict mode: true |
| [ ] | Set up ESLint | `.eslintrc.json` | Next.js app | 10 min | Not Started | Add rules for code quality |
| [ ] | Configure Prettier | `.prettierrc` | Project | 5 min | Not Started | Create file with formatting rules |
| [ ] | Add .gitignore entries | `.gitignore` | Git repo | 3 min | Not Started | Add .env.local, node_modules |
| [ ] | Create .env.local | `.env.local` | Project | 2 min | Not Started | For environment variables |
| [ ] | Set up Tailwind config | `tailwind.config.js` | Tailwind installed | 10 min | Not Started | Add custom colors, fonts |

## Project Structure

| ✓ | Task | File/Location | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Create components folder | `/src/components` | Project | 1 min | Not Started | For reusable components |
| [ ] | Create lib folder | `/src/lib` | Project | 1 min | Not Started | For utilities |
| [ ] | Create hooks folder | `/src/hooks` | Project | 1 min | Not Started | For custom React hooks |
| [ ] | Create types folder | `/src/types` | Project | 1 min | Not Started | For TypeScript types |
| [ ] | Create styles folder | `/src/styles` | Project | 1 min | Not Started | For global styles |
| [ ] | Create public/images | `/public/images` | Project | 1 min | Not Started | For static images |
| [ ] | Clean up default files | `/src/app` | Project | 5 min | Not Started | Remove Next.js boilerplate |

## Documentation Setup

| ✓ | Task | File/Location | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Create _docs folder | `/_docs` | Project | 1 min | Not Started | For project documentation |
| [ ] | Create README.md | `/README.md` | Project | 10 min | Not Started | Project overview and setup |
| [ ] | Create CLAUDE.md | `/CLAUDE.md` | Project | 5 min | Not Started | AI context persistence |
| [ ] | Create project-history.md | `/_docs/project-history.md` | _docs folder | 5 min | Not Started | For tracking changes |
| [ ] | Create .cursor folder | `/.cursor` | Project | 1 min | Not Started | For Cursor rules |
| [ ] | Add rules.mdc | `/.cursor/rules.mdc` | .cursor folder | 10 min | Not Started | AI behavior rules |

## Version Control

| ✓ | Task | File/Location | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Create GitHub repository | github.com | GitHub account | 5 min | Not Started | Keep it private initially |
| [ ] | Add remote origin | Terminal | GitHub repo | 2 min | Not Started | `git remote add origin [url]` |
| [ ] | Push initial commit | Terminal | Remote added | 2 min | Not Started | `git push -u origin main` |
| [ ] | Create develop branch | Terminal | Git repo | 2 min | Not Started | `git checkout -b develop` |
| [ ] | Set up branch protection | GitHub settings | GitHub repo | 5 min | Not Started | Protect main branch |

## Development Tools

| ✓ | Task | File/Location | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Install React DevTools | Browser extension | Chrome/Firefox | 2 min | Not Started | For debugging React |
| [ ] | Install Tailwind CSS IntelliSense | VS Code/Cursor | Editor | 2 min | Not Started | For Tailwind autocomplete |
| [ ] | Install ESLint extension | VS Code/Cursor | Editor | 2 min | Not Started | For linting in editor |
| [ ] | Install Prettier extension | VS Code/Cursor | Editor | 2 min | Not Started | For formatting |
| [ ] | Configure editor settings | `.vscode/settings.json` | Editor | 5 min | Not Started | Format on save, etc. |

## SQLite Setup (Development Database)

| ✓ | Task | File/Location | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Install Prisma | Terminal | Project | 3 min | Not Started | `npm install prisma @prisma/client --save-dev` |
| [ ] | Initialize Prisma | Terminal | Prisma installed | 2 min | Not Started | `npx prisma init --datasource-provider sqlite` |
| [ ] | Configure schema.prisma | `/prisma/schema.prisma` | Prisma init | 5 min | Not Started | Set SQLite as provider |
| [ ] | Create database file | `/prisma/dev.db` | Prisma | Auto | Not Started | Created on first migration |
| [ ] | Add database to .gitignore | `.gitignore` | Git | 1 min | Not Started | Add `*.db` and `*.db-journal` |

## Final Setup Tasks

| ✓ | Task | File/Location | Dependencies | Time | Status | Notes |
|---|------|---------------|-------------|------|--------|-------|
| [ ] | Test full setup | Terminal | All above | 5 min | Not Started | Run dev server, check for errors |
| [ ] | Create setup complete commit | Terminal | All complete | 2 min | Not Started | `git commit -m "Phase 0 complete: Project setup"` |
| [ ] | Update project-history.md | `/_docs/project-history.md` | Setup done | 5 min | Not Started | Document Phase 0 completion |
| [ ] | Review Phase 1 checklist | `/_docs/phases/phase-1-checklist.md` | Phase 0 done | 5 min | Not Started | Prepare for next phase |

---

## Completion Criteria
- [ ] Development environment fully configured
- [ ] Project structure created
- [ ] All configuration files in place
- [ ] Git repository set up with remote
- [ ] SQLite database configured
- [ ] No errors when running `npm run dev`
- [ ] Can make changes and see hot reload working

## Notes for Beginners
- Don't skip any steps, even if they seem trivial
- If you get stuck, paste the error into Cursor/Claude
- Commit your work frequently
- Test each configuration change before moving on
- Keep this checklist open and check off items as you complete them

**Next Phase**: Phase 1 - Frontend Foundation & UI Components