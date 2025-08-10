# Phase 0: Project Setup & Configuration - Cursor Claude
<!-- Focus: Frontend Setup, UI Framework, Developer Experience, Visual Configuration -->

## Overview
Cursor Claude handles the visual development environment, UI framework setup, and developer experience while coordinating with Claude Code's backend architecture.

## Prerequisites
- [ ] Claude Code has completed CC-0.1 (Git repository initialized)
- [ ] Project open in Cursor IDE
- [ ] Node.js and npm installed
- [ ] Access to CLAUDE.md for reading architecture decisions

## Success Criteria
- [ ] Complete frontend development environment
- [ ] UI component library installed and configured
- [ ] Developer tools and linting set up
- [ ] Visual design system established
- [ ] Ready to build UI components in Phase 1

## Detailed Checklist

| ID | Task | Files/Location | Waits For | Time | Status | Integration Notes |
|----|------|---------------|-----------|------|--------|------------------|
| CU-0.1 | Wait for Git repository | - | CC-0.1 | 0 min | Blocked | Must wait for Claude Code |
| CU-0.2 | Initialize Next.js with App Router | `/` | CU-0.1 | 5 min | Not Started | Frontend framework setup |
| CU-0.3 | Configure Tailwind CSS | `tailwind.config.ts` | CU-0.2 | 10 min | Not Started | Styling framework |
| CU-0.4 | Set up CSS variables for theming | `app/globals.css` | CU-0.3 | 10 min | Not Started | Color system, spacing |
| CU-0.5 | Install shadcn/ui CLI | - | CU-0.3 | 3 min | Not Started | Component library tool |
| CU-0.6 | Initialize shadcn/ui components | `components.json` | CU-0.5 | 5 min | Not Started | Base component setup |
| CU-0.7 | **WAIT POINT** - Check for types | - | CC-0.6 | 0 min | Blocked | 🔄 Need types from backend |
| CU-0.8 | Configure ESLint for React | `.eslintrc.json` | CU-0.2 | 5 min | Not Started | Code quality |
| CU-0.9 | Set up Prettier | `.prettierrc` | CU-0.8 | 3 min | Not Started | Code formatting |
| CU-0.10 | Configure VS Code/Cursor settings | `.vscode/settings.json` | CU-0.9 | 5 min | Not Started | Editor configuration |
| CU-0.11 | **SYNC POINT** - Read backend types | `CLAUDE.md` | CC-0.11 | 5 min | Blocked | 📖 Read architecture decisions |
| CU-0.12 | Install UI dependencies | `package.json` | CU-0.11 | 5 min | Not Started | Icons, fonts, utilities |
| CU-0.13 | Set up Husky and lint-staged | `.husky/*` | CU-0.9 | 5 min | Not Started | Git hooks for quality |
| CU-0.14 | Create base layout structure | `app/layout.tsx` | CU-0.12 | 10 min | Not Started | Root layout with providers |
| CU-0.15 | Configure font loading | `app/layout.tsx` | CU-0.14 | 5 min | Not Started | Google Fonts or local |
| CU-0.16 | Set up dark mode support | `components/theme-provider.tsx` | CU-0.14 | 10 min | Not Started | Theme switching |
| CU-0.17 | Create development homepage | `app/page.tsx` | CU-0.14 | 10 min | Not Started | Landing page placeholder |
| CU-0.18 | Set up Storybook (optional) | `.storybook/*` | CU-0.6 | 15 min | Not Started | Component development |
| CU-0.19 | Configure path aliases | `tsconfig.json` | CU-0.11 | 5 min | Not Started | @/components, @/lib imports |
| CU-0.20 | **SYNC POINT** - Frontend ready | `CLAUDE.md` | All | 5 min | Not Started | ✅ Update status for CC |

## Git Commit Strategy
```bash
# Use CU: prefix for all commits
git add .
git commit -m "CU: Set up Next.js with Tailwind CSS"
git push

# After sync points
git commit -m "CU: SYNC - Frontend framework configured"
```

## Coordination Communication Template
```markdown
## Cursor Claude Status - Phase 0 Progress

### ✅ Completed Setup:
- Next.js 15 with App Router configured
- Tailwind CSS with custom theme
- shadcn/ui component library ready
- ESLint and Prettier configured
- Dark mode support enabled
- Development environment optimized

### 🎨 Ready for Phase 1:
- Component structure: /components/ui/*, /components/layout/*
- Styling system: Tailwind + CSS variables
- Type imports working: @/types/generated
- API client accessible: @/lib/api-client

### 📝 Waiting on Claude Code:
- Need user authentication types (CC-0.11)
- Need API endpoint documentation
- Need database schema for forms

### 🎯 Next CU Tasks (Phase 1):
- Build layout components (Header, Footer, Nav)
- Create form components with proper types
- Design dashboard UI structure
- Implement responsive design system

### ⚠️ Notes for Claude Code:
- Using shadcn/ui - components in /components/ui
- Dark mode via next-themes provider
- All forms will use react-hook-form + zod
```

