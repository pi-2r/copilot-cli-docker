---
name: sequential-thinking
description: "Tools for step-by-step reasoning"
---

# Sequential Thinking Skill

## Metadata
- **Skill Name**: sequential-thinking
- **Trigger Tag**: `#st`
- **MCP Server**: sequentialthinking (built-in reasoning enhancement)
- **Category**: Problem Solving

> **Note**: Activated with `#st` (short for sequential thinking). Use when a problem requires breaking down into explicit, verifiable reasoning steps.

## Description
Engage structured step-by-step reasoning for complex problem-solving. Breaks down queries into logical steps with the ability to revise, branch, and verify thinking before arriving at a final answer. Reduces reasoning errors on multi-step or ambiguous problems.

## Capabilities
- Multi-step problem decomposition with explicit thought chain
- Hypothesis generation and verification
- Ability to revise earlier reasoning steps mid-chain
- Branching for exploring alternative approaches
- Systematic debugging through structured analysis
- Architectural and design decision reasoning

## Activation
Include `#st` tag in your prompt to activate this skill.

## Usage Examples

### Algorithm Design
```
#st Design an efficient algorithm for finding duplicates in a large dataset
```

### Complex Debugging
```
#st Debug why the authentication flow fails intermittently under load
```

### Architecture Planning
```
#st Plan microservices decomposition for an e-commerce platform
```

### Root Cause Analysis
```
#st Analyze why memory usage grows over time in this Node.js service
```

## Configuration
MCP server is configured in the `.copilot/mcp-config.json`.

## Environment Variables
None required. This is a built-in reasoning tool with no external service dependency.

## Connectivity Check
This skill uses a built-in reasoning tool with **no external MCP service dependency**. No connectivity check is required before use.

## Best Practices
- Use for complex, multi-step problems where linear reasoning may miss edge cases
- Ideal for architectural decisions with multiple valid tradeoffs
- Helpful for debugging non-obvious or intermittent issues
- Good for algorithm design where correctness must be verified step-by-step
- Overkill for simple, well-defined questions

## Limitations
- Increases response length and time compared to direct answers
- Not needed for straightforward lookup or simple code generation tasks


### GitHub Copilot & LLM Optimization Context
- **Environment Indicator**: You are operating within the GitHub Copilot CLI context. Always leverage native GitHub Copilot capabilities when interacting with codebases.
- **Model Optimization**: This prompt is optimized specifically for Claude Opus 4.5.
  - Leverage Claude Opus 4.5's deep comprehension and superior coding accuracy for complex architectural and logical tasks.
  - Ensure responses are direct, code-focused, and minimize conversational filler to optimize for developer workflows.
