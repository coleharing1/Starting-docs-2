#!/bin/bash
set -e

errors=0
note() { echo "[info] $1"; }
err() { echo "[error] $1"; errors=$((errors+1)); }

# Required top-level files
for f in README.md START-HERE.md LICENSE; do
  [ -f "$f" ] || err "Missing $f"
done

# Prompts and guides locations
[ -d 03-guides/workflow/prompts ] || err "Missing prompts directory"
[ -d 03-guides/maintenance/audits ] || err "Missing audits directory"

# No stale GROK references
if rg -n "GROK-NEW-PROJECT-SETUP.md" -S . >/dev/null; then
  err "Found stale GROK references"
fi

# File length check (<500 lines) for templates and guides (warn only)
while IFS= read -r -d '' f; do
  lines=$(wc -l < "$f")
  if [ "$lines" -gt 500 ]; then
    note "Long file (>500 lines): $f ($lines)"
  fi
done < <(fd -t f "" 01-templates 03-guides -0)

# Cursor rules modules existence
for f in 01-templates/ai-config/.cursor/rules/modules/{frontend-react.mdc,backend-node.mdc,testing.mdc,docs.mdc,python.mdc}; do
  [ -f "$f" ] || err "Missing rules module: $f"
done

if [ $errors -gt 0 ]; then
  echo "Validation failed with $errors error(s)."; exit 1
else
  echo "Validation passed."; exit 0
fi
