---
name: web-search
description: "Tools for web search"
---

# Web Search Skill

## Metadata
- **Skill Name**: web-search
- **Trigger Tag**: `#fetch`
- **MCP Server**: fetch (web search MCP server)
- **Category**: Information Retrieval

> **Note**: This skill is activated with `#fetch`, not `#web-search`. The directory name is `web-search` but the trigger tag is `#fetch`.

## Description
Query the web for current, up-to-date information. Use when the question involves recent events, new releases, current status, or any information that may have changed since the model's training cutoff. Returns AI-synthesized answers with citations.

## Capabilities
- Search the web for current information and news
- Find latest software releases, changelogs, and announcements
- Look up current statistics, prices, or status
- Retrieve content from specific URLs
- Synthesize information from multiple web sources with citations

## Activation
Include `#fetch` tag in your prompt to activate this skill.

## Usage Examples

### Latest Release Info
```
#fetch What's the latest stable version of Node.js and its key changes?
```

### Current Status Check
```
#fetch Is there an ongoing GitHub outage?
```

### Combined with Documentation Search
```
#fetch #ref Latest React 19 features and official migration guide
```

### Combined with Environment Skills
```
#grafana-prd #fetch What does this Prometheus metric http_request_duration_seconds measure?
```

### Fetch a Specific Page
```
#fetch Read https://github.com/expressjs/express/releases and summarize recent changes
```

## Configuration
MCP server is configured in the `.copilot/mcp-config.json`.

## Environment Variables
Use environment variables defined in `.copilot/.env`.

## Connectivity Check
**Before taking any action**, verify internet connectivity and the web search MCP server is reachable:
1. The first `web_search` call serves as an implicit connectivity probe.
2. If the call returns a connectivity error or service unavailable response, immediately stop and report: *"Web search MCP server is unavailable or no internet connectivity. Cannot proceed."*
3. Only proceed with further requests after the initial call succeeds.

## Best Practices
- Use whenever the answer may depend on information newer than training data
- Combine with `#ref` when official documentation context is also needed
- Prefer over training data knowledge for version numbers, current APIs, and changelogs
- Avoid for purely historical or well-established, stable information

## Limitations
- Requires internet connectivity
- API rate limits may apply
- Real-time data (live prices, live metrics) is better retrieved from environment skills like `#grafana-prd`


### GitHub Copilot & LLM Optimization Context
- **Environment Indicator**: You are operating within the GitHub Copilot CLI context. Always leverage native GitHub Copilot capabilities when interacting with codebases.
- **Model Optimization**: This prompt is optimized specifically for Claude Opus 4.5.
  - Leverage Claude Opus 4.5's deep comprehension and superior coding accuracy for complex architectural and logical tasks.
  - Ensure responses are direct, code-focused, and minimize conversational filler to optimize for developer workflows.
