# Starting-Documents: Manual AI-First Project Starter

> A documentation-first starter kit for creating production-grade projects with Cursor AI and Claude Code through manual, step-by-step setup using copy-paste prompts and AI-optimized templates.

## 🎯 What Is This?

Starting-Documents is a meticulously organized collection of templates, guides, and prompts designed to help developers create production-ready applications using AI-assisted development. Unlike traditional boilerplates that give you code, this gives you a **system** - a repeatable, manual process for building any project with AI as your primary coding partner.

### Core Philosophy
- **Documentation First**: Generate comprehensive docs before writing code
- **Manual Setup**: Copy-paste prompts over automation for flexibility
- **AI-Optimized**: Every file under 500 lines, functional patterns, clear naming
- **Phase-Based Development**: 6 structured phases from setup to production
- **Context Persistent**: Maintains AI understanding across sessions
- **Stack Flexible**: Core docs stay generic with stack-specific profiles

## 🗂️ Complete Project Structure

```
Starting-Documents/
├── 📄 Core Documentation
│   ├── README.md                # Original overview
│   ├── README2.md              # This file - comprehensive guide
│   ├── START-HERE.md           # Quick-start entry point
│   └── LICENSE                 # MIT license
│
├── 📁 01-templates/            # Ready-to-use document templates
│   ├── ai-config/             # AI assistant configuration
│   │   ├── CLAUDE.md          # Persistent context template
│   │   └── .cursor/rules/     # Modular rules system
│   ├── project-docs/          # Core documentation templates
│   ├── phases/                # Development phase checklists (0-5)
│   ├── checklists/            # Progress tracking templates
│   ├── adr/                   # Architecture Decision Records
│   └── project-skeleton/      # Example package.template.json
│
├── 📁 02-examples/             # Reference implementations
│   └── themes/                # Design system examples
│       └── TAN-THEME-RULES.md # Earthy minimalist theme
│
├── 📁 03-guides/               # How-to guides and workflows
│   ├── setup/                 # Configuration guides
│   │   ├── NEW-PROJECT-SETUP.md    # Manual setup (start here)
│   │   ├── DATABASE-OVERVIEW.md    # SQLite → Supabase
│   │   ├── DEPLOYMENT-GUIDE.md     # Vercel deployment
│   │   ├── MCP-SETUP-GUIDE.md      # Model Context Protocol
│   │   ├── SNYK-SETUP-GUIDE.md     # Security scanning
│   │   └── CURSOR-RULES-SETUP-GUIDE-2025.md
│   ├── workflow/              # Development workflows
│   │   ├── prompts/          # AI prompt templates
│   │   │   ├── PROMPTS-INITIAL-DOCS.md
│   │   │   ├── PROMPTS-PLANNING-TRACKING.md
│   │   │   └── PROMPTS-ADVANCED-MAINTENANCE.md
│   │   ├── experimental/     # Theoretical explorations
│   │   └── [workflow guides]
│   └── maintenance/          # Ongoing maintenance
│       ├── PROJECT-HISTORY-INS.md
│       ├── audits/          # Audit prompt templates
│       └── _archive/        # Archived plans
│
├── 📁 profiles/               # Stack-specific configurations
│   └── nextjs-react/         # Next.js/React notes
│
├── 📁 project_brainstorm/     # Your project ideas (empty starter)
│
└── 📄 Configuration Files
    ├── package.template.json  # Example package.json
    ├── .gitignore            # Git ignore rules
    ├── .prettierrc           # Code formatting config
    └── .editorconfig         # Editor configuration
```

## 📂 Detailed Folder Purposes

### `/01-templates/` - Your Building Blocks

