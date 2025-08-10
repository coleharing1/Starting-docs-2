# Content & Documentation Audit (Phase 1-2)
**Purpose**: Early-stage audit for documentation completeness, content structure, and information architecture
**Best Used**: During content creation and documentation phases (typically project phases 1-2)
**Complement**: Run `technical-production-audit.md` before deployment (phases 4-5)

## 🎯 Quick Configuration
```yaml
# Customize these for your project:
PROJECT_TYPE: [website|documentation|course|blog|app]
CONTENT_DIRS: [content/, docs/, pages/, src/content/]
DOC_DIRS: [_docs/, documentation/, README.md]
IGNORE_PATTERNS: [node_modules/, .next/, dist/, build/]
SCAN_MODE: [quick|deep] # quick: sample files, deep: all files
```

## 📋 Prerequisites (Load into Cursor First)
Before running this audit, load the following into context:
1. `@README.md` - Main project documentation
2. `@[CONTENT_DIR]` - Your main content directory
3. `@[DOC_DIR]` - Your documentation directory
4. `@package.json` - To understand project structure
5. `@.cursorrules` or `@.cursor/` - To understand AI rules
6. Use `@Recent Changes` to focus on recently modified content

## 🔍 Audit Scope & Phases

### Phase 1: Documentation Coverage Analysis
**Goal**: Ensure all features and components have appropriate documentation

#### Checks to Perform:
1. **README Completeness Score** (0-100%)
   - Project description and purpose
   - Installation instructions
   - Usage examples
   - Configuration options
   - Contributing guidelines
   - License information
   - Badge presence (CI/CD, version, etc.)

2. **Feature Documentation Mapping**
   ```
   For each major feature/component:
   - ✅ Has user-facing documentation
   - ✅ Has technical/API documentation
   - ✅ Has inline code comments
   - ✅ Has usage examples
   - ❌ Missing or incomplete
   ```

3. **Documentation Freshness**
   - Flag docs referencing outdated versions
   - Identify stale screenshots/diagrams
   - Check last-modified dates vs code changes
   - Verify changelog is up-to-date

### Phase 2: Content Quality & Consistency

#### AI-Generated Content Detection
Scan for these AI writing patterns and assign confidence scores:

1. **Repetitive Phrasing** (Confidence: %)
   - "It's important to note that..."
   - "In this section, we will..."
   - "Let's dive into..."
   - Excessive use of "Moreover," "Furthermore," "Additionally"

2. **Generic Examples** (Confidence: %)
   - foo/bar/baz variables everywhere
   - John Doe / jane@example.com
   - Lorem ipsum beyond intentional placeholders
   - TODO/FIXME without assignee or date

3. **Hallucination Indicators** (Confidence: %)
   - References to non-existent files/functions
   - Incorrect version numbers
   - Made-up configuration options
   - Phantom dependencies

4. **Voice/Tone Inconsistencies** (Confidence: %)
   - Sudden formality shifts
   - Mixed pronouns (we/you/one)
   - Inconsistent technical depth
   - Style guide violations

#### Content Structure Analysis

1. **Information Architecture**
   ```
   Evaluate:
   - Logical flow (score: 1-10)
   - Navigation clarity (score: 1-10)
   - Hierarchy consistency (score: 1-10)
   - Cross-referencing effectiveness (score: 1-10)
   ```

2. **File Length & Complexity**
   - Flag files >1000 lines (suggest splitting)
   - Identify deeply nested sections (>4 levels)
   - Find orphaned content (not linked anywhere)
   - Detect circular references

3. **Media & Assets**
   - Broken image links
   - Missing alt text (accessibility)
   - Unoptimized images (>1MB)
   - Unused media files
   - Missing diagrams for complex concepts

### Phase 3: Formatting & Standards Compliance

#### Markdown/MDX Quality
1. **Structural Issues**
   ```markdown
   Check for:
   - [ ] Consistent heading hierarchy (no h1 → h3 jumps)
   - [ ] Proper list nesting
   - [ ] Code fence language specification
   - [ ] Table formatting consistency
   - [ ] Link format standardization
   ```

2. **Accessibility Compliance**
   - Missing alt text for images
   - Poor color contrast in code examples
   - Missing language attributes
   - Lack of skip navigation links
   - Screen reader compatibility issues

3. **Code Example Quality**
   ```
   For each code block, verify:
   - Syntax correctness
   - Import statements included
   - Error handling shown
   - Edge cases covered
   - Output/result documented
   ```

### Phase 4: Pattern Recognition & Root Cause Analysis

