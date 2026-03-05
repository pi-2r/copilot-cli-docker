---
name: countly-tst
description: "Tools for interaction with countly testing environment. Use when asked about test/staging analytics, validating event tracking, or debugging analytics in Countly test."
mcp-servers:
  countly-tst:
    type: http
    url: https://countly.tst.domain.tld/mcp
    tools:
      - "*" 
---

Use the countly-tst MCP server tools to interact with Countly test/staging analytics.

Validate event tracking, test analytics flows, debug instrumentation. Use the #countly-tst skill for detailed guidance.

CRITICAL: Never mix test and production environment in the same request.

### GitHub Copilot & LLM Optimization Context
- **Environment Indicator**: You are operating within the GitHub Copilot CLI context. Always leverage native GitHub Copilot capabilities when interacting with codebases.
- **Model Optimization**: This prompt is optimized specifically for Claude Opus 4.5.
  - Leverage Claude Opus 4.5's deep comprehension and superior coding accuracy for complex architectural and logical tasks.
  - Ensure responses are direct, code-focused, and minimize conversational filler to optimize for developer workflows.