## Coordination Rules

### What Cursor Claude OWNS in Phase 0:
- `/app/*` - Next.js pages (except /app/api)
- `/components/*` - All UI components
- `/styles/*` - Global styles and themes
- `/public/*` - Static assets and images
- `tailwind.config.ts` - Tailwind configuration
- `.prettierrc` - Formatting rules
- `.eslintrc.json` - Linting rules (UI-specific)
- `.vscode/*` - Editor settings

### What Cursor Claude must NOT touch:
- `/api/*` - API routes (Claude Code territory)
- `/lib/server/*` - Server utilities
- `/prisma/*` - Database files
- `/tests/*` - Test files (unless UI tests)
- `.github/*` - CI/CD configuration
- `/types/generated.ts` - Auto-generated types

### Dependencies on Claude Code:
- Cannot start CU-0.1 until CC-0.1 completes
- Cannot properly type components until CC-0.11
- Cannot build auth UI until CC-0.8 documented

## Common Issues & Solutions

### Issue: Types not available yet
**Solution:** Create temporary types
```typescript
// components/temp-types.ts
// TODO: Replace with generated types from CC-0.11
export interface User {
  id: string
  email: string
  name?: string
}
```

### Issue: API endpoints not documented
**Solution:** Create mock API calls
```typescript
// lib/api-mock.ts
// TODO: Replace with real API from Claude Code
export const mockApi = {
  login: async (email: string, password: string) => {
    // Temporary mock
    return { user: { id: '1', email } }
  }
}
```

### Issue: Styling conflicts with Claude Code
**Solution:** Scope styles carefully
```css
/* Only style components, not API responses */
.component-class { /* UI styling */ }
/* Never style .api-* or .server-* classes */
```

## Visual Setup Checklist

### Design System Configuration:
```typescript
// tailwind.config.ts essentials
{
  theme: {
    extend: {
      colors: {
        // Semantic colors that Claude Code can reference
        primary: { /* shades */ },
        secondary: { /* shades */ },
        success: 'var(--success)',
        error: 'var(--error)',
      }
    }
  }
}
```

### Component Structure:
```
/components
  /ui          # shadcn/ui components (Button, Card, etc)
  /layout      # Layout components (Header, Footer)
  /forms       # Form components (once types available)
  /features    # Feature-specific components
```

## Verification Before Phase 1

### Cursor Claude Must Verify:
```bash
# 1. Development server runs
npm run dev
# Should see Next.js app at localhost:3000

# 2. Linting works
npm run lint
# Should pass with no errors

# 3. Build succeeds
npm run build
# Should compile without errors

# 4. Component library works
# Test by adding a shadcn component
npx shadcn-ui add button

# 5. Dark mode toggles
# Visual test in browser
```

### Pre-Phase 1 Checklist:
- [ ] Can import types from @/types
- [ ] Can import API client from @/lib
- [ ] Tailwind IntelliSense working
- [ ] ESLint catching React issues
- [ ] Git hooks running on commit

## Handoff Preparation for Phase 1

### What Claude Code needs to know:
```markdown
## Frontend Stack Decisions:
- Form handling: react-hook-form + zod validation
- State management: React Context (may add Zustand if needed)
- Data fetching: SWR or TanStack Query (TBD)
- Animation: Framer Motion for complex, CSS for simple
- Toast/Notifications: sonner (via shadcn/ui)

## Component Patterns:
- All components are functional with TypeScript
- Using forwardRef for components that need refs
- Composition pattern for complex components
- Accessibility-first approach (ARIA labels, keyboard nav)
```

## Phase 0 Complete Criteria
- [ ] ✅ All 20 tasks complete (except blocked items)
- [ ] ✅ Development server runs
- [ ] ✅ No build errors
- [ ] ✅ Component library functional
- [ ] ✅ Dark mode working
- [ ] ✅ CLAUDE.md read and understood
- [ ] ✅ Ready to build UI components

## Next Phase
Once complete and Claude Code has finished CC-0.20, proceed to [Phase 1: Cursor Claude UI](phase-1-cursor-claude.md)