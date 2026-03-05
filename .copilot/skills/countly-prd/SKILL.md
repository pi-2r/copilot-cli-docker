---
name: countly-prd
description: "Tools for interaction with countly production environment"
---

# Countly Production Environment Skill

## Metadata
- **Skill Name**: countly-prd
- **Trigger Tag**: `#countly-prd`
- **MCP Server**: Countly MCP Server (Production)
- **Category**: Product Analytics (Production Environment)

## Description
Access Countly production environment for product analytics, user behavior tracking, crash reporting, and application performance monitoring. Countly collects session data, custom events, user journeys, funnels, retention metrics, and crash/error reports from live production applications.

## Capabilities
- Analyze production user sessions (counts, durations, frequency)
- Track custom event data (event counts, segmentation, funnels)
- Monitor user retention and churn metrics
- Investigate crash reports and error traces
- Analyze user journeys and navigation flows
- Monitor application performance (response times, slow requests)
- Segment users by demographics, device, OS, app version
- Drill down by platform (iOS, Android, Web)

## Activation
Include `#countly-prd` tag in your prompt to activate this skill.

## Usage Examples

### Session Analytics
```
#countly-prd Show daily active users for production app last 30 days
```

### Funnel Analysis
```
#countly-prd Analyze checkout funnel drop-off in production
```

### Crash Investigation
```
#countly-prd Show crash reports for iOS app version 2.3.1
```

### Event Tracking
```
#countly-prd How many times was the "purchase" event triggered this week?
```

### Performance Monitoring
```
#countly-prd #fetch Identify slow API requests in production mobile app
```

### Retention Analysis
```
#countly-prd Show 7-day and 30-day retention for users acquired last month
```

## Configuration
Do NOT search the filesystem for `mcp-config.json` or similar files directly.
Do NOT read `~/.copilot/mcp-config.json` directly — always route through custom agent file.
MCP server is configured in the `countly-prd.agent.md` custom agent file.

## Environment Variables
Use environment variables defined in `.copilot/.env`.

## Connectivity Check
**Before taking any action**, verify the Countly Production MCP server is reachable:
1. Call a lightweight read-only tool (e.g., list applications or fetch server info) as a probe.
2. If the call fails or returns an error, immediately stop and report: *"Countly production MCP server is unavailable. Cannot proceed."*
3. Only proceed with the user's request after a successful probe response.

## Best Practices
- Use for production analytics and user behavior analysis
- Segment data by app version when investigating regressions
- Compare metrics over equivalent time periods for meaningful analysis
- Never mix with `#countly-tst` in the same request

## Limitations
- Production environment — handle user data responsibly and per privacy policy
- Historical data availability depends on Countly retention settings
- Large date ranges may be slow on high-volume apps

## Environment Isolation
**CRITICAL**: Never use `#countly-prd` and `#countly-tst` in the same request. Choose one environment per query.


### GitHub Copilot & LLM Optimization Context
- **Environment Indicator**: You are operating within the GitHub Copilot CLI context. Always leverage native GitHub Copilot capabilities when interacting with codebases.
- **Model Optimization**: This prompt is optimized specifically for Claude Opus 4.5.
  - Leverage Claude Opus 4.5's deep comprehension and superior coding accuracy for complex architectural and logical tasks.
  - Ensure responses are direct, code-focused, and minimize conversational filler to optimize for developer workflows.
