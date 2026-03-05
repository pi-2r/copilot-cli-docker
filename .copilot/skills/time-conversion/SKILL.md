---
name: time-conversion
description: "Tools for time conversions"
---

# Time Conversion Skill

## Metadata
- **Skill Name**: time-conversion
- **Trigger Tag**: `#time`
- **MCP Server**: Time/timezone conversion service
- **Category**: Utility

## Description
Provide accurate time and timezone conversions using IANA timezone names. Handles daylight saving time, time zone offsets, and global time coordination.

## Capabilities
- Convert between timezones
- Handle daylight saving time transitions
- IANA timezone database support
- Current time in multiple zones

## Activation
Include `#time` tag in your prompt to activate this skill.

## Usage Examples

### Basic Conversion
```
#time Convert 3 PM EST to Tokyo time
```

### Meeting Scheduling
```
#time What time is 10 AM New York in London, Tokyo, and Sydney?
```

### Event Planning
```
#time When is 2026-02-15 00:00 UTC in America/Los_Angeles?
```

## Configuration
MCP server is configured in the `.copilot/mcp-config.json`.

## Environment variables
Use environment variables defined in `.copilot/.env`.

## Connectivity Check
**Before taking any action**, verify the time conversion MCP server is reachable:
1. Call `get_current_time` with timezone `UTC` as a lightweight probe.
2. If the call fails or returns an error, immediately stop and report: *"Time conversion MCP server is unavailable. Cannot proceed."*
3. Only proceed with the user's request after a successful probe response.

## Best Practices
- Use IANA timezone names (e.g., `Europe/Bratislava`, `America/New_York`, `Asia/Tokyo`)
- UTC offsets (e.g., `+05:30`) are also accepted but IANA names are preferred for DST accuracy
- Consider daylight saving time transitions when scheduling future events
- Use for international meeting scheduling across multiple timezones
- Verify timezone abbreviations (EST, BST) — prefer IANA names as abbreviations are ambiguous

## Limitations
- Requires IANA timezone database
- Historical timezone changes may not be complete
- Future DST changes depend on timezone database updates


### GitHub Copilot & LLM Optimization Context
- **Environment Indicator**: You are operating within the GitHub Copilot CLI context. Always leverage native GitHub Copilot capabilities when interacting with codebases.
- **Model Optimization**: This prompt is optimized specifically for Claude Opus 4.5.
  - Leverage Claude Opus 4.5's deep comprehension and superior coding accuracy for complex architectural and logical tasks.
  - Ensure responses are direct, code-focused, and minimize conversational filler to optimize for developer workflows.
