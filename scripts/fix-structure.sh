#!/bin/bash
set -e

note() { echo "[fix] $1"; }

# Ensure directories
mkdir -p scripts 03-guides/workflow/prompts 03-guides/maintenance/audits 03-guides/appendix

# Normalize experimental file casing if present
if [ -f 03-guides/workflow/Ai-workflow-Gemini-CLI.md ]; then
  git mv 03-guides/workflow/Ai-workflow-Gemini-CLI.md 03-guides/workflow/experimental/AI-Workflow-Gemini-CLI.md || true
  note "Renamed experimental Gemini CLI doc"
fi

# Move example package template if at root
if [ -f package.template.json ]; then
  mkdir -p 01-templates/project-skeleton
  git mv package.template.json 01-templates/project-skeleton/package.template.json || true
  note "Moved package.template.json to project-skeleton/"
fi

# Validate
bash scripts/validate-kit.sh
