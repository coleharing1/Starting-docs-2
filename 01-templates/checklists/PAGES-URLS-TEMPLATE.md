Project Pages and URLs with Build Status
Overview
The Project Pages and URLs document tracks all key pages/routes in your app, their URLs, descriptions, and current build status. This helps beginners visualize the app structure, monitor development progress, and quickly identify broken or incomplete areas. It's especially useful for web apps with routing (e.g., Next.js App Router). Include status indicators (e.g., Planned, In Progress, Complete, Broken) and links to code/docs.

Format as a markdown file (pages-urls-status.md) in _docs/. Use a table for easy scanning. Update it iteratively as you build phases.

Instructions for Use and Maintenance
Creation: Base on @user-flow.md and @project-overview.md. Prompt AI: "Generate pages-urls-status.md with a table of pages, URLs, descriptions, and initial status (all Planned)."

Structure Example (Table):

| Page/Route      | URL              | Description                              | Status       | Notes/Links                                                   |
|-----------------|------------------|------------------------------------------|--------------|---------------------------------------------------------------|
| Landing Page    | /                | Welcome screen with login/signup.        | In Progress  | Ref @user-flow.md; UI in `@components/Landing.tsx`.          |
| Dashboard       | /dashboard       | User metrics overview.                   | Planned      | Requires auth; ref @api-rules.md.                             |
| Profile Settings| /profile         | Edit user info.                           | Complete     | Tested; deploy status OK.                                     |
| Users API (ex.) | /api/v1/users    | Fetch user data.                         | Broken       | Error in auth—fix per @deployment-guide.md.                   |

Maintenance:

Update Status: After building/testing a page, change to "In Progress" or "Complete". If issues arise (e.g., deploy fail), mark "Broken" with notes.
AI Assistance: Prompt "Update @pages-urls-status.md: Set /dashboard to Complete and add note [details]."
Integration: Link to Git issues/PRs; review before deploys (ref @deployment-guide.md).
Frequency: Update after each commit affecting UI/routes; use in daily checks.
Tips for Beginners: Start with core pages from your user flows. Use browser dev tools to verify URLs/status locally. If adding a page, prompt AI for code stubs first.