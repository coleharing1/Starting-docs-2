# Project Rules Template Guide for LLMs

This markdown document serves as a general template and guide for large language models (LLMs) to generate a high-quality `project-rules.md` file for any new project. The `project-rules.md` defines the codebase's organizational and stylistic conventions, ensuring modularity, scalability, and AI compatibility. It builds upon documents like `project-overview.md`, `tech-stack.md`, `ui-rules.md`, and `theme-rules.md`, and aligns with user-defined rules for clean, production-grade code.

As an LLM, use this guide to create tailored, enforceable rules based on user input. Avoid assumptions—reference provided details and ask clarifying questions if needed (e.g., "Preferred folder structure? Any specific style guides?"). Aim for brevity (300-600 words) with code examples for implementation. Emphasize AI-first practices: files under 500 lines, descriptive names/comments, functional patterns.

## Key Principles for a Great Project Rules Document
A strong `project-rules.md` should:
- **Promote AI Compatibility**: Limit file sizes (<500 lines), use semantic naming, and add @fileoverview summaries for easy searching/understanding.
- **Ensure Scalability**: Define modular structures (e.g., separate concerns like components/lib) and DRY methods.
- **Align with User Rules**: Incorporate functional/declarative code, descriptive vars (e.g., isLoading), JSDoc blocks, no classes, throw errors over fallbacks.
- **Be Enforceable**: Include examples, pitfalls, and integration with tools (e.g., linters like ESLint).
- **Encourage Consistency**: Cover directory structure, naming, code style, and best practices.
- **Be Iterative**: Treat as a living doc; update via phases.

Common pitfalls to avoid:
- Vague Rules (e.g., specify 'kebab-case for files' instead of 'consistent naming').
- Over-Restriction (e.g., allow flexibility for edge cases).
- Ignoring Tech Stack (e.g., tailor to Next.js App Router conventions).

## Recommended Structure
Structure the `project-rules.md` with the following sections. Use markdown formatting for clarity (e.g., # for headers, - for lists, ```code blocks for examples).

### 1. Project Rules Overview
- Provide a title and 1-2 paragraph summary.
- Include: Rationale (e.g., AI-first for navigability), key focuses (modularity, code style).
- Example:  
  "# Project Rules: AI-First Codebase Conventions  
  This document outlines rules for our codebase to ensure it's modular, scalable, and optimized for AI tools. We prioritize functional patterns, descriptive elements, and <500-line files, aligning with [tech-stack.md] for Next.js and Supabase."

### 2. Directory Structure
- Define folders (e.g., app/, components/, lib/, _docs/).
- Example List:
  - app/: Next.js routes and pages.
  - components/: Reusable UI elements.
  - lib/: Utilities, hooks, API clients.
  - _docs/: All documentation (overviews, rules).

### 3. Naming Conventions
- Files: kebab-case (e.g., my-component.tsx).
- Components: PascalCase (e.g., MyComponent).
- Variables: Descriptive with auxiliaries (e.g., isLoading, hasError).
- Functions: Descriptive (e.g., fetchUserData).

### 4. Code Style and Best Practices
- Core Rules: Functional/declarative; no classes; iteration over duplication; throw errors.
- Comments: @fileoverview at top; JSDoc for functions (e.g., @description).
- Other: Maps over enums; concise conditionals; pure functions with 'function' keyword.
- Example JSDoc:
  ```typescript
  /**
   * @description Fetches user data from API.
   * @param {string} userId - The user's ID.
   * @returns {Promise<User>} User object.
   */
  async function fetchUserData(userId: string): Promise<User> {
    // ...
  }
  ```

### 5. File Guidelines
- Max Length: <500 lines—split if larger.
- Headers: Add @fileoverview summary.
- Imports: Absolute paths or aliases.

### 6. Tools and Enforcement
- Linters: ESLint with plugins for rules.
- Hooks: Husky for pre-commit checks.
- Integration: Tie to phases (e.g., enforce in MVP).

### 7. References and Next Steps
- Link to related docs (e.g., `tech-stack.md`).
- Suggest audits (e.g., lint on CI).

## How to Generate as an LLM
1. **Gather Input**: Prompt for details (e.g., "Folder preferences? Style emphases?").
2. **Customize**: Tailor to stack (e.g., Next.js-specific) and user rules (functional, descriptive).
3. **Validate**: Cross-reference with `tech-stack.md` and user rules for consistency.
4. **Output Format**: Standalone markdown starting with title.
5. **Iterate**: Refine based on feedback.

Example Prompt: "Using this template, create project-rules.md for a [project description] with [preferences]." 