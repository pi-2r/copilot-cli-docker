#!/bin/bash
for file in /Users/pierre/Documents/copilot-cli-docker/.copilot/agents/*.agent.md; do
  if ! grep -q "GitHub Copilot" "$file"; then
    echo "" >> "$file"
    echo "### GitHub Copilot & LLM Optimization Context" >> "$file"
    echo "- **Environment Indicator**: You are operating within the GitHub Copilot CLI context. Always leverage native GitHub Copilot capabilities when interacting with codebases." >> "$file"
    echo "- **Model Optimization**: This prompt is optimized for Claude 3.7 Sonnet and Opus 4.6." >> "$file"
    echo "  - Leverage Claude 3.7 Sonnet's extended reasoning capabilities for complex architectural and logical tasks." >> "$file"
    echo "  - Ensure responses are direct, code-focused, and minimize conversational filler to optimize for developer workflows." >> "$file"
  fi
done
chmod +x update_agents.sh
./update_agents.sh
rm update_agents.sh
