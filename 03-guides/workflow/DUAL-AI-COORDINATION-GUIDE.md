# Dual AI Coordination Guide
## Managing Claude Code & Cursor Claude in Parallel

This guide provides practical instructions for running both Claude Code and Cursor Claude on the same project simultaneously, ensuring they work in harmony without conflicts.

## Quick Start Setup

### 1. Initial Workspace Configuration
```bash
# In your project root
mkdir -p .ai-coordination
touch .ai-coordination/status.md
touch CLAUDE.md

# Create two terminal tabs/windows
# Terminal 1: For Claude Code
# Terminal 2: For Cursor (keep terminal visible)
```

### 2. Start Both AIs
```bash
# Terminal 1 - Claude Code
claude-code
# First command: "Read CLAUDE.md and phase-0-claude-code.md to understand your tasks"

# Terminal 2 - In Cursor
# Open Cursor Chat (Cmd+L)
# First prompt: "Read CLAUDE.md and phase-0-cursor-claude.md to understand your tasks"
```

## Real-Time Coordination Dashboard

### Create `.ai-coordination/status.md`
```markdown
# AI Coordination Status - [Project Name]
Last Updated: [Timestamp]

## 🤖 Claude Code Status
**Current Task:** CC-0.5 - Design database schema
**Files Being Modified:** /prisma/schema.prisma
**Status:** In Progress (50%)
**ETA:** 15 minutes
**Blocked:** No
**Last Commit:** CC: Initialize Prisma with SQLite

## 🎨 Cursor Claude Status  
**Current Task:** CU-0.3 - Configure Tailwind CSS
**Files Being Modified:** tailwind.config.ts, app/globals.css
**Status:** In Progress (75%)
**ETA:** 5 minutes
**Blocked:** Waiting for CC-0.6 (types)
**Last Commit:** CU: Set up Next.js with App Router

## 🔄 Sync Points Today
- [ ] 10:00 AM - Morning sync
- [ ] 12:00 PM - Pre-lunch checkpoint
- [ ] 2:00 PM - Afternoon sync
- [ ] 4:00 PM - End of day wrap-up

## ⚠️ Potential Conflicts
- None currently identified

## 📝 Handoff Queue
1. CC-0.6 → CU-0.7: Database types ready for UI
2. CC-0.11 → CU-0.11: API client types available
```

## Communication Patterns

### Pattern 1: The Morning Standup
```markdown
# Daily at 9 AM (or start of coding session)

## Claude Code Morning Brief:
"Good morning! Today I'll be working on:
1. Database schema design (CC-0.5 to CC-0.10)  
2. API structure setup (CC-0.7 to CC-0.9)
3. Will have types ready by 10:30 AM for your UI work
What do you need from me today?"

## Cursor Claude Morning Brief:
"Good morning! My plan for today:
1. Frontend framework setup (CU-0.2 to CU-0.6)
2. Will pause at CU-0.7 to wait for your types
3. Then continue with UI configuration
Any specific UI requirements I should know about?"
```

### Pattern 2: The Sync Point Check
```markdown
# Every 2 hours or 5 tasks

## Quick Sync Template:
"SYNC CHECK - [Time]
✅ Completed: [List last 3 tasks]
🔄 Current: [Current task and progress]
⏭️ Next: [Next 2 planned tasks]
⚠️ Blockers: [Any blockers or needs]
📁 Modified: [List of files changed]"
```

### Pattern 3: The Handoff
```markdown
# When passing work between AIs

## Handoff from Claude Code:
"HANDOFF READY - Authentication System
✅ What's Complete:
- JWT authentication at /api/auth/*
- User types in /types/generated.ts
- Auth hooks in /lib/auth/hooks.ts

📦 What You Can Use:
```typescript
import { useAuth } from '@/lib/auth/hooks'
import { User } from '@/types/generated'
```

🎯 Suggested Next Steps:
- Build login form component
- Create registration page
- Add auth to header component

⚠️ Notes:
- Login endpoint expects { email, password }
- Returns { token, user } on success
- Error format: { error: string, code: number }"
```

## File Coordination Strategy

