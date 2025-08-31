#!/bin/bash

# 🚀 Quick Start Script for Cursor Projects
# Run this single script to set up everything automatically

echo "🎯 Starting Cursor Project Quick Setup..."

# Get project name
read -p "Enter your project name (kebab-case): " PROJECT_NAME

# Create project directory
mkdir -p $PROJECT_NAME
cd $PROJECT_NAME

echo "📦 Initializing Next.js with TypeScript and Tailwind..."
npx create-next-app@latest . \
  --typescript \
  --tailwind \
  --app \
  --src-dir \
  --import-alias "@/*" \
  --no-eslint

echo "📚 Setting up project structure..."
mkdir -p src/{components,lib,hooks,types,styles}
mkdir -p _docs/phases
mkdir -p project_brainstorm
mkdir -p .cursor

echo "💾 Installing SQLite and Prisma for development..."
npm install --save-dev prisma @prisma/client
npx prisma init --datasource-provider sqlite

echo "📋 Installing essential packages..."
npm install \
  @tanstack/react-query \
  zustand \
  react-hook-form \
  @hookform/resolvers \
  zod \
  @t3-oss/env-nextjs \
  lucide-react \
  clsx \
  tailwind-merge \
  date-fns

npm install --save-dev \
  @types/node \
  prettier \
  eslint-config-prettier \
  husky \
  lint-staged

echo "🎨 Installing shadcn/ui..."
npx shadcn-ui@latest init -y

echo "📝 Creating configuration files..."

# Create .env.local
cat > .env.local << 'EOF'
# Development Environment Variables
DATABASE_URL="file:./prisma/dev.db"
NEXT_PUBLIC_APP_URL="http://localhost:3000"
EOF

# Create prettier config
cat > .prettierrc << 'EOF'
{
  "semi": false,
  "singleQuote": true,
  "tabWidth": 2,
  "trailingComma": "es5"
}
EOF

# Create basic Cursor rules
cat > .cursor/rules.mdc << 'EOF'
---
description: "Project AI Rules"
alwaysApply: true
---
# AI Assistant Rules
- Write TypeScript with proper types
- Use functional components only
- Implement error boundaries
- Add loading states
- Files under 500 lines
- Update project-history.md every 5-10 files
EOF

# Create CLAUDE.md
cat > CLAUDE.md << 'EOF'
# Project: ${PROJECT_NAME}

## Tech Stack
- Next.js 14+ with App Router
- TypeScript
- Tailwind CSS + shadcn/ui
- SQLite (dev) → Supabase (prod)
- Prisma ORM

## Current Status
- Phase 0: Setup ✅
- Phase 1: Frontend Foundation [ ]
- Phase 2: Features [ ]
- Phase 3: Backend [ ]
- Phase 4: Testing [ ]
- Phase 5: Production [ ]

## File Count: 0
Last Updated: $(date)
EOF

# Create project-history.md
cat > _docs/project-history.md << 'EOF'
# Project History

## $(date) - Initial Setup
- Created project with Next.js, TypeScript, Tailwind
- Installed essential packages
- Set up project structure
- Configured Prisma with SQLite
- Added shadcn/ui
EOF

# Initialize Git
git init
git add .
git commit -m "Initial project setup with quick-start script"

# Setup Husky
npx husky-init && npm install
npx husky add .husky/pre-commit "npx lint-staged"

# Create lint-staged config
cat > .lintstagedrc.json << 'EOF'
{
  "*.{js,jsx,ts,tsx}": ["prettier --write", "eslint --fix"],
  "*.{json,md}": ["prettier --write"]
}
EOF

echo "✅ Project setup complete!"
echo ""
echo "📖 Next steps:"
echo "1. cd $PROJECT_NAME"
echo "2. npm run dev"
echo "3. Open in Cursor and start with Phase 1"
echo ""
echo "💡 Remember to update project-history.md every 5-10 file changes!"