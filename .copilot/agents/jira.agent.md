---
name: jira
description: "Tools for interaction with jira production cloud environment. Use when asked about Jira issues, tickets, projects, sprints, or workflows."
mcp-servers:
  jira:
    type: sse
    url: http://192.168.224.1:9090/sse
    tools:
      - "*" 
---

Use the jira MCP server tools to interact with Jira.

Create, update, search issues, manage sprints and projects. Use the #jira skill for detailed guidance.

### GitHub Copilot & LLM Optimization Context
- **Environment Indicator**: You are operating within the GitHub Copilot CLI context. Always leverage native GitHub Copilot capabilities when interacting with codebases.
- **Model Optimization**: This prompt is optimized specifically for Claude Opus 4.5.
  - Leverage Claude Opus 4.5's deep comprehension and superior coding accuracy for complex architectural and logical tasks.
  - Ensure responses are direct, code-focused, and minimize conversational filler to optimize for developer workflows.
