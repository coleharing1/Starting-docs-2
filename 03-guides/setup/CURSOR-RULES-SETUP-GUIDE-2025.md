# Cursor Rules Setup Guide - August 2025 Best Practices

## Executive Summary
This guide provides the latest best practices for setting up Cursor AI rules as of August 2025. Based on extensive research and real-world implementation, it covers modular rule architecture, performance optimization, and the new syntax changes introduced in 2025.

## 🚀 Quick Start

### 1. Create Directory Structure
```bash
mkdir -p .cursor/rules
```

### 2. Copy This Template Structure
```
.cursor/
├── rules.mdc              # Index/documentation (NOT alwaysApply)
└── rules/
    ├── 000-core.mdc       # Minimal universal rules (<100 lines)
    ├── 010-safety.mdc     # Command/terminal safety
    ├── 100-frontend.mdc   # Frontend patterns
    ├── 200-backend.mdc    # API/database rules
    ├── 300-testing.mdc    # Test requirements
    ├── 400-docs.mdc       # Documentation standards
    └── 900-context.mdc    # AI memory management
```

## 📋 Key Changes in 2025

### Syntax Updates
- ✅ Use `globs` instead of `fileGlobs`
- ✅ Priority as strings: "critical", "high", "medium", "low"
- ✅ Add `context_limit` to prevent token overflow
- ✅ Include `tags` array for categorization
- ✅ Version your rules with `version` field

### Performance Requirements
- Keep individual rule files under 500 lines (optimal: 100-300)
- Always-apply rules should total <200 lines maximum
- Use specific glob patterns to reduce context loading
- Monitor context window usage (shown at conversation end)

## 🏗️ Rule File Template

### Minimal Universal Rules (000-core.mdc)
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

### Domain-Specific Rules (100-frontend.mdc)
```yaml
---
description: "Frontend development patterns"
globs: ["app/**/*.{tsx,jsx}", "components/**/*.{tsx,jsx}", "src/**/*.{tsx,jsx}"]
tags: ["frontend", "react", "ui"]
priority: "high"
version: 1.0.0
context_limit: 300
---
# Frontend Development Rules

[Domain-specific rules here]
```

### Context Management (900-context.mdc)
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
```

## 🎯 Glob Pattern Best Practices

### Specific is Better
```yaml
# ✅ GOOD - Specific patterns
globs: ["app/api/**/*.ts", "lib/server/**/*.ts"]

# ❌ BAD - Too broad
globs: ["**/*.ts"]
```

### Common Patterns
```yaml
# Frontend components
globs: ["app/**/*.{tsx,jsx}", "components/**/*.{tsx,jsx}"]

# API routes (Next.js App Router)
globs: ["app/api/**/route.ts", "app/api/**/[...route].ts"]

# Tests
globs: ["**/*.test.{ts,tsx}", "**/*.spec.{ts,tsx}", "__tests__/**"]

# Documentation
globs: ["**/*.{md,mdx}", "docs/**/*"]

# Database
globs: ["prisma/**/*.prisma", "migrations/**/*.sql"]
```

## 📊 Priority System

### Priority Levels (2025 syntax)
- **"critical"** - Safety, security, core principles
- **"high"** - Primary domain rules (frontend, backend)
- **"medium"** - Supporting patterns (testing, docs)
- **"low"** - Nice-to-have guidelines

### Conflict Resolution
When rules conflict, higher priority wins. Use tags to help AI decide:
```yaml
tags: ["safety", "security", "required"]  # Critical importance
tags: ["style", "optional", "preference"] # Lower importance
```

## 🚫 Common Pitfalls to Avoid

### 1. Rule Overload
❌ **Problem**: Too many always-apply rules
✅ **Solution**: Keep always-apply under 200 total lines

### 2. Generic Rules
❌ **Problem**: Vague, unhelpful guidance
✅ **Solution**: Provide specific examples and patterns

### 3. Overlapping Globs
❌ **Problem**: Multiple rules matching same files
✅ **Solution**: Use specific patterns and priority levels

### 4. Missing Context Limits
❌ **Problem**: Rules consuming too many tokens
✅ **Solution**: Add `context_limit` to each rule file

### 5. Outdated Syntax
❌ **Problem**: Using `fileGlobs` (deprecated)
✅ **Solution**: Use `globs` instead

## 📁 Complete Example Structure

### .cursor/rules.mdc (Index)
```yaml
---
description: "Index of modular rules - documentation only"
alwaysApply: false
priority: "low"
version: 1.0.0
---
# Project Rules System

## Active Modules
- 000-core.mdc - Universal principles
- 010-safety.mdc - Security/safety
- 100-frontend.mdc - React/UI patterns
- 200-backend.mdc - API/database
- 300-testing.mdc - Test requirements
- 900-context.mdc - AI memory

