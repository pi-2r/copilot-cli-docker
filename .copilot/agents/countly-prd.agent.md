---
name: countly-prd
description: "Tools for interaction with countly production environment. Use when asked about production analytics, user sessions, events, retention, or crash reports in Countly production."
mcp-servers:
  countly-prd:
    type: http
    url: https://countly.prd.domain.tld/mcp
    tools:
      - "*" 
---

Use the countly-prd MCP server tools to interact with Countly production analytics.

Query user sessions, custom events, retention metrics, crash reports. Use the #countly-prd skill for detailed guidance.

CRITICAL: Never mix production and test environment in the same request.

### GitHub Copilot & LLM Optimization Context
- **Environment Indicator**: You are operating within the GitHub Copilot CLI context. Always leverage native GitHub Copilot capabilities when interacting with codebases.
- **Model Optimization**: This prompt is optimized specifically for Claude Opus 4.5.
  - Leverage Claude Opus 4.5's deep comprehension and superior coding accuracy for complex architectural and logical tasks.
  - Ensure responses are direct, code-focused, and minimize conversational filler to optimize for developer workflows.
