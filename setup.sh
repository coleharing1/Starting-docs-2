#\!/bin/bash

# 🚀 Cursor Project Setup Script
# Complete setup for Next.js + TypeScript + Tailwind + SQLite project

set -e  # Exit on error

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎯 Cursor AI Project Setup"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check Node.js version
NODE_VERSION=$(node -v | cut -d 'v' -f 2 | cut -d '.' -f 1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js 18+ required. Current version: $(node -v)"
    exit 1
fi

echo "✅ Node.js version: $(node -v)"

# Get project name
read -p "📝 Enter project name (kebab-case): " PROJECT_NAME
if [ -z "$PROJECT_NAME" ]; then
    echo "❌ Project name is required"
    exit 1
fi

# Create and enter project directory
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📦 Initializing Next.js with TypeScript..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Create Next.js app with TypeScript and Tailwind
npx create-next-app@latest . \
  --typescript \
  --tailwind \
  --app \
  --src-dir \
  --import-alias "@/*" \
  --no-eslint \
  --use-npm

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📚 Creating project structure..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Create folder structure
mkdir -p src/{components/{ui,forms,layout},lib/{utils,hooks,api},hooks,types,styles}
mkdir -p _docs/{phases,project-history}
mkdir -p project_brainstorm
mkdir -p .cursor
mkdir -p .github/workflows
mkdir -p prisma
mkdir -p public/images
mkdir -p tests/{unit,integration,e2e}

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "💾 Installing development dependencies..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Install SQLite and Prisma for development database
npm install --save-dev \
  prisma \
  @prisma/client \
  @types/node \
  eslint \
  eslint-config-next \
  eslint-config-prettier \
  prettier \
  husky \
  lint-staged \
  @testing-library/react \
  @testing-library/jest-dom \
  vitest \
  @vitejs/plugin-react \
  playwright \
  @playwright/test

# Install production dependencies
npm install \
  @tanstack/react-query \
  zustand \
  react-hook-form \
  @hookform/resolvers \
  zod \
  lucide-react \
  clsx \
  tailwind-merge \
  date-fns \
  next-auth

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎨 Installing shadcn/ui..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Initialize shadcn/ui
npx shadcn-ui@latest init -y \
  --style default \
  --tailwind-config tailwind.config.ts \
  --components-dir src/components \
  --utils-dir src/lib/utils \
  --tailwind-css src/styles/globals.css

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🗄️ Setting up SQLite with Prisma..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Initialize Prisma with SQLite
npx prisma init --datasource-provider sqlite

# Create basic Prisma schema
cat > prisma/schema.prisma << 'PRISMA'
generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "sqlite"
  url      = env("DATABASE_URL")
}

model User {
  id        String   @id @default(cuid())
  email     String   @unique
  name      String?
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
}
PRISMA

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📝 Creating configuration files..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Create .env.local
cat > .env.local << 'ENV'
# Development Database (SQLite)
DATABASE_URL="file:./prisma/dev.db"

# NextAuth
NEXTAUTH_URL="http://localhost:3000"
NEXTAUTH_SECRET="development-secret-change-in-production"

# Public Environment Variables
NEXT_PUBLIC_APP_URL="http://localhost:3000"
NEXT_PUBLIC_APP_NAME="My App"
ENV

# Create prettier config
cat > .prettierrc << 'PRETTIER'
{
  "semi": false,
  "singleQuote": true,
  "tabWidth": 2,
  "trailingComma": "es5",
  "printWidth": 80,
  "bracketSpacing": true,
  "arrowParens": "always",
  "endOfLine": "lf"
}
PRETTIER

# Create ESLint config
cat > .eslintrc.json << 'ESLINT'
{
  "extends": ["next/core-web-vitals", "prettier"],
  "rules": {
    "no-console": ["warn", { "allow": ["warn", "error"] }],
    "@typescript-eslint/no-unused-vars": ["error", { "argsIgnorePattern": "^_" }],
    "@typescript-eslint/no-explicit-any": "warn"
  }
}
ESLINT

# Create .gitignore
cat > .gitignore << 'IGNORE'
# Dependencies
node_modules/
.pnp
.pnp.js

# Testing
coverage/

# Next.js
.next/
out/
build/

# Production
*.production

# Misc
.DS_Store
*.pem

# Debug
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Local env files
.env*.local
.env

# Vercel
.vercel