## Quick Reference
[Add project-specific guidelines]
```

### .cursor/rules/000-core.mdc
```yaml
---
description: "Minimal universal rules"
alwaysApply: true
priority: "critical"
version: 1.0.0
tags: ["core"]
context_limit: 100
---
# Core Rules
- Keep files <500 lines
- Functional patterns preferred
- No partial implementations
- Complete error handling
```

### .cursor/rules/100-frontend.mdc
```yaml
---
description: "Frontend patterns"
globs: ["app/**/*.{tsx,jsx}", "components/**/*.{tsx,jsx}"]
priority: "high"
version: 1.0.0
tags: ["frontend", "react"]
context_limit: 300
---
# Frontend Rules
- Functional components only
- TypeScript strict mode
- Accessibility required
- Server components by default
```

## 🔧 Implementation Checklist

### Initial Setup
- [ ] Create `.cursor/rules/` directory
- [ ] Add index file `.cursor/rules.mdc`
- [ ] Create `000-core.mdc` with minimal universal rules
- [ ] Add domain-specific rules (frontend, backend, etc.)
- [ ] Include context management rules
- [ ] Set up safety/security rules

### Optimization
- [ ] Keep always-apply rules under 200 total lines
- [ ] Use specific glob patterns
- [ ] Add context_limit to all files
- [ ] Include version numbers
- [ ] Add descriptive tags
- [ ] Test with different file types

### Maintenance
- [ ] Review context window usage regularly
- [ ] Update glob patterns based on project structure
- [ ] Version bump when making changes
- [ ] Document rule interactions
- [ ] Remove redundant rules

## 📈 Performance Metrics

### Target Metrics (August 2025)
- Context window usage: <30% on average
- Rule loading time: <100ms
- Token efficiency: 40% reduction vs monolithic
- Always-apply total: <200 lines
- Individual rule files: 100-300 lines

### Monitoring
```bash
# Check active rules
cat .cursor/rules/*.mdc | grep "globs:"

# Count lines per rule
wc -l .cursor/rules/*.mdc

# Verify syntax
grep -E "^(description|globs|priority|tags):" .cursor/rules/*.mdc
```

## 🔄 Migration from Old Format

### If you have `.cursorrules` (old format):
1. Create `.cursor/rules/` directory
2. Split monolithic rules into domain files
3. Convert to `.mdc` format with YAML frontmatter
4. Add globs patterns for auto-loading
5. Remove old `.cursorrules` file

### If you have `fileGlobs` (old syntax):
```yaml
# Old (deprecated)
fileGlobs: ["**/*.tsx"]

# New (2025)
globs: ["**/*.tsx"]
```

## 💡 Pro Tips

### 1. Start Minimal
Begin with just 3-4 rule files and expand as needed.

### 2. Project-Specific First
Focus on your project's unique requirements before generic patterns.

### 3. Use Examples
Include code examples in rules for clarity:
```yaml
# Good example in rule file
## API Response Format
\```typescript
return NextResponse.json({ 
  data: result,
  error: null 
})
\```
```

### 4. Version Everything
Track rule evolution with semantic versioning.

### 5. Test Impact
Monitor context window usage before/after changes.

## 📚 Resources

### Official Documentation
- Cursor Docs: cursor.com/docs/rules
- Context Management: cursor.com/docs/context

### Community Resources
- PatrickJS/awesome-cursorrules (GitHub)
- r/cursor_ai (Reddit)
- Cursor Discord community

### Tools
- Context window analyzer (built into Cursor)
- Rule validator (Settings > Rules > Validate)
- Performance metrics (end of conversation)

## 🎯 Quick Implementation Script

Save this as `setup-cursor-rules.sh`:
```bash
#!/bin/bash

# Create structure
mkdir -p .cursor/rules

# Create index
cat > .cursor/rules.mdc << 'EOF'
---
description: "Project rules index"
alwaysApply: false
priority: "low"
version: 1.0.0
---
# Project Rules

See .cursor/rules/ for modular rules.
EOF

# Create core rules
cat > .cursor/rules/000-core.mdc << 'EOF'
---
description: "Core universal rules"
alwaysApply: true
priority: "critical"
version: 1.0.0
context_limit: 100
---
# Core Rules
- Keep files <500 lines
- Complete implementations only
- Functional patterns preferred
EOF

echo "✅ Cursor rules structure created!"
```

## 📋 Final Checklist

Before using your rules:
- [ ] Total always-apply lines <200
- [ ] Each file has context_limit
- [ ] Globs patterns are specific
- [ ] Priority levels set correctly
- [ ] Version numbers included
- [ ] Tags added for categorization
- [ ] No deprecated syntax (fileGlobs)
- [ ] Index file has alwaysApply: false

---

*Last Updated: August 2025*
*Based on latest Cursor AI capabilities and community best practices*