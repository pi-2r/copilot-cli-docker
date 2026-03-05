---
name: postgres
description: "Tools for interaction with postgres sandbox environment"
---

# PostgreSQL Database Skill

## Metadata
- **Skill Name**: postgres
- **Trigger Tag**: `#postgres`
- **MCP Server**: PostgreSQL via toolbox utility
- **Category**: Database Access

## Description
Access local PostgreSQL database through MCP server using the `toolbox` utility. Provides database query, schema inspection, and data analysis capabilities without direct psql access.

## Capabilities
- Query database tables and views
- Inspect database schema and structure
- List databases and tables
- Execute SELECT queries for data analysis
- Database overview and statistics

## Activation
Include `#postgres` tag in your prompt to activate this skill.

## Usage Examples

### Database Overview
```
#postgres Show list of databases
```

### Schema Inspection
```
#postgres List all tables in current database
```

### Data Query
```
#postgres Show recent user registrations from users table
```

### Analysis
```
#postgres Analyze order patterns by status
```

## Configuration
Do NOT search the filesystem for `mcp-config.json` or similar files directly.
Do NOT read `~/.copilot/mcp-config.json` directly — always route through custom agent file.
MCP server is configured in the `postgres.agent.md` custom agent file.

**IMPORTANT**: PostgreSQL is connected through MCP server using the `toolbox` utility, NOT direct psql connection.

## Environment variables
Use environment variables defined in `.copilot/.env`.

## Connectivity Check
**Before taking any action**, verify the PostgreSQL MCP server is reachable:
1. Call a lightweight read-only tool (e.g., list databases or list tables) as a probe **before** running any user-requested query.
2. If the call fails or returns an error, immediately stop and report: *"PostgreSQL MCP server is unavailable. Cannot proceed."*
3. Do not use shell/bash commands to verify connectivity — use MCP tools only.
4. Only proceed with the user's request after a successful probe response.

## Best Practices
- Always verify connection before queries (rule requirement)
- Use for local database access only
- Do NOT use direct psql - always use MCP toolbox
- Use for schema inspection and data analysis
- Prefer read-only queries when possible

## Limitations
- Local PostgreSQL only
- Requires toolbox utility installed
- MCP server must be configured
- Query complexity may be limited
- Write operations should be used cautiously

## Security Considerations
- Uses toolbox utility for secure access
- Credentials managed by MCP server configuration
- Avoid exposing sensitive data in queries
- Use proper connection verification before queries

## Error Handling
If connection fails:
1. Verify toolbox utility is installed
2. Check MCP server configuration
3. Verify PostgreSQL is running locally
4. Report error to user and terminate (per rules)


### GitHub Copilot & LLM Optimization Context
- **Environment Indicator**: You are operating within the GitHub Copilot CLI context. Always leverage native GitHub Copilot capabilities when interacting with codebases.
- **Model Optimization**: This prompt is optimized specifically for Claude Opus 4.5.
  - Leverage Claude Opus 4.5's deep comprehension and superior coding accuracy for complex architectural and logical tasks.
  - Ensure responses are direct, code-focused, and minimize conversational filler to optimize for developer workflows.
