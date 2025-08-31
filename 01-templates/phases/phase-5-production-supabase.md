# Phase 5: Production Setup & Supabase Migration

## Overview
This final phase involves migrating the application from a local SQLite setup to a production-ready environment using Supabase for the database and Vercel for deployment.

## Success Criteria
- [ ] The application is successfully deployed to Vercel.
- [ ] The database is migrated from SQLite to a production Supabase (PostgreSQL) instance.
- [ ] Production authentication is handled by Supabase Auth.
- [ ] Row Level Security (RLS) is enabled and configured for all necessary tables.
- [ ] The live application is stable, performant, and secure.

## Detailed Checklist

| ✓ | Task                                     | File/Location                                 | Dependencies                      | Time    | Status      | Notes                                                         |
|---|------------------------------------------|-----------------------------------------------|-----------------------------------|---------|-------------|---------------------------------------------------------------|
| [ ] | **Supabase Project Setup**               |                                               |                                   |         |             |                                                               |
| [ ] | Create a new project on Supabase         | [Supabase Dashboard](https://supabase.com/dashboard) | Supabase Account                  | 10 min  | Not Started | Choose a region close to your users.                          |
| [ ] | Get production database credentials      | Supabase Dashboard → Settings → Database      | Supabase Project                  | 5 min   | Not Started | Use the connection pooler string for serverless environments. |
| [ ] | Get production API keys                | Supabase Dashboard → Settings → API           | Supabase Project                  | 5 min   | Not Started | `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`   |
| [ ] | **Database Migration**                   |                                               |                                   |         |             |                                                               |
| [ ] | Update Prisma schema for PostgreSQL    | `prisma/schema.prisma`                        | Supabase Credentials              | 10 min  | Not Started | Change provider from `sqlite` to `postgresql`.                |
| [ ] | Push Prisma schema to Supabase           | Terminal                                      | Updated Schema                    | 10 min  | Not Started | `npx prisma db push`                                          |
| [ ] | Migrate data (if necessary)            | Custom script / CSV export-import             | Schema Pushed                     | 1-2 hrs | Not Started | For existing data; can be skipped for new projects.         |
| [ ] | **Authentication Migration**             |                                               |                                   |         |             |                                                               |
| [ ] | Disable NextAuth.js credentials provider | `src/app/api/auth/[...nextauth]/route.ts`     | Supabase Project                  | 10 min  | Not Started | Switch to a Supabase provider or remove NextAuth.js.        |
| [ ] | Integrate Supabase Auth client         | `src/lib/supabase-client.ts`                  | Supabase API Keys                 | 20 min  | Not Started | Use `@supabase/auth-helpers-nextjs`.                          |
| [ ] | Update login/signup forms              | `src/components/auth/`                        | Supabase Auth Client              | 30 min  | Not Started | Use `supabase.auth.signInWithPassword` and `signUp`.        |
| [ ] | Update session management              | `middleware.ts` / server components           | Supabase Auth Client              | 20 min  | Not Started | Get session from Supabase instead of NextAuth.js.           |
| [ ] | **Security Configuration**               |                                               |                                   |         |             |                                                               |
| [ ] | Enable Row Level Security (RLS) on tables| Supabase Dashboard → Auth → Policies          | Database Migrated                 | 60 min  | Not Started | Create policies for all tables that handle sensitive data.    |
| [ ] | Test RLS policies thoroughly           | Application / Tests                           | RLS Enabled                       | 45 min  | Not Started | Ensure users can only access data they are allowed to.      |
| [ ] | **Deployment**                           |                                               |                                   |         |             |                                                               |
| [ ] | Create a new project on Vercel         | [Vercel Dashboard](https://vercel.com)        | Vercel Account, GitHub Repo       | 10 min  | Not Started | Connect your GitHub repository.                             |
| [ ] | Add production environment variables   | Vercel Dashboard → Settings → Env Vars        | Supabase Credentials & Keys       | 15 min  | Not Started | Add all `SUPABASE_*` and other production secrets.          |
| [ ] | Trigger initial deployment             | Vercel Dashboard / Git Push                   | Vercel Project                    | 10 min  | Not Started | Push to the main branch to deploy.                            |
| [ ] | Set up custom domain (optional)        | Vercel Dashboard → Settings → Domains         | Deployed App                      | 15 min  | Not Started | Point your domain's DNS records to Vercel.                  |
| [ ] | **Post-Deployment**                      |                                               |                                   |         |             |                                                               |
| [ ] | Run E2E tests against production       | Playwright                                    | Deployed App                      | 30 min  | Not Started | Verify all critical user flows work on the live site.       |
| [ ] | Set up monitoring and analytics        | Vercel Analytics / Sentry / etc.              | Deployed App                      | 20 min  | Not Started | Monitor performance and errors.                               |
| [ ] | Update project history and README      | `_docs/`, `README.md`                         | Successful Deployment             | 15 min  | Not Started | Log project launch and update setup instructions.             |