#### Systematic Issue Detection
Identify patterns across multiple files:

1. **Copy-Paste Proliferation**
   - Identical paragraphs across files
   - Duplicated examples without variation
   - Repeated disclaimer text
   - Confidence: % (with file list)

2. **Incomplete Section Patterns**
   - Multiple "Coming soon" sections
   - Consistent missing subsections
   - Repeated placeholder patterns
   - Root cause hypothesis

3. **Authorship Conflicts**
   - Mixed writing styles in same file
   - Conflicting information between sections
   - Git blame analysis for multi-author files

## 📊 Output Format

### Executive Summary
```markdown
# Content & Documentation Audit Report
**Date**: [timestamp]
**Project**: [name]
**Scan Mode**: [quick/deep]
**Files Analyzed**: [count]

## Health Score: [XX]%
🟢 Pass (80-100%) | 🟡 Needs Work (50-79%) | 🔴 Critical Issues (<50%)

### Top 5 Issues (Immediate Action Required)
1. ❌ **[Issue]** - [File:line] - Impact: [High/Med/Low] - Fix time: [Xm]
2. ⚠️ **[Issue]** - [File:line] - Impact: [High/Med/Low] - Fix time: [Xm]
...

### Score Breakdown
- Documentation Coverage: [XX]%
- Content Quality: [XX]%
- AI Drift Detection: [XX]%
- Accessibility: [XX]%
- Structure & Organization: [XX]%
```

### Detailed Findings by Category

For each finding, provide:
```markdown
#### [Category]: [Issue Title]
- **Severity**: 🔴 High | 🟡 Medium | 🟢 Low
- **Location**: `path/to/file.md:line-range`
- **Issue**: [Specific description]
- **Evidence**: 
  ```[language]
  [code snippet or content excerpt]
  ```
- **Impact**: [Who is affected and how]
- **Root Cause**: [Why this likely happened]
- **Fix Suggestion**: [Specific actionable fix]
- **Fix Complexity**: Easy (5m) | Medium (30m) | Hard (2h+)
- **Confidence**: [High/Medium/Low with percentage]
```

### Pattern Analysis
```markdown
## Systematic Issues Detected
1. **Pattern**: [Description]
   - **Frequency**: Found in X files
   - **Files Affected**: [List]
   - **Root Cause Hypothesis**: [Why this keeps happening]
   - **Prevention Strategy**: [How to avoid in future]
```

### Actionable Fix Plan

#### Quick Wins (< 30 minutes total)
```markdown
| Priority | Issue | Location | Fix | Time |
|----------|-------|----------|-----|------|
| 1 | Missing README sections | README.md | Add installation guide | 10m |
| 2 | Broken image links | docs/guide.md:45-50 | Update image paths | 5m |
```

#### Deeper Work (Requires Planning)
```markdown
| Priority | Issue | Scope | Suggested Approach | Est. Time |
|----------|-------|-------|-------------------|-----------|
| 1 | Restructure documentation | All docs/ | Create information architecture | 4h |
| 2 | Standardize code examples | 15 files | Create snippet templates | 2h |
```

### Automation Opportunities
```markdown
## Suggested Automation
1. **Pre-commit Hook**: Add markdown linting
   ```bash
   npm install --save-dev markdownlint-cli
   echo "*.md" | npx markdownlint
   ```

2. **CI Check**: Documentation coverage
   ```yaml
   - name: Check Documentation
     run: npm run audit:docs
   ```
```

### Learning Resources
Based on issues found, review these resources:
- [Issue Type] → [Resource Link]
- Markdown Best Practices → [link]
- Documentation Standards → [link]
- Accessibility Guidelines → [link]

### Comparison to Industry Standards
```markdown
| Metric | Your Project | Industry Standard | Status |
|--------|--------------|-------------------|--------|
| Doc Coverage | X% | 80% | ✅/❌ |
| Accessibility Score | X/100 | 90/100 | ✅/❌ |
| Code Example Quality | X% | 95% | ✅/❌ |
```

## 🔄 Next Steps
1. Fix all 🔴 High severity issues before proceeding
2. Address Quick Wins to improve score by ~X%
3. Run `technical-production-audit.md` after fixes
4. Set up automation to prevent regression

## 📝 Audit Metadata
- **Tokens Used**: [count]
- **Processing Time**: [duration]
- **Ignored Patterns**: [list]
- **Framework Detected**: [Next.js/React/Vue/etc]
- **Content Type**: [markdown/mdx/rst/etc]

---
*Generated by Content & Documentation Audit v2.0*
*For technical and production readiness, run `technical-production-audit.md`*