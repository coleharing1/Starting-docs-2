# Project Conventions & Context
<!-- This file serves as persistent memory for Claude Code and Cursor AI sessions -->
<!-- It stores conventions, decisions, and context that persist across sessions -->
<!-- Update this file as your project evolves to maintain AI assistant effectiveness -->

## Project Overview
<!-- Brief description of what this project does and its main goals -->
[Project description here]

## Architecture Decisions
<!-- Document key architectural choices and their rationale -->

### Tech Stack
- **Frontend**: [e.g., Next.js (current LTS), React (current LTS)]
- **Backend**: [e.g., Supabase, Edge Functions]
- **Database**: [e.g., PostgreSQL via Supabase]
- **Styling**: [e.g., Tailwind CSS]
- **Testing**: [e.g., Vitest, Playwright]
- **Deployment**: [e.g., Vercel]

### Design Patterns
- Functional components with hooks (no class components)
- Server components by default, client components when needed
- Composition over inheritance
- Error boundaries for graceful failure handling

## Code Conventions

### File Structure
```
src/
├── app/           # Next.js app router pages
├── components/    # Reusable UI components
├── lib/          # Utilities and helpers
├── hooks/        # Custom React hooks
├── types/        # TypeScript type definitions
└── styles/       # Global styles (if any)
```

### Naming Conventions
- **Files**: kebab-case (e.g., `user-profile.tsx`)
- **Components**: PascalCase (e.g., `UserProfile`)
- **Functions**: camelCase (e.g., `getUserData`)
- **Constants**: UPPER_SNAKE_CASE (e.g., `MAX_RETRIES`)
- **Types/Interfaces**: PascalCase with `T` or `I` prefix (e.g., `TUser`, `IApiResponse`)

### Code Style Rules
- Max file length: 500 lines
- Descriptive variable names with auxiliary verbs (isLoading, hasError)
- JSDoc/TSDoc comments for all public functions
- Prefer `function` keyword for pure functions
- Use maps over enums
- Throw errors instead of silent failures
- No magic numbers (use named constants)

## API Conventions
<!-- Document API patterns, auth methods, error handling -->

### Endpoints
- REST pattern: `/api/v1/resource`
- Use HTTP methods semantically (GET, POST, PUT, DELETE)
- Return consistent error format: `{ error: string, code: number, details?: any }`

### Authentication
- Supabase Auth with JWT tokens
- Row Level Security (RLS) enabled on all tables
- Service role key only for server-side operations

## Database Schema
<!-- High-level overview of main tables and relationships -->

### Key Tables
- `users`: User profiles and settings
- `[other tables]`: [descriptions]

### Migration Strategy
- All schema changes via migrations (`npx supabase migration new`)
- Test locally with `npx supabase db reset`
- Push to production with `npx supabase db push`

## Testing Strategy
<!-- Testing approach and requirements -->

- Unit tests: 80% coverage minimum
- Integration tests for critical paths
- E2E tests for main user flows
- Run tests before commits (git hooks)
- AI-generated code must include tests

## Environment Variables
<!-- List of required env vars and their purposes -->

```env
# Supabase
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=

# Other services
[Add as needed]
```

## Current Development Status
<!-- Track what's been built, what's in progress, what's planned -->

### Completed
- [ ] Initial setup and configuration
- [ ] Database schema design
- [ ] Authentication flow

### In Progress
- [ ] [Current feature/task]

### Planned
- [ ] [Future features]

## Recent Changes Tracker
<!-- Quick reference for recent work - complements project-history.md -->
<!-- Update this every 5-10 file changes to maintain context -->

### Last Updated: [Date]
**Files Modified Recently:**
- [List last 5-10 files worked on]

**Session Notes:**
- [Quick notes about current work focus]
- [Any blockers or decisions pending]

**Reminder**: Update @project-history.md every 5-10 file changes for detailed context persistence

## Known Issues & Workarounds
<!-- Document any quirks, bugs, or temporary solutions -->

- Issue: [Description]
  - Workaround: [Solution]

## Performance Considerations
<!-- Key performance decisions and optimizations -->

- Image optimization with Next.js Image component
- Database connection pooling via Supabase
- Static generation where possible
- Client-side caching strategy

## Security Notes
<!-- Security-specific decisions and requirements -->

- Never expose service role key to client
- Validate all user inputs
- Sanitize data before database operations
- Use prepared statements for SQL
- Enable RLS on all Supabase tables

## Deployment Notes
<!-- Deployment-specific configurations and processes -->

- Auto-deploy on push to main (Vercel)
- Preview deployments for PRs
- Environment variables set in Vercel dashboard
- Database migrations run before code deploy

## Team Conventions
<!-- If working with others, document team agreements -->

- PR reviews required before merge
- Commit message format: `type: description`
- Branch naming: `feature/description` or `fix/description`

## AI Assistant Instructions
<!-- Specific instructions for AI tools working with this codebase -->

1. Always reference existing patterns before creating new components
2. Include tests with any new functionality
3. Update this file when making architectural decisions
4. Ask for clarification rather than making assumptions
5. Prioritize security and performance in suggestions
6. Use existing UI components from the design system
7. Follow the established error handling patterns

## Useful Commands
<!-- Quick reference for common commands -->

```bash
# Development
npm run dev              # Start dev server
npm run build           # Build for production
npm run test            # Run tests
npm run test:coverage   # Run tests with coverage

# Database
npx supabase start      # Start local Supabase
npx supabase db reset   # Reset local database
npx supabase migration new <name>  # Create new migration
npx supabase db push    # Push migrations to production

# Deployment
git push origin main    # Deploy to production
vercel --prod          # Manual production deploy
```

## References
<!-- Links to important documentation -->

- [Project Documentation](@START-HERE.md)
- [Database Guide](@DATABASE-OVERVIEW.md)
- [Testing Rules](@TESTING-RULES-TEMPLATE.md)
- [API Rules](@API-RULES-TEMPLATE.md)
- [Theme Rules](@THEME-RULES-TEMP.md)

---
*Last Updated: [Date]*
*Version: 1.0.0*