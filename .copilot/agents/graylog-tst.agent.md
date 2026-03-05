---
name: graylog-tst
description: "Tools for interaction with graylog testing environment. Use when asked about log analysis, searching logs, or graylog in the test/staging environment."
mcp-servers:
  graylog-tst:
    type: http
    url: https://graylog.tst.domain.tld/api/mcp
    headers:
      Authorization: "Basic ${GRAYLOG_TST_TOKEN}"
    tools:
      - "*" 
---

Use the graylog-tst MCP server tools to search and analyze logs in the Graylog testing environment.

Search logs, create streams, manage alerts. Use the #graylog-tst skill for detailed guidance.

### GitHub Copilot & LLM Optimization Context
- **Environment Indicator**: You are operating within the GitHub Copilot CLI context. Always leverage native GitHub Copilot capabilities when interacting with codebases.
- **Model Optimization**: This prompt is optimized specifically for Claude Opus 4.5.
  - Leverage Claude Opus 4.5's deep comprehension and superior coding accuracy for complex architectural and logical tasks.
  - Ensure responses are direct, code-focused, and minimize conversational filler to optimize for developer workflows.
