Project Key Features Checklist
Overview
The Project Key Features Checklist is a living document that outlines the core functionalities and requirements of your project. It serves as a quick reference to track progress, ensure nothing is overlooked, and align development with your goals (as defined in @project-overview.md). Use it throughout the project lifecycle—review it during planning, update during phases (e.g., MVP), and check off items as they're completed. This helps beginners stay organized and provides a clear "definition of done" for each feature.

Format it as a markdown file (key-features-checklist.md) in your _docs/ folder. Structure it with categories (e.g., Core, UI, Backend) and checkboxes for tracking. Include priorities (High/Med/Low) and links to related docs (e.g., @user-flow.md for details).

Instructions for Use and Maintenance
Creation: Start by generating this from @project-overview.md and @user-flow.md. Prompt your AI: "Create key-features-checklist.md with checkboxes, priorities, and links to docs. Base on project goals and features."
Structure Example:
Core Features:
 User Authentication (High) - Secure login/register; ref @user-flow.md.
 Data Dashboard (Med) - Display user metrics; ref @ui-rules.md.
UI/UX Features:
 Responsive Design (High) - Mobile-first; ref @theme-rules.md.
Backend/DB Features:
 API Endpoints (High) - CRUD operations; ref @api-rules.md.
 Database Schema (Med) - Migrations setup; ref @database-overview.md.
Testing/Deployment:
 Unit Tests (Med) - 80% coverage; ref @testing-rules.md.
 Prod Deploy (Low) - Vercel setup; ref @deployment-guide.md.
Maintenance:
Review weekly or per phase: Check off completed items; add notes (e.g., "Implemented in commit XYZ").
Update via AI: After changes, prompt "Update @key-features-checklist.md with new feature [description] and set priority."
Version Control: Commit changes to Git; reference in pull requests.
Tips for Beginners: Use this as a roadmap—focus on High priorities first. If stuck, ask AI: "How to implement [feature] based on @tech-stack.md?"