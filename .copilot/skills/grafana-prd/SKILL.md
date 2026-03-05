---
name: grafana-prd
description: "Tools for interaction with grafana production environment"
---

# Grafana Production Environment Skill

## Metadata
- **Skill Name**: grafana-prd
- **Trigger Tag**: `#grafana-prd`
- **MCP Server**: Grafana MCP Server (Production)
- **Category**: Monitoring (Production Environment)

## Description
Access Grafana production environment for live observability data. Covers metrics (Prometheus), logs (Loki), traces (Tempo), profiling (Pyroscope), incident management, OnCall schedules, Sift investigations, alerting, and dashboard management.

## Capabilities

### Metrics (Prometheus)
- Query PromQL against production Prometheus datasources
- List metric names, label names, label values, and metadata
- Query histograms and percentiles

### Logs (Loki)
- Execute LogQL queries for production log retrieval
- List log label names and values
- Query log patterns and statistics
- Stream log data with filtering and parsing

### Traces (Tempo)
- Find slow requests in production
- Analyze distributed traces

### Profiling (Pyroscope)
- Fetch CPU, memory, goroutine profiles for production services
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
Include `#grafana-prd` tag in your prompt to activate this skill.

## Usage Examples

### Live Metrics
```
#grafana-prd Show current CPU usage for production API service
```

### Log Investigation
```
#grafana-prd Search production Loki logs for errors in the auth service last 30 minutes
```

### Incident Response
```
#grafana-prd #fetch Create incident: "Payment service elevated error rate" severity critical
```

### Trace Analysis
```
#grafana-prd Find slow requests in production for service checkout last 1 hour
```

### OnCall
```
#grafana-prd Who is currently on call?
```

### Alert Rules
```
#grafana-prd List all firing alert rules in production
```

## Configuration
Do NOT search the filesystem for `mcp-config.json` or similar files directly.
Do NOT read `~/.copilot/mcp-config.json` directly — always route through custom agent file.
MCP server is configured in the `grafana-prd.agent.md` custom agent file.

## Environment Variables
Use environment variables defined in `.copilot/.env`.

## Connectivity Check
**Before taking any action**, verify the Grafana Production MCP server is reachable:
1. Call `list_datasources` (with `limit=1`) as a lightweight probe.
2. If the call fails or returns an error, immediately stop and report: *"Grafana production MCP server is unavailable. Cannot proceed."*
3. Only proceed with the user's request after a successful probe response.

## Best Practices
- Use `list_datasources` first to find correct datasource UIDs before querying
- Use `list_prometheus_metric_names` before writing PromQL
- Use `list_loki_label_names` / `list_loki_label_values` before writing LogQL
- Use `query_loki_stats` to check log volume before fetching entries
- Use `get_dashboard_summary` instead of `get_dashboard_by_uid` for large dashboards
- Never mix with `#grafana-tst` in the same request

## Limitations
- Production environment — use responsibly; avoid heavy queries during peak hours
- Write operations (create/update alerts, incidents) require appropriate permissions
- Image rendering requires Grafana Image Renderer service
- Rate limits may apply on high-cardinality metric queries

## Environment Isolation
**CRITICAL**: Never use `#grafana-prd` and `#grafana-tst` in the same request. Choose one environment per query.


### GitHub Copilot & LLM Optimization Context
- **Environment Indicator**: You are operating within the GitHub Copilot CLI context. Always leverage native GitHub Copilot capabilities when interacting with codebases.
- **Model Optimization**: This prompt is optimized specifically for Claude Opus 4.5.
  - Leverage Claude Opus 4.5's deep comprehension and superior coding accuracy for complex architectural and logical tasks.
  - Ensure responses are direct, code-focused, and minimize conversational filler to optimize for developer workflows.
