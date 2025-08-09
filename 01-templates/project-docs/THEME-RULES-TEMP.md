# Theme Rules Template Guide for LLMs

This markdown document serves as a general template and guide for large language models (LLMs) to generate a high-quality `theme-rules.md` file for any new project. The `theme-rules.md` defines the visual foundation of the application, including colors, typography, spacing, and other stylistic elements to ensure consistency across UI components. It builds upon documents like `project-overview.md`, `user-flow.md`, `tech-stack.md`, and `ui-rules.md`, and is used to guide implementation in CSS frameworks (e.g., Tailwind CSS) or design systems.

As an LLM, use this guide to create practical, scalable, and accessible theme rules based on user input. Avoid unsubstantiated assumptions—reference provided project details and ask clarifying questions if needed (e.g., "What primary color scheme do you prefer?"). Aim for brevity (400-1000 words) with code snippets for implementation. Ensure themes are responsive, accessible (e.g., WCAG-compliant contrast ratios), and adaptable (e.g., light/dark modes).

## Key Principles for a Great Theme Rules Document
A strong `theme-rules.md` should:
- **Promote Consistency**: Define reusable variables for colors, fonts, etc., to avoid ad-hoc styling.
- **Be Flexible**: Support variations like themes (light/dark), modes (e.g., high-contrast), and scalability (e.g., responsive breakpoints).
- **Align with Project Goals**: Reflect the app's tone (e.g., minimalist for productivity apps, vibrant for social platforms) based on `project-overview.md` and `ui-rules.md`.
- **Incorporate Best Practices**: Use semantic naming, accessibility considerations (e.g., ARIA-friendly colors), and performance optimizations (e.g., minimal font loads).
- **Be Implementable**: Include code examples for the chosen tech stack (e.g., Tailwind config or CSS variables).
- **Encourage Iteration**: Note how themes can evolve, with tools like Figma for prototyping.

Common pitfalls to avoid:
- Overcomplication (e.g., too many colors—limit to 5-10 core ones).
- Ignoring Accessibility (e.g., ensure 4.5:1 contrast for text).
- Lack of Examples (e.g., always show usage in code or mockups).
- Assumptions about Tools (e.g., confirm if using Tailwind, CSS-in-JS, etc., from `tech-stack.md`).

## Recommended Structure
Structure the `theme-rules.md` with the following sections. Use markdown formatting for clarity (e.g., # for headers, - for lists, ```code blocks for examples, | for tables). Populate based on user preferences (e.g., "minimalist" style) and project context.

### 1. Theme Title and Overview
- Provide a descriptive title and 1-2 paragraph summary.
- Include: Chosen style (e.g., minimalist, neumorphic), rationale, and how it ties to the project's brand or user experience.
- Example:  
  "# Theme Rules: Minimalist Light/Dark Mode  
  This theme adopts a minimalist design with clean lines, ample whitespace, and a neutral palette to enhance readability and focus. It supports light and dark modes for user comfort, aligning with the productivity app's goal of reducing distractions as per [project-overview.md]. Built for Tailwind CSS integration."

### 2. Color Palette
- Define primary, secondary, accent, neutral, and semantic colors (e.g., success/error).
- Use modes (light/dark) and provide hex/RGB/HSL values.
- Include contrast checks and usage guidelines.
- Example Table:

  | Color Name | Light Mode (Hex) | Dark Mode (Hex) | Usage |
  |------------|------------------|-----------------|-------|
  | Primary | #007BFF | #0D6EFD | Buttons, links |
  | Secondary | #6C757D | #ADB5BD | Text, borders |
  | Accent | #FFC107 | #FFCA2C | Highlights, warnings |
  | Success | #198754 | #20C997 | Positive feedback |
  | Error | #DC3545 | #F26C7C | Alerts, errors |

- Code Example (for Tailwind config.js):  
  ```javascript
  module.exports = {
    theme: {
      extend: {
        colors: {
          primary: '#007BFF',
          // ... other colors
        },
      },
    },
  };
  ```

### 3. Typography
- Specify fonts, sizes, weights, line heights, and letter spacing.
- Define scales (e.g., headings H1-H6, body text).
- Ensure web-safe or Google Fonts integration.
- Example:
  - Font Family: Primary: 'Inter', sans-serif; Fallback: system-ui.
  - Sizes: Base: 16px; H1: 2.25rem (36px); Body: 1rem.
- Code Example (CSS Variables):  
  ```css
  :root {
    --font-family-primary: 'Inter', sans-serif;
    --font-size-base: 16px;
    --font-size-h1: 2.25rem;
  }
  ```

### 4. Spacing and Layout
- Define a spacing scale (e.g., 4px increments) for margins, paddings, gaps.
- Include grid systems, breakpoints for responsiveness.
- Example List:
  - Base Unit: 4px (rem-based for scalability).
  - Spacings: xs: 0.25rem (4px), sm: 0.5rem (8px), md: 1rem (16px), lg: 1.5rem (24px), xl: 2rem (32px).
- Breakpoints: Mobile: 0-639px, Tablet: 640-1023px, Desktop: 1024px+.

### 5. Icons and Imagery
- Guidelines for icon sets (e.g., Heroicons, Font Awesome), sizes, and styles.
- Rules for images: Aspect ratios, compression, alt text for accessibility.
- Example: Use SVG icons at 24x24px for buttons; Ensure images are lazy-loaded.

### 6. Shadows, Borders, and Effects
- Define elevations (shadows), border radii, transitions.
- Example:
  - Shadow Levels: sm: 0 1px 2px rgba(0,0,0,0.05); md: 0 4px 6px rgba(0,0,0,0.1).
  - Border Radius: Default: 0.375rem (6px); Pills: 9999px.

### 7. Accessibility and Variations
- Ensure WCAG compliance (e.g., color contrast tools like WebAIM).
- Define variants: High-contrast mode, reduced motion.
- Example: Use media queries for prefers-color-scheme and prefers-reduced-motion.

### 8. Implementation Guidelines
- How to apply in code (e.g., via classes in Tailwind).
- Tools for Testing: Storybook for components, Figma for mocks.
- Maintenance: How to update themes (e.g., via design tokens).

### 9. References and Next Steps
- Link to related docs (e.g., `ui-rules.md`).
- Suggest prototyping or auditing tools.

## How to Generate as an LLM
1. **Gather Input**: Prompt for details (e.g., "What theme style? Light/dark support? Colors from brand guidelines?").
2. **Customize**: Tailor to tech stack (e.g., CSS vars for vanilla, config for Tailwind) and project type (e.g., vibrant for gaming apps).
3. **Validate**: Cross-reference with `ui-rules.md` for design principles and `tech-stack.md` for tools.
4. **Output Format**: Always output as a standalone markdown file, starting with the title header.
5. **Iterate**: If feedback is given, refine (e.g., add more colors).

Example Prompt for You (as LLM): "Using this template, create theme-rules.md for a [project description] with [style preferences]."