#### `/01-templates/ai-config/`
AI assistant configuration templates for optimal performance:
- **CLAUDE.md** - Persistent memory template for Claude Code/Cursor sessions
- **.cursor/** - Modern modular rules system
  - **rules.mdc** - Index file (NOT always-apply)
  - **rules/000-core.mdc** - Universal coding principles
  - **rules/900-context.mdc** - Context persistence rules
  - **rules/modules/** - Optional domain-specific rules

#### `/01-templates/project-docs/`
Core documentation templates to define your project:
- **PROJECT-OVERVIEW-TEMPLATE.md** - Define purpose, goals, success metrics
- **USER-FLOW-TEMPLATE.md** - Map user journeys and interactions
- **TECH-STACK-TEMPLATE.md** - Document technology choices
- **UI-RULES-TEMPLATE.md** - UI/UX principles and patterns
- **THEME-RULES-TEMPLATE.md** - Design system and branding
- **PROJECT-RULES-TEMPLATE.md** - Code style and conventions
- **API-RULES-TEMPLATE.md** - API design patterns
- **TESTING-RULES-TEMPLATE.md** - Testing strategy and standards

#### `/01-templates/phases/`
Detailed development phase checklists (40-50 tasks each):
- **phase-0-setup.md** - Project initialization and configuration
- **phase-0-claude-code.md** - Claude-specific setup variant
- **phase-0-cursor-claude.md** - Dual-tool setup variant
- **phase-1-frontend-foundation.md** - UI components and layout
- **phase-2-frontend-features.md** - Interactive features
- **phase-3-backend-sqlite.md** - Database and API setup
- **phase-4-testing-polish.md** - Testing and refinement
- **phase-5-production-supabase.md** - Production deployment

#### `/01-templates/checklists/`
Progress tracking templates:
- **KEY-FEATURES-TEMPLATE.md** - Feature implementation tracking
- **PAGES-URLS-TEMPLATE.md** - Route and page status

### `/02-examples/` - Reference Implementations

#### `/02-examples/themes/`
Complete theme examples:
- **TAN-THEME-RULES.md** - Earthy, minimalist design system

#### `/02-examples/project-brainstorm/`
Example brainstorming documents (currently placeholder files)

### `/03-guides/` - How-To Guides

#### `/03-guides/setup/`
Configuration and setup guides:
- **NEW-PROJECT-SETUP.md** - Manual step-by-step project creation
- **DATABASE-OVERVIEW.md** - SQLite to Supabase migration path
- **DEPLOYMENT-GUIDE.md** - Vercel deployment with troubleshooting
- **MCP-SETUP-GUIDE.md** - Model Context Protocol for AI-DB operations
- **SNYK-SETUP-GUIDE.md** - Security scanning configuration
- **CURSOR-RULES-SETUP-GUIDE-2025.md** - Modern Cursor rules implementation

#### `/03-guides/workflow/`
Development workflow optimization:
- **AI-WORKFLOW-OPTIMIZATION.md** - 5-30x productivity techniques
- **BEGINNER-TIPS.md** - AI-first development for newcomers
- **AI-Workflow-Combined.md** - Integrated workflow strategies
- **DUAL-AI-CHECKLIST-STRATEGY.md** - Using multiple AI tools
- **DUAL-AI-COORDINATION-GUIDE.md** - Coordinating AI assistants
- **CREW-AI-OVERVIEW.md** - Multi-agent AI systems
- **experimental/** - Theoretical explorations (e.g., Gemini CLI)

#### `/03-guides/workflow/prompts/`
Structured AI prompt templates:
- **PROMPTS-INITIAL-DOCS.md** - Generate core documentation
- **PROMPTS-PLANNING-TRACKING.md** - Create phase plans and checklists
- **PROMPTS-ADVANCED-MAINTENANCE.md** - Advanced features and maintenance

#### `/03-guides/maintenance/`
Ongoing project maintenance:
- **PROJECT-HISTORY-INS.md** - Context persistence across sessions
- **_archive/** - Archived improvement plans

### `/profiles/` - Stack-Specific Configurations

#### `/profiles/nextjs-react/`
Next.js and React specific configurations and notes

### `/03-guides/maintenance/audits/` - Audit Prompts
- **technical-production-audit.md** - Pre-deployment technical audit
- **content-documentation-audit.md** - Documentation completeness check
- **Midproject-check-1.md** - Mid-project review template
- **Midproject-check-2.md** - Alternative review approach

## 🚀 Getting Started

### Manual Documentation-First Approach

1. **Start Here**
   - Read `START-HERE.md` for overview
   - Review `03-guides/setup/NEW-PROJECT-SETUP.md` for manual steps

2. **Create Your Project Structure**
   ```bash
   mkdir my-new-project
   cd my-new-project
   mkdir -p _docs/phases project_brainstorm .cursor/rules
   ```

3. **Generate Core Documentation** (Using AI)
   - Follow prompts in `03-guides/workflow/prompts/PROMPTS-INITIAL-DOCS.md`
   - Create: project-overview.md, user-flow.md, tech-stack.md
   - Use templates from `01-templates/project-docs/` as guides

4. **Set Up AI Configuration**
   - Copy `01-templates/ai-config/.cursor/` to your project
   - Copy `01-templates/ai-config/CLAUDE.md` to your project root
   - Customize for your specific needs

5. **Plan Your Phases**
   - Copy relevant phase templates from `01-templates/phases/`
   - Customize checklists for your project
   - Start with Phase 0 (setup)

6. **Begin Development**
   - Work through phases sequentially
   - Update project-history.md every 5-10 file changes
   - Use AI with provided prompts for implementation

## 📋 Recommended Documentation Order

1. **Brainstorm** → `project-overview.md`
2. `user-flow.md` (end-to-end journeys)
3. `tech-stack.md` (with migration plan)
4. `ui-rules.md` + `theme-rules.md`
5. `project-rules.md`
6. Optional: `api-rules.md`, `testing-rules.md`, ADRs
7. Phases `phase-0` through `phase-5`
8. AI rules (`.cursor/rules/`) + `CLAUDE.md`
9. Deployment & CI (optional)
10. `project-history.md` (continuous updates)

All prompts to create these are in `03-guides/setup/NEW-PROJECT-SETUP.md` and `03-guides/workflow/prompts/`.

## 📋 The 6-Phase Development Process

**Phase 0: Setup & Configuration** - Environment, tools, git setup  
**Phase 1: Frontend Foundation** - Layout, navigation, design system  
**Phase 2: Frontend Features** - Interactive components, state, forms  
**Phase 3: Backend Integration** - SQLite database, API routes, auth  
**Phase 4: Testing & Polish** - Tests, performance, accessibility  
**Phase 5: Production Deployment** - Supabase migration, Vercel, monitoring

## 🔧 Key Configuration Files

### `package.template.json`
Example package.json showing recommended dependencies and scripts

### `.cursor/rules.mdc` System
Modern modular rules for Cursor AI:
- Index file with `alwaysApply: false`
- Core rules under 100 lines
- Context management rules
- Optional domain-specific modules

### `CLAUDE.md`
Persistent context template maintaining:
- Project conventions
- Architecture decisions
- Recent changes
- Current status

## 🎯 Core Principles

### 1. Documentation First
Create comprehensive documentation before writing code. This ensures clarity, reduces rework, and provides excellent context for AI assistants.

### 2. AI-Optimized Structure
- Files under 500 lines for optimal AI processing
- Functional programming patterns
- Descriptive naming conventions
- Clear file organization

### 3. Context Persistence
- Update project-history.md every 5-10 file changes
- Maintain CLAUDE.md for session continuity
- Use modular Cursor rules to avoid context bloat

### 4. Progressive Enhancement
- Start with SQLite for rapid prototyping
- Migrate to Supabase when ready for production
- Use phases to manage complexity

### 5. Multi-Tool Workflow
- Use Cursor for implementation and refinement
- Use Claude Code for planning and architecture
- Coordinate through shared documentation

## 🛠️ Recommended Workflow

1. **Morning Planning** (When Sharp)
   - Review project documentation
   - Plan complex features
   - Update phase checklists

2. **Afternoon Implementation** (AI-Assisted)
   - Use Cursor Composer for multi-file changes
   - Let AI handle repetitive tasks
   - Focus on reviewing and guiding

3. **Evening Cleanup**
   - Update project-history.md
   - Run tests and linting
   - Commit changes with clear messages

## 💡 Quick Tips

### For Beginners
- Start with `BEGINNER-TIPS.md` and `START-HERE.md`
- Focus on Phase 0 initially - don't rush ahead
- Use the TAN theme example as a starting point
- Ask AI to explain concepts with "As a beginner, explain..."

### For Advanced Users
- Jump to `AI-WORKFLOW-OPTIMIZATION.md` for 5-30x productivity gains
- Explore `CREW-AI-OVERVIEW.md` for multi-agent workflows
- Create custom rule modules in `.cursor/rules/modules/`
- Add new stack profiles under `/profiles/`

## 🔄 Maintenance Cadence

- **Every 5-10 file changes**: Update `project-history.md`
- **Weekly**: Review and update `CLAUDE.md`
- **Before deployment**: Run audits from `/03-guides/maintenance/audits/`
- **Monthly**: Update dependencies and review phase progress

## 🤝 Contributing

Contributions welcome! Priority areas:
- Additional stack profiles (Python, Vue, Angular)
- More theme examples beyond TAN
- Template improvements (keep under 500 lines)
- Documentation fixes and clarifications

Follow `01-templates/project-docs/PROJECT-RULES-TEMPLATE.md` when contributing.
PRs should maintain the manual-first, documentation-driven approach.

## 📄 License

MIT License - See LICENSE file for details

## Why This Approach Works

- **Manual control** - Copy-paste prompts give you flexibility over automation
- **Documentation-first** - Clear specs before code reduces rework
- **AI-optimized structure** - 500-line limit and functional patterns improve AI comprehension
- **Context persistence** - CLAUDE.md and project-history.md maintain understanding across sessions
- **Phased development** - Manageable progression from setup to production

---

*Last Updated: December 2024*