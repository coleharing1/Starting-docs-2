# Cursor & Claude Code Project Template

[![GitHub stars](https://img.shields.io/github/stars/coleharing1/cursor-project-template?style=social)](https://github.com/coleharing1/cursor-project-template/stargazers) [![GitHub forks](https://img.shields.io/github/forks/coleharing1/cursor-project-template?style=social)](https://github.com/coleharing1/cursor-project-template/network/members)

A comprehensive template for bootstrapping AI-assisted full-stack web projects using Cursor AI and Claude Code (as of August 2025). This repo provides a documentation-first workflow, AI optimization strategies, MCP integration guides, and templates for building modular, scalable codebases optimized for modern AI development tools. Perfect for developers leveraging AI assistance (up to 95% automation) to create production-grade applications with modern frameworks like Next.js, SvelteKit, or Nuxt, and backends like Supabase.

## Features
- **🚀 Instant Setup**: Run `./setup.sh` for a complete Next.js + TypeScript + Tailwind + SQLite project in 3 minutes
- **Dual AI Tool Support**: Optimized for both Cursor AI and Claude Code with persistent context management
- **Documentation-Led Setup**: Sequential guides to generate core docs (e.g., project-overview.md, user-flow.md, tech-stack.md) via AI prompts
- **AI-First Principles**: Files <500 lines, descriptive names/JSDoc, functional patterns, no classes—maximizes compatibility with AI tools
- **MCP Integration**: Complete setup guide for Model Context Protocol with Supabase, enabling autonomous database operations
- **Advanced AI Rules**: `.cursor/rules.mdc` with YAML frontmatter, clarifying questions protocol, and `CLAUDE.md` for persistent memory
- **Complete Templates**: All referenced templates now included (TECH-STACK, USER-FLOW, UI-RULES) plus pre-filled phase checklists
- **Architecture Decision Records**: ADR template and examples for documenting important technical decisions
- **Production-Ready Config**: ESLint, Prettier, Husky, CI/CD pipeline, and comprehensive .gitignore included
- **SQLite-First Approach**: Start simple with SQLite, migrate to Supabase when ready for production
- **Workflow Optimization**: Auto-save configs, Yolo mode for testing, parallel AI instances, and the edit-test loop
- **Phase-Based Development**: 6 phases with 40-50 tasks each, from setup to production deployment
- **August 2025 Updates**: Latest MCP security practices, OAuth 2.0 preparation, CI/CD integration, and 5-30x productivity strategies

## Getting Started

### Option 1: Quick Start (Recommended)
```bash
# Creates a complete Next.js project in 3 minutes
chmod +x setup.sh
./setup.sh
```
This creates a fully configured Next.js + TypeScript + Tailwind + SQLite project with all tooling ready.

### Option 2: Use as Template
1. **Clone the Repo**:
   ```bash
   git clone https://github.com/coleharing1/cursor-project-template.git
   cd cursor-project-template
   ```
2. **Install Dependencies**:
   ```bash
   npm install
   ```
3. **Configure AI Tools**:
   - **Cursor**: Open project, upload templates to Knowledge (see `START-HERE.md` and `PROMPTS-*.md`)
   - **Claude Code**: Run `/init` to create CLAUDE.md for persistent context
4. **Follow the Guide**: Start with `START-HERE.md`, then use `PROMPTS-INITIAL-DOCS.md`, `PROMPTS-PLANNING-TRACKING.md`, and `PROMPTS-ADVANCED-MAINTENANCE.md` to generate your project's docs.

**Prerequisites**: Node.js 18+, Git, Cursor AI (Pro recommended), Claude Code (optional)

## Usage
- **Generate Docs**: Use prompts in `PROMPTS-*.md` (e.g., for project-overview.md)
- **Optimize Workflow**: Follow AI-WORKFLOW-OPTIMIZATION.md for 5-30x productivity gains
- **Configure MCP**: Set up Model Context Protocol using MCP-SETUP-GUIDE.md
- **Build Iteratively**: Create phase docs in _docs/phases/ and implement features
- **Track Progress**: Update checklists (e.g., key-features-checklist.md) and history log
- **Customize Rules**: Adapt .cursor/rules.mdc and CLAUDE.md for your stack
- **Deploy**: Follow DEPLOYMENT-GUIDE.md for Vercel/Supabase setups

## 📚 Repository Structure

This repository contains templates and guides to bootstrap a new project. The `setup.sh` script will generate a complete project structure in a new directory.

### Contained in this Repository (`Starting-Documents/`)
```
Starting-Documents/
├── 📄 README.md                       (You are here)
├── 📄 START-HERE.md                  (Main guide - START HERE!)
├── 📄 PROMPTS-*.md                    (Detailed AI prompts)
├── 📄 setup.sh                        (Quick start script)
│
├── 📁 01-templates/                   (Copy & customize these)
│   ├── ai-config/                     - AI assistant configs (.cursor/, CLAUDE.md)
│   ├── project-docs/                  - All documentation templates
│   ├── phases/                        - Pre-filled phase checklists
│   └── ...
│
├── 📁 02-examples/                    (Reference implementations)
│
└── 📁 03-guides/                      (How-to guides)
```

### Generated in Your New Project
```
your-new-project/
├── src/
├── _docs/
├── project_brainstorm/
├── .cursor/
├── .github/
├── prisma/
├── public/
├── tests/
├── .env.local
├── package.json
└── ... all other project files
```

### 🚀 What's New
- **Complete setup.sh script** - Creates a working Next.js project instantly
- **All missing templates added** - All `-TEMPLATE.md` files for core docs
- **Pre-filled phase checklists** - 40-50 tasks per phase, ready to use
- **ADR templates** - Document your architectural decisions
- **Production configs** - ESLint, Prettier, Husky, CI/CD pipeline included
- **Enhanced AI rules** - Clarifying questions protocol for better AI responses

### 📋 Development Workflow
1. Run `./setup.sh` for instant project setup
2. Add your ideas to `project_brainstorm/`
3. Follow the numbered phases (0-5) for frontend-first development
4. Use SQLite locally, migrate to Supabase when ready for production

## Contributing
Contributions welcome! Fork the repo, create a branch, and submit a PR. Follow the rules in PROJECT-RULES-TEMP.md. For issues, use GitHub Issues.

## License
MIT License. See [LICENSE](LICENSE) for details.

---
Built for AI-driven development—fork and adapt for your next project! 