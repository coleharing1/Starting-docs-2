# Cursor & Claude Code Project Template

[![GitHub stars](https://img.shields.io/github/stars/coleharing1/cursor-project-template?style=social)](https://github.com/coleharing1/cursor-project-template/stargazers) [![GitHub forks](https://img.shields.io/github/forks/coleharing1/cursor-project-template?style=social)](https://github.com/coleharing1/cursor-project-template/network/members)

A comprehensive template for bootstrapping AI-assisted full-stack web projects using Cursor AI and Claude Code (as of August 2025). This repo provides a documentation-first workflow, AI optimization strategies, MCP integration guides, and templates for building modular, scalable codebases optimized for modern AI development tools.

## Features
- **Manual, step-by-step Setup**: Use the prompts and templates to create docs and code incrementally
- **Dual AI Tool Support**: Optimized for both Cursor AI and Claude Code with persistent context management
- **Documentation-Led Setup**: Sequential guides to generate core docs (e.g., project-overview.md, user-flow.md, tech-stack.md) via AI prompts
- **AI-First Principles**: Files <500 lines, descriptive names/JSDoc, functional patterns, no classes—maximizes compatibility with AI tools
- **MCP Integration**: Complete setup guide for Model Context Protocol with Supabase, enabling autonomous database operations
- **Advanced AI Rules**: `.cursor/rules.mdc` with YAML frontmatter, clarifying questions protocol, and `CLAUDE.md` for persistent memory
- **Complete Templates**: All referenced templates now included (TECH-STACK, USER-FLOW, UI-RULES) plus pre-filled phase checklists
- **Architecture Decision Records**: ADR template and examples for documenting important technical decisions
- **Production-Ready Config**: ESLint, Prettier, Husky, CI/CD pipeline examples, and comprehensive .gitignore included
- **SQLite-First Approach**: Start simple with SQLite, migrate to Supabase when ready for production

## Getting Started

1. Read `START-HERE.md`
2. Follow the prompts in `03-guides/workflow/prompts/` (Part 1 → Part 3)
3. Use templates in `01-templates/project-docs/` to create your `_docs/*.md`
4. Create phase checklists from `01-templates/phases/`

See also `03-guides/setup/NEW-PROJECT-SETUP.md` for a single-page manual flow.

## 📚 Repository Structure

This repository contains templates and guides to bootstrap a new project.

### Contained in this Repository (`Starting-Documents/`)
```
Starting-Documents/
├── 📄 README.md                       (You are here)
├── 📄 START-HERE.md                  (Main guide - START HERE!)
├── 📁 01-templates/                   (Copy & customize these)
│   ├── ai-config/                     - AI assistant configs (.cursor/, CLAUDE.md)
│   ├── project-docs/                  - All documentation templates
│   ├── phases/                        - Pre-filled phase checklists
│   └── ...
│
├── 📁 02-examples/                    (Reference implementations)
├── 📁 03-guides/                      (How-to guides & prompts)
└── 📁 profiles/                        (Stack-specific notes)
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

## Contributing
Contributions welcome! Fork the repo, create a branch, and submit a PR. Follow the rules in PROJECT-RULES-TEMPLATE.md. For issues, use GitHub Issues.

## License
MIT License. See [LICENSE](LICENSE) for details.

---
Built for AI-driven development—fork and adapt for your next project! 