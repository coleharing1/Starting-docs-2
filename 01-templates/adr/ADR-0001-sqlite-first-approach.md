# ADR-0001: SQLite-First Development Approach

Date: 2025-08-09
Status: Accepted

## Context
When starting new web development projects, developers often face complexity barriers with cloud database setup, Docker requirements, and authentication services. This creates friction in the early stages when the focus should be on building features and proving concepts. 

Beginners especially struggle with:
- Setting up Docker for local PostgreSQL
- Configuring cloud database connections
- Managing development vs production environments
- Understanding database migrations
- Dealing with connection pooling and performance

Meanwhile, experienced developers waste time on infrastructure when they could be prototyping.

## Decision
We will adopt a SQLite-first development approach for Phases 0-4, migrating to Supabase (PostgreSQL) only in Phase 5 when preparing for production deployment.

## Considered Options

1. **Option 1: Supabase from the start**
   - Pros:
     - No migration needed later
     - Real-time features available immediately
     - Production-ready from day one
   - Cons:
     - Requires Docker for local development
     - Internet connection needed
     - Costs start immediately
     - Complex for beginners

2. **Option 2: PostgreSQL locally via Docker**
   - Pros:
     - Same database as production
     - Full PostgreSQL features
     - No migration needed
   - Cons:
     - Docker setup complexity
     - Resource intensive locally
     - Slow startup times
     - Platform-specific issues

3. **Option 3: SQLite for development, PostgreSQL for production** (Chosen)
   - Pros:
     - Zero configuration to start
     - No Docker required
     - Works offline
     - Fast iteration
     - File-based (easy backup/sharing)
     - Teaches SQL fundamentals
   - Cons:
     - Migration required for production
     - Some SQL syntax differences
     - No real-time features in dev
     - Single-writer limitation

## Consequences

### Positive
- Developers can start coding in under 5 minutes
- No cloud costs during development and testing phases
- Easier for beginners to understand database concepts
- Faster test execution (in-memory SQLite)
- Can commit database file for demos/examples
- Forces good data modeling practices early

### Negative
- Must write migration scripts for Phase 5
- Some Supabase-specific features unavailable in dev
- Need to test PostgreSQL-specific queries separately
- Row-level security must be mocked in development

### Neutral
- ORMs like Prisma abstract most differences
- Migration tools are mature and well-documented
- Most apps don't need PostgreSQL-specific features initially

## Implementation

1. **Phase 0-4**: Use SQLite with Prisma ORM
   ```env
   DATABASE_URL="file:./prisma/dev.db"
   ```

2. **Phase 5**: Migrate to Supabase
   ```bash
   # Export schema
   npx prisma migrate dev --create-only
   
   # Update schema.prisma
   datasource db {
     provider = "postgresql"
     url      = env("DATABASE_URL")
   }
   
   # Apply to Supabase
   npx supabase db push
   ```

3. **Use Prisma features that work with both**:
   - Standard CRUD operations
   - Relations and joins
   - Transactions
   - Basic queries

4. **Avoid until Phase 5**:
   - PostgreSQL arrays
   - JSON columns (use TEXT with JSON.parse)
   - Full-text search
   - Database functions

## References
- [Prisma SQLite Documentation](https://www.prisma.io/docs/concepts/database-connectors/sqlite)
- [SQLite to PostgreSQL Migration Guide](https://www.prisma.io/docs/guides/migrate-to-prisma/migrate-from-sqlite-to-postgresql)
- [Supabase Local Development](https://supabase.com/docs/guides/cli/local-development)
- PROJECT-OVERVIEW-TEMP.md - Database strategy section
- DATABASE-OVERVIEW.md - Migration details

## Notes
This approach has been validated with multiple production applications that successfully migrated from SQLite to PostgreSQL. The key is using an ORM from the start and avoiding database-specific features until the migration phase.

The migration typically takes 2-4 hours for a medium-sized application, which is a worthwhile trade-off for the months of simplified development.

---
*Author: AI Template System*
*Reviewers: Development Team*