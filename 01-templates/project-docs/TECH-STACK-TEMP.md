# Technology Stack Template

## Development Stack (Phase 0-4)
Fast local development without Docker or cloud complexity.

### Core Technologies
- **Language**: TypeScript 5.x
- **Runtime**: Node.js 22+ LTS
- **Package Manager**: pnpm (faster) or npm

### Frontend
- **Framework**: Next.js (current LTS) with App Router
- **UI Library**: React (current LTS)
- **Styling**: Tailwind CSS 3.4+
- **Component Library**: shadcn/ui
- **State Management**: Zustand or React Context
- **Forms**: React Hook Form + Zod validation

### Development Database
- **Database**: SQLite (zero config, file-based)
- **ORM**: Prisma or Drizzle
- **Migrations**: Prisma Migrate or Drizzle Kit
- **Seeding**: Custom seed scripts

### Development Auth
- **Solution**: NextAuth.js with credentials provider
- **Sessions**: JWT or database sessions
- **Testing**: Mock auth for development

### Development Tools
- **TypeScript**: Strict mode enabled
- **Linting**: ESLint with Next.js config
- **Formatting**: Prettier or Biome
- **Git Hooks**: Husky + lint-staged
- **Testing**: Vitest (unit), React Testing Library, Playwright (E2E)

## Production Stack (Phase 5)

### Production Database
- **Database**: PostgreSQL via Supabase
- **Real-time**: Supabase Realtime subscriptions
- **File Storage**: Supabase Storage

### Production Auth
- **Solution**: Supabase Auth
- **Methods**: Email/password, OAuth providers
- **RLS**: Row Level Security policies

### Deployment
- **Platform**: Vercel (optimized for Next.js)
- **CDN**: Vercel Edge Network
- **Analytics**: Vercel Analytics + Web Vitals

## Migration Strategy

### Phase 3 → Phase 5 Migration
1. Export SQLite schema as SQL
2. Create Supabase project
3. Run schema in Supabase SQL editor
4. Update Prisma/Drizzle schema for PostgreSQL
5. Migrate seed data
6. Update environment variables
7. Switch auth from NextAuth to Supabase Auth
8. Test all queries and mutations
9. Enable RLS policies

### Environment Variables
```env
# Development (SQLite)
DATABASE_URL="file:./prisma/dev.db"
NEXTAUTH_SECRET="development-secret"
NEXTAUTH_URL="http://localhost:3000"

# Production (Supabase)
NEXT_PUBLIC_SUPABASE_URL="https://[project].supabase.co"
NEXT_PUBLIC_SUPABASE_ANON_KEY="[anon-key]"
SUPABASE_SERVICE_ROLE_KEY="[service-key]"
```

## Benefits of This Approach

### For Development
- **No Docker required**: SQLite runs directly
- **Instant setup**: No database server to configure
- **Fast iteration**: File-based DB with hot reload
- **Version control**: SQLite file can be committed for demos
- **Offline development**: No internet required

### For Learning
- **Lower complexity**: Focus on app logic, not infrastructure
- **Real SQL experience**: SQLite is production-grade
- **Gradual complexity**: Add cloud services only when needed
- **Cost-effective**: No cloud costs during development

### For Production
- **Battle-tested migration**: SQLite → PostgreSQL is well-supported
- **Proven stack**: Next.js + Vercel + Supabase
- **Scalability**: Can handle significant traffic
- **Developer experience**: Excellent tooling and documentation

## Decision Log
- **Why SQLite first?**: Zero config, perfect for prototyping
- **Why Supabase over raw PostgreSQL?**: Built-in auth, realtime, storage
- **Why Vercel?**: Optimized for Next.js, great DX
- **Why TypeScript?**: Type safety, better AI assistance
- **Why Tailwind?**: Utility-first, works well with component libraries