### Ownership Map Visualization
```
project-root/
├── .ai-coordination/        # Shared coordination
│   └── status.md           # Both update
├── CLAUDE.md               # Both read, both update at sync points
├── src/
│   ├── app/                # CU primary, CC only /api routes
│   │   ├── api/           # CC exclusive
│   │   ├── (auth)/        # CU exclusive  
│   │   └── page.tsx       # CU exclusive
│   ├── components/         # CU exclusive
│   ├── lib/
│   │   ├── api-client.ts  # CC creates, CU uses
│   │   ├── server/        # CC exclusive
│   │   └── utils/         # Shared (coordinate)
│   └── types/
│       ├── generated.ts   # CC exclusive (auto-generated)
│       └── ui.ts          # CU exclusive
├── prisma/                 # CC exclusive
├── tests/                  # CC primary, CU for UI tests
└── public/                 # CU exclusive
```

### Conflict Prevention Rules

#### Rule 1: The "Claimed File" Protocol
```bash
# Before modifying a shared file
git add [file]
git commit -m "CC: CLAIMING - Working on lib/utils/format.ts"
# Work on file
git commit -m "CC: RELEASED - Finished lib/utils/format.ts"
```

#### Rule 2: The "Branch Strategy"
```bash
# Claude Code works on
git checkout -b cc/backend-setup

# Cursor Claude works on  
git checkout -b cu/frontend-setup

# Merge at sync points
git checkout main
git merge cc/backend-setup
git merge cu/frontend-setup
```

#### Rule 3: The "Import Only" Rule
```typescript
// Cursor Claude can IMPORT from Claude Code's files
import { apiClient } from '@/lib/api-client' // ✅ OK

// But should NEVER MODIFY them
// ❌ Don't edit api-client.ts directly
```

## Managing Dependencies

### When Claude Code Adds Dependencies
```bash
# Claude Code installs backend dependencies
npm install prisma @prisma/client bcryptjs jsonwebtoken
git add package*.json
git commit -m "CC: Add backend dependencies"
git push
```

### When Cursor Claude Adds Dependencies
```bash
# Cursor Claude installs UI dependencies
npm install @radix-ui/react-dialog framer-motion lucide-react
git add package*.json  
git commit -m "CU: Add UI dependencies"
git push
```

### Sync Protocol for Dependencies
```markdown
# After installing dependencies, announce:
"DEPENDENCY ADDED: [package-name]
Purpose: [what it's for]
Usage: [where it will be used]
Note: Please run 'npm install' to sync"
```

## Timeline Coordination

### Phase 0 Timeline (Parallel Execution)
```
Time    Claude Code              Cursor Claude
───────────────────────────────────────────────
0:00    CC-0.1: Init Git        CU-0.1: Wait
0:02    CC-0.2: Structure       CU-0.2: Next.js setup
0:07    CC-0.3: TypeScript      CU-0.3: Tailwind CSS
0:12    CC-0.4: Prisma init     CU-0.4: CSS variables
0:17    CC-0.5: Schema design   CU-0.5: shadcn/ui CLI
0:32    CC-0.6: SYNC point      CU-0.6: shadcn init
0:37    CC-0.7: API structure   CU-0.7: WAIT for types
0:47    CC-0.8: Auth system     CU-0.8: ESLint
1:07    CC-0.9: API client      CU-0.9: Prettier
1:22    CC-0.10: Gen types      CU-0.10: VS Code config
1:27    CC-0.11: HANDOFF        CU-0.11: Read types ✓
1:29    CC-0.12: Testing        CU-0.12: UI deps
... continues in parallel ...
```

## Emergency Protocols

### Scenario 1: Both AIs Modified Same File
```bash
# STOP BOTH AIs IMMEDIATELY

# Check the conflict
git status
git diff [conflicted-file]

# Resolution steps:
1. Determine who should own the file
2. Revert one set of changes:
   git checkout --theirs [file]  # Keep Cursor's changes
   # OR
   git checkout --ours [file]    # Keep Claude's changes

3. Update ownership rules in CLAUDE.md
4. Restart AIs with clear instructions
```

### Scenario 2: Cursor Claude Needs Types Earlier
```markdown
# Quick Fix Protocol
"URGENT: Need User type for UI component

Claude Code, please:
1. Pause current task
2. Run: npx prisma generate
3. Commit generated types
4. Tag me when ready

I'll use temporary types meanwhile:
```typescript
type TempUser = { id: string; email: string }
```
"
```

