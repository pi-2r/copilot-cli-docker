---
name: doc-search
description: "Tools for gathering documentation details"
---

# Documentation Search Skill

## Metadata
- **Skill Name**: doc-search
- **Trigger Tag**: `#ref`
- **MCP Server**: ref (documentation search MCP server)
- **Category**: Information Retrieval

> **Note**: This skill is activated with `#ref`, not `#doc-search`. The directory name is `doc-search` but the trigger tag is `#ref`.

## Description
Search through public documentation, GitHub repositories, and private resources (internal repos, PDFs) before providing code recommendations. Ensures answers are grounded in official documentation and real usage patterns rather than training data alone.

## Capabilities
- Search public documentation (official docs, GitHub repos, Stack Overflow, MDN, etc.)
- Search private/internal documentation (internal repos, PDFs) using `ref_src=private`
- Retrieve code examples and API references from documentation
- Read full content of a specific URL as markdown (`ref_read_url`)
- Cross-reference multiple documentation sources

## Activation
Include `#ref` tag in your prompt to activate this skill.

## Usage Examples

### Library or Framework Usage
```
#ref How to implement OAuth2 PKCE flow in Express.js?
```

### Private Internal Docs
```
#ref ref_src=private Our internal API authentication guide
```

### Combined with Web Search
```
#fetch #ref Latest TypeScript 5.x features and migration guide
```

### API Reference
```
#ref Grafana HTTP API dashboard provisioning endpoints
```

### Read a Specific URL
```
#ref Read https://docs.example.com/api/auth and summarize authentication options
```

## Configuration
MCP server is configured in the `.copilot/mcp-config.json`.

## Environment Variables
Use environment variables defined in `.copilot/.env`.

## Connectivity Check
**Before taking any action**, verify the documentation search (ref) MCP server is reachable:
1. Call `ref_search_documentation` with a short minimal query as a probe.
2. If the call fails or returns an error, immediately stop and report: *"Documentation search MCP server is unavailable. Cannot proceed."*
3. Only proceed with the user's request after a successful probe response.

## Best Practices
- Use before providing framework-specific or library-specific code
- Combine with `#fetch` when you also need the latest web results
- Add `ref_src=private` to search internal/private documentation
- Use `ref_read_url` with an exact URL from search results for full page content

## Limitations
- Private docs require proper authentication and indexing
- Search quality depends on how well documentation is structured and indexed
- Does not replace `#fetch` for real-time/current events


### GitHub Copilot & LLM Optimization Context
- **Environment Indicator**: You are operating within the GitHub Copilot CLI context. Always leverage native GitHub Copilot capabilities when interacting with codebases.
- **Model Optimization**: This prompt is optimized specifically for Claude Opus 4.5.
  - Leverage Claude Opus 4.5's deep comprehension and superior coding accuracy for complex architectural and logical tasks.
  - Ensure responses are direct, code-focused, and minimize conversational filler to optimize for developer workflows.
