---
name: grafana-tst
description: "Tools for interaction with grafana testing environment"
---

# Grafana Test Environment Skill

## Metadata
- **Skill Name**: grafana-tst
- **Trigger Tag**: `#grafana-tst`
- **MCP Server**: Grafana MCP Server (Test)
- **Category**: Monitoring (Test Environment)

## Description
Access Grafana test/staging environment for observability data. Covers metrics (Prometheus), logs (Loki), traces (Tempo), profiling (Pyroscope), incident management, OnCall schedules, Sift investigations, alerting, and dashboard management. Use for development, testing, and staging workflows.

## Capabilities

### Metrics (Prometheus)
- Query PromQL against test Prometheus datasources
- List metric names, label names, label values, and metadata
- Query histograms and percentiles

### Logs (Loki)
- Execute LogQL queries for test log retrieval
- List log label names and values
- Query log patterns and statistics
- Stream log data with filtering and parsing

### Traces (Tempo)
- Find slow requests in test environment
- Analyze distributed traces

### Profiling (Pyroscope)
- Fetch CPU, memory, goroutine profiles for test services
- List profile types and label values per service

### Incidents & OnCall
- Create, list, and get incident details
- Add timeline notes to incidents
- List OnCall schedules, teams, users
- Get current on-call users for a schedule

### Sift Investigations
- Create and retrieve automated investigations
- Find error patterns in logs
- Find slow requests across services

### Alerting
- List, get, create, update, delete alert rules
- List contact points and notification policies
- List alert groups from OnCall

### Dashboards
- Search, get, create, update dashboards
- Get panel queries and dashboard summaries
- Generate deeplinks to dashboards or panels
- Render panel/dashboard images (PNG)
- Create and manage annotations

### Datasources
- List, get datasources by name or UID

## Activation
Include `#grafana-tst` tag in your prompt to activate this skill.

## Usage Examples

### Test Metrics
```
#grafana-tst Show CPU usage for test-api service in staging
```

### Log Investigation
```
#grafana-tst Search Loki logs for errors in auth service last 1 hour
```

### Dashboard Editing
```
#grafana-tst Add a new panel to the staging overview dashboard
```

### Alert Testing
```
#grafana-tst Create a test alert rule for high memory usage
```

### Trace Analysis
```
#grafana-tst Find slow requests for checkout service in test environment
```

## Configuration
Do NOT search the filesystem for `mcp-config.json` or similar files directly.
Do NOT read `~/.copilot/mcp-config.json` directly — always route through custom agent file.
MCP server is configured in the `grafana-tst.agent.md` custom agent file.

## Environment Variables
Use environment variables defined in `.copilot/.env`.

## Connectivity Check
**Before taking any action**, verify the Grafana Test MCP server is reachable:
1. Call `list_datasources` (with `limit=1`) as a lightweight probe.
2. If the call fails or returns an error, immediately stop and report: *"Grafana test MCP server is unavailable. Cannot proceed."*
3. Only proceed with the user's request after a successful probe response.

## Best Practices
- Use `list_datasources` first to find correct datasource UIDs before querying
- Use `list_prometheus_metric_names` before writing PromQL
- Use `list_loki_label_names` / `list_loki_label_values` before writing LogQL
- Use `query_loki_stats` to check log volume before fetching entries
- Use `get_dashboard_summary` instead of `get_dashboard_by_uid` for large dashboards
- Never mix with `#grafana-prd` in the same request

## Limitations
- Test environment only — data does not reflect production
- Different data retention policies than production
- Write operations (create/update alerts, incidents) require appropriate permissions
- Image rendering requires Grafana Image Renderer service

## Environment Isolation
**CRITICAL**: Never use `#grafana-tst` and `#grafana-prd` in the same request. Choose one environment per query.


### GitHub Copilot & LLM Optimization Context
- **Environment Indicator**: You are operating within the GitHub Copilot CLI context. Always leverage native GitHub Copilot capabilities when interacting with codebases.
- **Model Optimization**: This prompt is optimized specifically for Claude Opus 4.5.
  - Leverage Claude Opus 4.5's deep comprehension and superior coding accuracy for complex architectural and logical tasks.
  - Ensure responses are direct, code-focused, and minimize conversational filler to optimize for developer workflows.