### Scenario 3: Claude Code Broke Frontend Build
```bash
# Cursor Claude notices build failure

"BUILD BREAK ALERT 🚨
Claude Code's last commit broke the build:
Error: [error message]
File: [file path]
Commit: [hash]

Reverting with:
git revert [commit-hash]

Please investigate and re-apply with fix"
```

## Performance Tracking

### Metrics to Monitor
```markdown
# Daily Metrics Log

## Productivity Metrics
- Tasks Completed: CC[10] + CU[12] = 22 total
- Sync Conflicts: 0
- Build Breaks: 1 (resolved in 5 min)
- Handoff Time: Avg 3 minutes
- Parallel Efficiency: 85% (some waiting)

## Quality Metrics  
- TypeScript Errors: 0
- ESLint Warnings: 3
- Test Coverage: 45%
- Accessibility Score: 92/100

## Time Saved
- Estimated Solo Time: 8 hours
- Actual Dual AI Time: 3 hours
- Efficiency Gain: 2.7x
```

## Best Practices Checklist

### Before Starting Each Day
- [ ] Both AIs read CLAUDE.md
- [ ] Both AIs check .ai-coordination/status.md
- [ ] Git pull to sync latest changes
- [ ] Review yesterday's handoff notes
- [ ] Clear any remaining blockers

### During Work Sessions
- [ ] Commit frequently with clear prefixes
- [ ] Update status.md every hour
- [ ] Announce file claims before editing
- [ ] Check for conflicts before major changes
- [ ] Sync every 5 tasks or 2 hours

### End of Day Protocol
- [ ] Complete current task (don't leave half-done)
- [ ] Commit all changes with descriptive messages
- [ ] Update CLAUDE.md with major decisions
- [ ] Write handoff notes for tomorrow
- [ ] Update project-history.md

## Command Aliases for Efficiency

Add to your `.bashrc` or `.zshrc`:
```bash
# Quick status check
alias ai-status='cat .ai-coordination/status.md'

# Quick sync commit
alias cc-sync='git add -A && git commit -m "CC: Sync point $(date +%H:%M)" && git push'
alias cu-sync='git add -A && git commit -m "CU: Sync point $(date +%H:%M)" && git push'

# Check recent commits from both
alias ai-log='git log --oneline -20 --grep="^CC:\|^CU:"'

# See who modified what
alias ai-blame='git diff --name-only HEAD~10'

# Quick conflict check
alias ai-conflict='git diff --name-only --diff-filter=U'
```

## VS Code/Cursor Tasks Configuration

Add to `.vscode/tasks.json`:
```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "AI: Sync Status",
      "type": "shell",
      "command": "echo 'Syncing...' && git pull && npm install && cat .ai-coordination/status.md",
      "problemMatcher": []
    },
    {
      "label": "AI: Claim File",
      "type": "shell",
      "command": "echo '${input:filename}' >> .ai-coordination/claimed.txt && git add . && git commit -m 'CU: CLAIMING - ${input:filename}'",
      "problemMatcher": []
    },
    {
      "label": "AI: Run Both Checklists",
      "type": "shell",
      "command": "code phase-0-claude-code.md && code phase-0-cursor-claude.md",
      "problemMatcher": []
    }
  ],
  "inputs": [
    {
      "id": "filename",
      "type": "promptString",
      "description": "File to claim"
    }
  ]
}
```

## Sample Working Session

### Real Example: Building Authentication UI
```markdown
10:00 AM - Claude Code
"Starting auth system implementation (CC-0.8)
Will have basic auth API ready in ~20 min
Endpoints will be: /api/auth/login, /api/auth/register"

10:05 AM - Cursor Claude
"Acknowledged. I'll prep the UI structure meanwhile.
Creating components/auth/ folder structure
Building form templates without types for now"

10:20 AM - Claude Code
"Auth API complete! Types generated.
User type: { id, email, name?, createdAt }
Auth response: { token, user }
Ready for UI integration"

10:22 AM - Cursor Claude  
"Perfect timing! Switching to login form.
Importing types from @/types/generated
Building LoginForm component with your API"

10:45 AM - Both
"SYNC POINT
CC: Auth system complete with tests
CU: Login/Register UI complete
No conflicts, merging to main"
```

This coordination guide ensures both AIs work efficiently together while maintaining clear boundaries and communication protocols.