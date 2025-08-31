# AI Prompts: Advanced & Maintenance (Part 3)

This guide provides prompts for optional documentation, AI rule setup, and ongoing project maintenance.

### 11. (Optional) Create API Documentation
**If your project includes APIs, create `api-rules.md`:**
```
Using @API-RULES-TEMPLATE.md as a template and referencing @project-overview.md, @tech-stack.md, and @user-flow.md, create api-rules.md defining our API conventions: endpoint naming, authentication methods, error handling, rate limiting, and security practices.

Include examples for our specific tech stack and use cases.
```

**Note**: Essential for projects with backend APIs. Skip for static sites.

### 12. (Optional) Create Testing Strategy
**If emphasizing testing, create `testing-rules.md`:**
```
Using @TESTING-RULES-TEMPLATE.md as a template and referencing @project-overview.md, @tech-stack.md, and @project-rules.md, create testing-rules.md defining our testing strategy: coverage goals, testing types (unit, integration, e2e), tools, and automation.

Include specific examples for our tech stack.
```

**Note**: Highly recommended for production applications. Reference @BEGINNER-TIPS.md if new to testing.

### 12.5 (Optional) Consider AI Agent Integration
**For complex automation needs, review @CREW-AI-OVERVIEW.md:**
- Multi-agent systems for automated workflows
- Useful for projects requiring content generation, data analysis, or complex task automation
- Skip if your project doesn't need autonomous AI agents

### 13. Set Up AI Assistant Rules (User Action)

#### For Cursor - Modular Rules Architecture (August 2025):

Follow the comprehensive guide in **@CURSOR-RULES-SETUP-GUIDE-2025.md** for the latest best practices. Here's the implementation:

**Step 1: Create Directory Structure**
```bash
mkdir -p .cursor/rules
```

**Step 2: Create Index File (`.cursor/rules.mdc`)**
```yaml
---
description: "Index of modular rules - documentation only"
alwaysApply: false  # IMPORTANT: Index should NOT be alwaysApply
priority: "low"
version: 1.0.0
---
# Project Rules System

## Active Modules
- 000-core.mdc - Minimal universal principles
- 900-context.mdc - AI memory management
- (Optional) 100-frontend.mdc - React/UI patterns
- (Optional) 200-backend.mdc - API/database rules
- (Optional) 300-testing.mdc - Test requirements

Reference @CURSOR-RULES-SETUP-GUIDE-2025.md for detailed setup
```

**Step 3: Create Core Rules (`.cursor/rules/000-core.mdc`)**
```yaml
---
description: "Minimal universal rules - keep under 100 lines for performance"
alwaysApply: true
priority: "critical"
version: 1.0.0
tags: ["core", "universal"]
context_limit: 100
---
# Core Universal Rules

## Code Quality
- Files MUST be under 500 lines
- Only modify code relevant to request
- No placeholders like "// ... rest of code"
- Complete all implementations

## Programming Patterns
- Prefer functional programming
- Use descriptive names (isLoading, hasError)
- Throw errors explicitly
- Add @fileoverview to all files

## AI Interaction
- Ask clarifying questions only when truly ambiguous
- Reference existing patterns first
- Update project-history.md every 5-10 files
```

**Step 4: Create Context Management Rules (`.cursor/rules/900-context.mdc`)**
```yaml
---
description: "AI context persistence across sessions"
alwaysApply: true
priority: "critical"
version: 1.0.0
tags: ["context", "memory"]
context_limit: 200
---
# Context Management

## Session Start
1. Read @project-history.md first
2. Check last update timestamp
3. Reference recent changes

## File Tracking
- At 5 files: "📝 Consider updating history"
- At 10 files: "⚠️ UPDATE project-history.md NOW"
- Reset counter after update

## Context Recovery Protocol
- If context lost, immediately reference @project-history.md
- Cross-reference with @CLAUDE.md for full understanding
```

**Step 5: Create Domain-Specific Rules** (as needed)
- Frontend rules: `.cursor/rules/100-frontend.mdc` (use globs for React/TSX files)
- Backend rules: `.cursor/rules/200-backend.mdc` (use globs for API routes)
- Testing rules: `.cursor/rules/300-testing.mdc` (use globs for test files)

**Note**: See @CURSOR-RULES-SETUP-GUIDE-2025.md for complete implementation details, glob patterns, and troubleshooting.

#### For Claude Code:
Initialize with `/init` command to create CLAUDE.md, then maintain it as persistent project memory across sessions.

### 14. Update README.md
**Prompt:**
```
Using @project-overview.md, @user-flow.md, @tech-stack.md, @project-rules.md, update README.md: Brief overview, setup instructions, conventions, contribution guidelines.
```

### 15. Final Checks (User Action)
- Review all generated documentation for consistency
- Ensure all cross-references between documents are valid
- Verify that the project brainstorm content has been properly incorporated
- Test that all technical configurations (MCP, Git hooks, etc.) are working
- Reference @AI-WORKFLOW-OPTIMIZATION.md for productivity tips
- Review @BEGINNER-TIPS.md if you're new to any concepts

### 16. Clean Up Template Files (User Action)
Once your project-specific documentation is complete, you can remove the template files that are no longer needed:

**Files to KEEP (still useful during development):**
- `CLAUDE.md` - Your project's persistent memory
- `.cursor/` folder - Your project-specific AI rules
- `_docs/` folder with all your generated project docs
- `project_brainstorm/` folder for reference
- Helper guides: @AI-WORKFLOW-OPTIMIZATION.md, @MCP-SETUP-GUIDE.md, @BEGINNER-TIPS.md

**Files to REMOVE (templates no longer needed):**
```bash
# Remove template files that have been replaced by project-specific versions
rm 01-templates/project-docs/*-TEMPLATE.md
rm 02-examples/themes/TAN-THEME-RULES.md  # Unless you're using this specific theme

# Remove example brainstorm files
rm 02-examples/project-brainstorm/*-EXAMPLE.md

# Optional: Archive templates instead of deleting
mkdir _archive_templates
mv 01-templates/ _archive_templates/
mv 02-examples/ _archive_templates/
mv 03-guides/ _archive_templates/  # Keep only what you need for reference
```

**Note**: Consider keeping @DATABASE-OVERVIEW.md, @DEPLOYMENT-GUIDE.md, @API-RULES-TEMPLATE.md, and @TESTING-RULES-TEMPLATE.md as reference during development.

---

### 17. Ongoing Maintenance

1. **Project History Updates (CRITICAL)**: Update @project-history.md every 5-10 file changes to maintain AI context across sessions.
2. **Accessibility & Performance Audits**: Run Lighthouse regularly.
3. **Dependency Updates**: Monitor release notes for key packages.
4. **AI Workflow Upgrades**: Adjust `.cursor/rules/` as features evolve.
5. **CI/CD Enhancements**: Expand GitHub Actions with more checks.
6. **Knowledge Base Refresh**: Periodically re-upload updated docs to Cursor Knowledge.
7. **Context Recovery Protocol**: If AI loses context, immediately reference @project-history.md and @CLAUDE.md.
