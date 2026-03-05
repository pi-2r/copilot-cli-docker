---
name: countly-tst
description: "Tools for interaction with countly testing environment"
---

# Countly Test Environment Skill

## Metadata
- **Skill Name**: countly-tst
- **Trigger Tag**: `#countly-tst`
- **MCP Server**: Countly MCP Server (Test)
- **Category**: Product Analytics (Test Environment)

## Description
Access Countly test/staging environment for product analytics, user behavior tracking, crash reporting, and application performance monitoring. Use for validating analytics instrumentation, testing event tracking, and debugging analytics flows before production release.

## Capabilities
- Analyze test/staging user sessions (counts, durations, frequency)
- Track and validate custom event data (event counts, segmentation, funnels)
- Monitor retention metrics in test environment
- Investigate crash reports and error traces from test builds
- Analyze user journeys and navigation flows in test apps
- Monitor test application performance
- Segment users by demographics, device, OS, app version
- Verify analytics instrumentation is working correctly

## Activation
Include `#countly-tst` tag in your prompt to activate this skill.

## Usage Examples

### Validate Event Tracking
```
#countly-tst Verify that the "add_to_cart" event is being tracked correctly in staging
```

### Trace Analysis
```
#countly-tst Show request traces for test API endpoint
```

### Crash Debugging
```
#countly-tst Show crash reports from the latest test build
```

### Performance Monitoring
```
#countly-tst #fetch Analyze response times in staging app
```

### User Flow Validation
```
#countly-tst Show user flows through onboarding in test environment
```

## Configuration
Do NOT search the filesystem for `mcp-config.json` or similar files directly.
Do NOT read `~/.copilot/mcp-config.json` directly — always route through custom agent file.
MCP server is configured in the `countly-tst.agent.md` custom agent file.

## Environment Variables
Use environment variables defined in `.copilot/.env`.

## Connectivity Check
**Before taking any action**, verify the Countly Test MCP server is reachable:
1. Call a lightweight read-only tool (e.g., list applications or fetch server info) as a probe.
2. If the call fails or returns an error, immediately stop and report: *"Countly test MCP server is unavailable. Cannot proceed."*
3. Only proceed with the user's request after a successful probe response.

## Best Practices
- Use to verify analytics instrumentation before production releases
- Use for QA and testing analytics workflows
- Never mix with `#countly-prd` in the same request

## Limitations
- Test environment only — data does not reflect real user behavior
- Different data retention policies than production
- Test event volumes are much lower than production
- Environment must be configured and available

## Environment Isolation
**CRITICAL**: Never use `#countly-tst` and `#countly-prd` in the same request. Choose one environment per query.


### GitHub Copilot & LLM Optimization Context
- **Environment Indicator**: You are operating within the GitHub Copilot CLI context. Always leverage native GitHub Copilot capabilities when interacting with codebases.
- **Model Optimization**: This prompt is optimized specifically for Claude Opus 4.5.
  - Leverage Claude Opus 4.5's deep comprehension and superior coding accuracy for complex architectural and logical tasks.
  - Ensure responses are direct, code-focused, and minimize conversational filler to optimize for developer workflows.
