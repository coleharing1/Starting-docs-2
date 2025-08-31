# Phase 3: Backend Integration with SQLite

## Overview
Connect the frontend features from Phase 2 to a local SQLite database. This phase focuses on implementing API routes, data fetching, and local authentication without touching production infrastructure.

## Success Criteria
- [ ] All frontend features are connected to backend APIs.
- [ ] CRUD operations (Create, Read, Update, Delete) are fully functional.
- [ ] Local authentication (e.g., NextAuth with credentials provider) is working.
- [ ] Data is persisted in the local SQLite database.
- [ ] API routes are tested and documented.

## Detailed Checklist

| ✓ | Task                                     | File/Component                                | Dependencies                      | Time    | Status      | Notes                                                  |
|---|------------------------------------------|-----------------------------------------------|-----------------------------------|---------|-------------|--------------------------------------------------------|
| [ ] | **Database Schema**                      |                                               |                                   |         |             |                                                        |
| [ ] | Finalize Prisma schema for all models    | `prisma/schema.prisma`                        | Phase 2 Feature List              | 30 min  | Not Started | Define all tables, columns, and relations.             |
| [ ] | Generate Prisma client                   | Terminal                                      | Finalized Schema                  | 2 min   | Not Started | `npx prisma generate`                                  |
| [ ] | Create initial migration                 | Terminal                                      | Finalized Schema                  | 5 min   | Not Started | `npx prisma migrate dev --name initial-schema`         |
| [ ] | **API Routes**                           |                                               |                                   |         |             |                                                        |
| [ ] | Set up base API structure                | `src/app/api/`                                | Next.js Project                   | 10 min  | Not Started | Create folders for each resource (e.g., `/api/users`). |
| [ ] | Implement GET routes for all resources   | `src/app/api/[resource]/route.ts`             | Prisma Schema                     | 60 min  | Not Started | Fetch and return lists of data.                        |
| [ ] | Implement POST routes for creation     | `src/app/api/[resource]/route.ts`             | Prisma Schema                     | 45 min  | Not Started | Create new records in the database.                    |
| [ ] | Implement PUT/PATCH routes for updates   | `src/app/api/[resource]/[id]/route.ts`        | Prisma Schema                     | 45 min  | Not Started | Update existing records.                               |
| [ ] | Implement DELETE routes for removal      | `src/app/api/[resource]/[id]/route.ts`        | Prisma Schema                     | 30 min  | Not Started | Delete records from the database.                      |
| [ ] | **Data Fetching**                        |                                               |                                   |         |             |                                                        |
| [ ] | Set up React Query or SWR provider       | `src/app/layout.tsx`                          | API Routes                        | 15 min  | Not Started | Wrap the app in a query client provider.               |
| [ ] | Create custom hooks for data fetching    | `src/hooks/use-resource.ts`                   | Query Provider                    | 60 min  | Not Started | e.g., `useUsers`, `usePosts` with `useQuery`.          |
| [ ] | Implement data mutations               | `src/hooks/use-resource.ts`                   | Query Provider                    | 45 min  | Not Started | Hooks for `create`, `update`, `delete` with `useMutation`. |
| [ ] | Replace mock data with real data calls | All feature components                        | Custom Hooks                      | 90 min  | Not Started | Swap out mock data fetching with React Query hooks.    |
| [ ] | **Authentication**                       |                                               |                                   |         |             |                                                        |
| [ ] | Configure NextAuth.js                    | `src/app/api/auth/[...nextauth]/route.ts`     | Database Schema                   | 30 min  | Not Started | Set up Credentials provider with database lookup.      |
| [ ] | Implement registration logic             | `src/components/auth/signup-form.tsx`         | NextAuth Endpoint                 | 20 min  | Not Started | Call a custom API route to create a user.              |
| [ ] | Implement login logic                  | `src/components/auth/login-form.tsx`          | NextAuth Endpoint                 | 20 min  | Not Started | Use `signIn` from NextAuth.                          |
| [ ] | Implement logout logic                 | `src/components/layout/user-menu.tsx`         | NextAuth                          | 10 min  | Not Started | Use `signOut` from NextAuth.                         |
| [ ] | Protect pages and API routes           | `middleware.ts` / server components           | NextAuth                          | 30 min  | Not Started | Check for session before rendering or returning data.  |
| [ ] | **Finalization**                         |                                               |                                   |         |             |                                                        |
| [ ] | Test all CRUD operations end-to-end    | Browser / Testing Tool                        | All features implemented          | 60 min  | Not Started | Ensure UI, API, and DB all work together.              |
| [ ] | Update project history                 | `_docs/project-history.md`                    | Phase 3 complete                  | 10 min  | Not Started | Log completion of backend integration.                 |
