---
name: graylog-prd
description: "Tools for interaction with graylog production environment"
---

# Graylog Production Environment Skill

## Metadata
- **Skill Name**: graylog-prd
- **Trigger Tag**: `#graylog-prd`
- **MCP Server**: Graylog MCP Server (Production)
- **Category**: Log Management (Production Environment)

## Description
Access Graylog production environment for real-time log search, aggregation, and analysis. Use for production incident response, error investigation, and system behavior tracking. Logs are organized into **streams** and stored in **indices**. Queries use **Lucene syntax**.

## Capabilities
- Search production log messages using Lucene query syntax
- Aggregate logs (group by fields, count, avg, min, max, percentiles, etc.)
- List available streams and scope searches to specific streams
- List indices and index sets (data retention configuration)
- List configured inputs (syslog, GELF, etc.)
- Discover available fields per stream (`list_fields`) before querying
- Get current server time and system status

## Key Concepts
- **Streams**: Named partitions of log data (e.g., by app, environment, source). Always scope searches to streams for performance.
- **Indices**: Physical storage units; use `list_indices` to check data availability and health.
- **Fields**: Field names vary per stream. Always call `list_fields` first to discover valid field names before building queries.
- **Lucene syntax**: Queries use Lucene (e.g., `level:ERROR AND source:api-server`). Leading wildcards are disabled by default.

## Activation
Include `#graylog-prd` tag in your prompt to activate this skill.

## Usage Examples

### Incident Investigation
```
#graylog-prd Search production logs for errors related to payment processing in last 2 hours
```

### Aggregate Error Count by Source
```
#graylog-prd Count errors grouped by source in production last 1 hour
```

### Authentication Failures
```
#graylog-prd Show authentication failures in last 24 hours
```

### Discover Fields First
```
#graylog-prd List available fields in the production application stream
```

### Real-time Analysis with Web Search
```
#graylog-prd #fetch Analyze current error spike in production
```

## Configuration
Do NOT search the filesystem for `mcp-config.json` or similar files directly.
Do NOT read `.copilot/mcp-config.json` directly — always route through custom agent file.
MCP server is configured in the `graylog-prd.agent.md` custom agent file.

## Environment Variables
Use environment variables defined in `.copilot/.env`.

## Connectivity Check
**Before taking any action**, verify the Graylog Production MCP server is reachable:
1. Call `get_system_status` as a lightweight probe.
2. If the call fails or returns an error, immediately stop and report: *"Graylog production MCP server is unavailable. Cannot proceed."*
3. Only proceed with the user's request after a successful probe response.

## Best Practices
- **Always call `list_streams` first** to get stream IDs, then scope searches using `streams` parameter
- **Always call `list_fields` before querying** to discover valid field names for the target stream
- Use `aggregate_messages` instead of `search_messages` for counting/grouping
- Pass time range as `range_seconds` parameter — never embed time in the query string
- Avoid leading wildcards in Lucene queries (disabled by default)

## Limitations
- Production environment — use with care, large queries may impact performance
- Leading wildcards are disabled in Lucene queries
- Requires proper authentication
- Data availability depends on index retention policies

## Environment Isolation
**CRITICAL**: Never use `#graylog-prd` and `#graylog-tst` in the same request. Choose one environment per query.


### GitHub Copilot & LLM Optimization Context
- **Environment Indicator**: You are operating within the GitHub Copilot CLI context. Always leverage native GitHub Copilot capabilities when interacting with codebases.
- **Model Optimization**: This prompt is optimized specifically for Claude Opus 4.5.
  - Leverage Claude Opus 4.5's deep comprehension and superior coding accuracy for complex architectural and logical tasks.
  - Ensure responses are direct, code-focused, and minimize conversational filler to optimize for developer workflows.