# TypeScript
*.tsbuildinfo
next-env.d.ts

# Database
prisma/dev.db
prisma/dev.db-journal
prisma/migrations/

# IDE
.vscode/*
\!.vscode/extensions.json
.idea/
*.swp
*.swo
*~
IGNORE

# Create Cursor rules
cat > .cursor/rules.mdc << 'RULES'
---
description: "Project-specific AI behavior rules"
alwaysApply: true
---

# AI Assistant Rules

## Code Quality
- Write TypeScript with proper types
- Use functional components only  
- Files must not exceed 500 lines
- Include JSDoc comments for exports
- Follow existing patterns in codebase

## Context Management - CRITICAL
- **Update @project-history.md every 5-10 file changes**
- Check @CLAUDE.md at session start
- Track file modification count
- Prompt for history updates regularly

## Development Workflow
- Ask 3-5 clarifying questions when requirements are ambiguous
- Run tests before marking any task as complete
- Reference templates in 01-templates/ when creating docs
- Before creating components, check for existing similar ones

## Error Handling
- Always throw errors instead of silent failures
- Implement proper error boundaries
- Add loading states for async operations
- Include retry logic for network requests

## Security
- Never expose sensitive keys in client code
- Validate all user inputs
- Use environment variables for configuration
- Enable CORS appropriately
RULES

# Create CLAUDE.md
cat > CLAUDE.md << CLAUDE
# Project: ${PROJECT_NAME}

## Tech Stack
- Next.js 15+ with App Router
- TypeScript
- Tailwind CSS + shadcn/ui
- SQLite (dev) → Supabase (prod)
- Prisma ORM
- NextAuth.js

## Current Phase
- [ ] Phase 0: Setup
- [ ] Phase 1: Frontend Foundation
- [ ] Phase 2: Frontend Features  
- [ ] Phase 3: Backend Integration
- [ ] Phase 4: Testing & Polish
- [ ] Phase 5: Production & Migration

## Recent Changes
Last Updated: $(date)
Files Modified: 0

## Conventions
- Functional components only
- Files < 500 lines
- Kebab-case files, PascalCase components
- Update project-history.md every 5-10 changes
CLAUDE

# Create initial project history
cat > _docs/project-history.md << HISTORY
# Project History

## $(date) - Initial Setup
- Created project with Next.js, TypeScript, Tailwind
- Installed development dependencies
- Set up SQLite with Prisma
- Configured shadcn/ui
- Added ESLint and Prettier
- Created folder structure
- Initialized Git repository

**Next Steps:**
- Begin Phase 1: Frontend Foundation
- Create layout components
- Set up routing structure
HISTORY

# Create brainstorm README
cat > project_brainstorm/README.md << 'BRAINSTORM'
# Project Brainstorm

This folder contains initial ideas, requirements, and planning documents for the project.

## What to Include
- `initial-ideas.md` - Core concept and vision
- `requirements.md` - Functional and technical requirements  
- `user-stories.md` - User personas and their needs
- `competitor-analysis.md` - Market research
- `technical-decisions.md` - Architecture choices
- Any sketches, wireframes, or mockups

## Usage
Before generating formal documentation, the AI will read all files in this folder to understand the project context.
BRAINSTORM

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🔧 Setting up Git hooks with Husky..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Initialize Git
git init

# Initialize Husky
npx husky-init && npm install

# Create pre-commit hook
npx husky add .husky/pre-commit "npx lint-staged"

# Create lint-staged config
cat > .lintstagedrc.json << 'STAGED'
{
  "*.{js,jsx,ts,tsx}": ["prettier --write", "eslint --fix"],
  "*.{json,md,css}": ["prettier --write"]
}
STAGED

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📜 Updating package.json scripts..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Generate Prisma client and create initial migration
npx prisma generate
npx prisma migrate dev --name init

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "💾 Making first commit..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Stage and commit
git add -A
git commit -m "Initial project setup with Cursor template" --no-verify

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Setup Complete\!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📖 Next steps:"
echo "1. cd $PROJECT_NAME"
echo "2. npm run dev (starts development server)"
echo "3. Open in Cursor and start with Phase 1"
echo "4. Add your ideas to project_brainstorm/"
echo "5. Generate docs using GROK-NEW-PROJECT-SETUP.md"
echo ""
echo "💡 Remember to update project-history.md every 5-10 file changes\!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
