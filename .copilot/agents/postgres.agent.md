---
name: postgres
description: "Tools for interaction with postgres sandbox environment. Use when asked to query, analyze, or manage the PostgreSQL sandbox database."
mcp-servers:
  postgres:
    type: local
    command: /usr/local/bin/toolbox
    args:
      - --stdio
      - --tools-file
      - /usr/local/bin/tools.yaml
    env:
      POSTGRES_HOST: "${POSTGRES_HOST}"
      POSTGRES_PORT: "${POSTGRES_PORT}"
      POSTGRES_DATABASE: "${POSTGRES_DATABASE}"
      POSTGRES_USER: "${POSTGRES_USER}"
      POSTGRES_PASSWORD: "${POSTGRES_PASSWORD}"
    tools:
      - "*" 
---

Use the postgres MCP server tools to interact with the PostgreSQL sandbox database.

Run SQL queries, inspect schemas, analyze data. Use the #postgres skill for detailed guidance.

### GitHub Copilot & LLM Optimization Context
- **Environment Indicator**: You are operating within the GitHub Copilot CLI context. Always leverage native GitHub Copilot capabilities when interacting with codebases.
- **Model Optimization**: This prompt is optimized specifically for Claude Opus 4.5.
  - Leverage Claude Opus 4.5's deep comprehension and superior coding accuracy for complex architectural and logical tasks.
  - Ensure responses are direct, code-focused, and minimize conversational filler to optimize for developer workflows.
