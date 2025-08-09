# Project Overview Template Guide for LLMs

This markdown document serves as a general template and guide for large language models (LLMs) to generate a high-quality `project-overview.md` file for any new project. The `project-overview.md` is the foundational document in a project's documentation structure, establishing the context, purpose, scope, and goals. It acts as a reference point for all subsequent documents, such as user flows, tech stacks, and development phases.

As an LLM, use this guide to create concise, clear, and actionable project overviews based on user input. Avoid assumptions or embellishments—stick to the provided details. If key information is missing, ask clarifying questions. Aim for brevity (300-800 words) while ensuring completeness.

## Key Principles for a Great Project Overview
A strong project overview should:
- **Be User-Centric**: Focus on solving real problems for target users.
- **Be Actionable**: Define measurable goals and success criteria.
- **Be Comprehensive Yet Concise**: Cover essentials without unnecessary details.
- **Align with Best Practices**: Draw from agile methodologies, emphasizing iteration, scalability, and feasibility.
- **Incorporate Context**: Reference any provided user prompts, existing docs, or industry standards (e.g., for web apps, consider accessibility and performance).
- **Encourage Iteration**: Treat this as a living document that can evolve.

Common pitfalls to avoid:
- Overly vague language (e.g., use specifics like "target 10,000 daily users" instead of "scale well").
- Unsubstantiated assumptions (e.g., query the user if tech constraints aren't specified).
- Excessive length—prioritize readability with headings, bullet points, and tables.

## Recommended Structure
Structure the `project-overview.md` with the following sections. Use markdown formatting for clarity (e.g., # for headers, - for lists, | for tables). Populate based on user input, using placeholders if needed.

### 1. Project Title
- Provide a clear, descriptive name for the project.
- Example: "# AI-Powered Recipe Generator App"

### 2. Executive Summary
- A 1-2 paragraph high-level overview.
- Include: What the project is, why it exists, and its unique value proposition.
- Example:  
  "This project builds a web application that uses AI to generate personalized recipes based on user ingredients and preferences. It addresses the pain point of meal planning for busy individuals by integrating natural language processing and a database of nutritional data, aiming to reduce food waste and promote healthy eating."

### 3. Purpose and Objectives
- Define the core problem(s) being solved.
- List 3-5 SMART (Specific, Measurable, Achievable, Relevant, Time-bound) objectives.
- Example Bullet Points:
  - Solve: Users struggle to create meals from available ingredients.
  - Objective 1: Develop an MVP that generates 5 recipe suggestions per query within 2 seconds.
  - Objective 2: Integrate user authentication for saving favorites, targeting 80% user retention in the first month.

### 4. Target Audience and User Personas
- Describe primary users (demographics, needs, pain points).
- Use 1-3 personas for vividness.
- Example Table:

  | Persona | Description | Needs | Pain Points |
  |---------|-------------|-------|-------------|
  | Busy Parent | 30-45 years old, working full-time with kids. | Quick, family-friendly recipes. | Limited time for shopping/cooking. |
  | Health Enthusiast | 25-35, fitness-focused. | Nutritional breakdowns. | Tracking macros manually. |

### 5. Scope
- In-Scope: Core features and deliverables.
- Out-of-Scope: What won't be included (to manage expectations).
- Assumptions and Dependencies: E.g., "Assumes access to OpenAI API; depends on stable internet."
- Example:
  - In-Scope: User registration, AI recipe generation, basic search.
  - Out-of-Scope: Mobile app version, advanced e-commerce integration.

### 6. Goals and Success Metrics
- High-level goals (e.g., "Achieve viral growth via social sharing").
- Metrics: KPIs like user acquisition targets, performance benchmarks.
- Example:
  - Goal: Launch MVP in 3 months.
  - Metrics: 1,000 active users in first quarter; 4.5+ app rating.

### 7. Risks and Mitigations
- Identify 3-5 potential risks (e.g., API rate limits, data privacy issues).
- Suggest mitigations.
- Example Bullet Points:
  - Risk: High AI costs—Mitigation: Implement caching and usage quotas.
  - Risk: User data breaches—Mitigation: Use GDPR-compliant auth services.

### 8. Next Steps
- Outline immediate actions, such as creating user-flow.md or tech-stack.md.
- Reference any sequential workflow (e.g., from a setup guide).

## How to Generate as an LLM
1. **Gather Input**: Prompt the user for details (e.g., "What is the project's main goal? Who are the target users?").
2. **Customize**: Tailor to project type (e.g., for AI apps, emphasize ethical considerations; for web apps, focus on responsiveness).
3. **Validate**: Ensure alignment with any attached docs (e.g., @user-flow.md if available).
4. **Output Format**: Always output as a standalone markdown file, starting with the title header.
5. **Iterate**: If the user provides feedback, refine accordingly.

Example Prompt for You (as LLM): "Using this template, create project-overview.md for a [project description]."

This template ensures generated overviews are structured, professional, and effective for guiding project development.