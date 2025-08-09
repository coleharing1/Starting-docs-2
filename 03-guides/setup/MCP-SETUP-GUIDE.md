# MCP (Model Context Protocol) Setup Guide for Supabase & Cursor/Claude Code

This guide provides step-by-step instructions for setting up MCP servers to connect your AI assistants (Cursor and Claude Code) directly to Supabase and other services. MCP enables AI tools to perform database operations, manage schemas, and execute queries autonomously while maintaining security.

## What is MCP?

Model Context Protocol (MCP) is a standardized protocol that allows Large Language Models (LLMs) to communicate with external platforms and services. Think of it as giving your AI assistant hands to interact with your tools directly, rather than just providing advice.

### Key Benefits:
- **Direct Database Access**: AI can query tables, create schemas, run migrations
- **Reduced Context Switching**: No jumping between tabs or copying credentials
- **Autonomous Operations**: AI can perform multi-step database tasks independently
- **Consistent Interface**: Same protocol works across different AI tools

## Prerequisites

- Cursor AI or Claude Code installed
- Supabase account with a project created
- Node.js 18+ installed
- Project initialized with package.json

## Step 1: Create Supabase Personal Access Token

1. Go to [Supabase Dashboard](https://app.supabase.com)
2. Click on your avatar (top right) → **Account Settings**
3. Navigate to **Access Tokens** tab
4. Click **Generate New Token**
5. Give it a descriptive name: `Cursor-MCP-Server` or `Claude-MCP-Integration`
6. Copy the token immediately (you won't see it again)
7. Store it securely in a password manager

⚠️ **Security Warning**: This token has full access to your Supabase account. Never commit it to version control or share it publicly.

## Step 2: Get Your Project Reference

1. In Supabase Dashboard, select your project
2. Go to **Settings** → **General**
3. Copy the **Reference ID** (looks like: `abcdefghijklmnop`)

## Step 3: Configure MCP in Cursor

### Option A: Global Configuration (Recommended)

1. Open Cursor Settings:
   - Mac: `Cmd+,` → **MCP**
   - Windows/Linux: `Ctrl+,` → **MCP**

2. Click **Edit Config** or create `~/.cursor/config.json`

3. Add this configuration:

```json
{
  "mcpServers": {
    "supabase": {
      "command": "npx",
      "args": [
        "-y",
        "@supabase/mcp-server-supabase@latest",
        "--read-only",
        "--project-ref=YOUR_PROJECT_REF"
      ],
      "env": {
        "SUPABASE_ACCESS_TOKEN": "YOUR_PERSONAL_ACCESS_TOKEN"
      }
    }
  }
}
```

4. Replace:
   - `YOUR_PROJECT_REF` with your Supabase project reference
   - `YOUR_PERSONAL_ACCESS_TOKEN` with the token from Step 1

5. Save and restart Cursor

### Option B: Project-Specific Configuration

1. Create `.cursor/mcp-config.json` in your project root:

```json
{
  "mcpServers": {
    "supabase-dev": {
      "command": "npx",
      "args": [
        "-y",
        "@supabase/mcp-server-supabase@latest",
        "--read-only",
        "--project-ref=dev-project-ref"
      ],
      "env": {
        "SUPABASE_ACCESS_TOKEN": "${SUPABASE_MCP_TOKEN}"
      }
    },
    "supabase-prod": {
      "command": "npx",
      "args": [
        "-y",
        "@supabase/mcp-server-supabase@latest",
        "--read-only",
        "--project-ref=prod-project-ref"
      ],
      "env": {
        "SUPABASE_ACCESS_TOKEN": "${SUPABASE_MCP_TOKEN}"
      }
    }
  }
}
```

2. Add to `.env.local`:
```env
SUPABASE_MCP_TOKEN=your_personal_access_token
```

3. Add `.cursor/mcp-config.json` to `.gitignore`

## Step 4: Configure MCP in Claude Code

1. Open Claude Code Settings
2. Navigate to MCP configuration
3. Add the same configuration as above
4. Claude Code will prompt for approval on each tool use

## Step 5: Verify Connection

### In Cursor:

1. Open Settings → MCP
2. You should see a green "Active" status next to "supabase"
3. If red, check your configuration and credentials

### Test with a prompt:

```
Using the Supabase MCP connection, show me all tables in my database
```

The AI should be able to list your database tables directly.

## Step 6: Security Configuration

### Always Use Read-Only Mode (Recommended for Production)

The `--read-only` flag restricts the MCP server to SELECT queries only:

```json
"args": [
  "-y",
  "@supabase/mcp-server-supabase@latest",
  "--read-only",  // This flag prevents write operations
  "--project-ref=YOUR_PROJECT_REF"
]
```

### Manual Approval Settings

**Cursor**: Settings → Features → "Require approval for MCP operations" ✓

**Claude Code**: Automatically prompts for each operation

### Environment-Specific Configurations

Create separate MCP configurations for different environments:

```json
{
  "mcpServers": {
    "supabase-local": {
      "command": "npx",
      "args": [
        "-y",
        "@supabase/mcp-server-supabase@latest",
        "--project-url=http://localhost:54321",
        "--anon-key=your-local-anon-key"
      ]
    },
    "supabase-staging": {
      "command": "npx",
      "args": [
        "-y",
        "@supabase/mcp-server-supabase@latest",
        "--read-only",
        "--project-ref=staging-ref"
      ],
      "env": {
        "SUPABASE_ACCESS_TOKEN": "${STAGING_TOKEN}"
      }
    }
  }
}
```

## Available MCP Tools

Once configured, your AI assistant can use these Supabase tools:

### Database Operations
- `list_tables` - List all tables in the database
- `get_table_schema` - Get schema information for a table
- `select_data` - Query data from tables
- `insert_data` - Insert records (if not read-only)
- `update_data` - Update records (if not read-only)
- `delete_data` - Delete records (if not read-only)

### Schema Management
- `run_sql` - Execute raw SQL queries
- `create_table` - Create new tables
- `alter_table` - Modify table structure
- `create_index` - Add indexes for performance

### Configuration
- `get_project_config` - Fetch project settings
- `list_functions` - List database functions
- `list_triggers` - List database triggers

## Usage Examples

### Basic Query
```
AI, using MCP, show me the first 10 users ordered by created_at
```

### Schema Inspection
```
Using the Supabase MCP, describe the structure of the products table
```

### Complex Operations
```
Via MCP, create a new table called 'orders' with columns for user_id (references users), product_id (references products), quantity, and timestamps
```

### Migration Generation
```
Using MCP, generate a migration that adds an index on the email column of the users table
```

## Troubleshooting

### Issue: MCP Shows as Inactive

**Solution**:
1. Check Node.js version: `node --version` (should be 18+)
2. Verify token is valid in Supabase dashboard
3. Ensure project reference is correct
4. Restart Cursor/Claude Code

### Issue: Permission Denied Errors

**Solution**:
- Verify your personal access token has necessary permissions
- Check if RLS policies are blocking access
- Try without `--read-only` flag for write operations (development only)

### Issue: Cannot Connect to Local Supabase

**Solution**:
```json
{
  "mcpServers": {
    "supabase-local": {
      "command": "npx",
      "args": [
        "-y",
        "@supabase/mcp-server-supabase@latest",
        "--project-url=http://host.docker.internal:54321",  // For Docker
        "--anon-key=your-local-anon-key"
      ]
    }
  }
}
```

### Issue: MCP Operations Time Out

**Solution**:
- Check network connectivity
- Verify Supabase project is not paused
- Increase timeout in configuration:

```json
{
  "mcpServers": {
    "supabase": {
      "command": "npx",
      "args": ["..."],
      "timeout": 30000  // 30 seconds
    }
  }
}
```

## Best Practices

### 1. Separate Configurations per Environment
Never use production credentials in development. Use different MCP configs for local, staging, and production.

### 2. Regular Token Rotation
Rotate your personal access tokens every 90 days for security.

### 3. Audit MCP Operations
Review AI-executed operations regularly:
```sql
-- In Supabase SQL Editor
SELECT * FROM auth.audit_log 
WHERE created_at > NOW() - INTERVAL '1 day'
ORDER BY created_at DESC;
```

### 4. Use Read-Only by Default
Only remove `--read-only` flag when absolutely necessary and only in development.

### 5. Version Control Considerations
```gitignore
# .gitignore
.env.local
.cursor/mcp-config.json
**/supabase-access-token*
```

## Advanced Configuration

### Multiple Database Connections
```json
{
  "mcpServers": {
    "supabase-main": {
      "command": "npx",
      "args": ["@supabase/mcp-server-supabase@latest", "--project-ref=main-ref"]
    },
    "postgres-analytics": {
      "command": "npx",
      "args": ["@modelcontextprotocol/server-postgres", "--connection-string=${ANALYTICS_DB_URL}"]
    },
    "sqlite-local": {
      "command": "npx",
      "args": ["@modelcontextprotocol/server-sqlite", "--db-path=./local.db"]
    }
  }
}
```

### Custom MCP Servers
Create your own MCP server for custom integrations:

```javascript
// custom-mcp-server.js
import { Server } from '@modelcontextprotocol/sdk';

const server = new Server({
  name: 'custom-api',
  version: '1.0.0',
  tools: {
    fetchUserData: {
      description: 'Fetch user data from custom API',
      parameters: { userId: { type: 'string' } },
      handler: async ({ userId }) => {
        // Custom implementation
      }
    }
  }
});

server.start();
```

## Future Developments (2025 Roadmap)

### OAuth 2.0 Support (Coming Soon)
The next MCP specification revision will support OAuth authentication, eliminating the need for manual token management:

```json
{
  "mcpServers": {
    "supabase": {
      "command": "npx",
      "args": ["@supabase/mcp-server-supabase@next"],
      "auth": {
        "type": "oauth2",
        "provider": "supabase"
      }
    }
  }
}
```

### Enhanced Security Features
- Automatic token rotation
- Granular permission controls
- Audit logging integration
- Rate limiting per operation type

## Integration with CI/CD

### GitHub Actions Example
```yaml
name: AI Database Review
on: [pull_request]
jobs:
  db-review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Setup MCP
        run: |
          npm install -g @supabase/mcp-server-supabase
      - name: AI Review Database Changes
        env:
          SUPABASE_ACCESS_TOKEN: ${{ secrets.SUPABASE_MCP_TOKEN }}
        run: |
          # AI reviews migration files
          # Validates against schema
```

## Conclusion

MCP transforms how AI assistants interact with your development infrastructure. By following this setup guide, you enable your AI to become a true development partner capable of autonomous database operations while maintaining security and control.

Remember: With great power comes great responsibility. Always review AI-generated database operations, especially in production environments.

---
*Last Updated: August 2025*
*For latest updates, check [Supabase MCP Documentation](https://supabase.com/docs/guides/getting-started/mcp)*