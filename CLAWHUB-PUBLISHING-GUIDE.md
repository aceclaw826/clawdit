# Clawdit — ClawHub Publishing Guide

This document contains everything you need to publish Clawdit to ClawHub.

---

## 1. ClawHub Metadata

**Slug:** `clawdit`

**Name:** Clawdit

**Version:** 1.0.0

**Tagline:** Belief systems auditor for OpenClaw agents

**Description (short — for skill listing):**

Systematically audit your agent's loaded context files against your stated goals. Identifies misaligned, stale, conflicting, vague, and redundant beliefs across SOUL.md, AGENTS.md, skills, and more. Runs as a separate agent to ensure the auditor is not influenced by the beliefs it evaluates.

**Description (long — for skill detail page):**

Every OpenClaw session begins by loading a set of markdown files — SOUL.md, AGENTS.md, skills, and more — that define how your agent thinks, behaves, and makes decisions. These are your agent's *beliefs*. Over time, beliefs become stale, contradictory, or misaligned with your evolving goals, and just like humans, your agent cannot objectively audit its own belief system with the same mind that holds those beliefs. This is the same reason we see therapists, work with life coaches, and talk to counselors — you need an external, unencumbered observer who can see what you can't see about yourself. Clawdit is that observer. It runs as a separate agent with its own clean workspace, reads your primary agent's configuration files as data to analyze rather than instructions to follow, and systematically evaluates every directive against your stated goals. It surfaces conflicts between files, identifies stale references, flags vague instructions that produce inconsistent behavior, and works with you collaboratively to decide what to keep, revise, or remove. Think of it as a periodic checkup for your agent's mind.

**Tags:** `audit`, `configuration`, `maintenance`, `soul`, `beliefs`, `agent-health`, `multi-agent`, `productivity`

**Category:** Agent Management / Utilities

**Author:** Mark Roebuck (RxEconomics LLC)

**License:** MIT

**Repository:** (your GitHub repo URL once created)

---

## 2. Publishing Commands

Once you have a ClawHub account and the CLI installed:

```bash
# Login to ClawHub
clawhub login

# Navigate to the skill directory
cd ~/.openclaw/workspace-clawdit/skills/clawdit

# Publish
clawhub publish . \
  --slug clawdit \
  --name "Clawdit" \
  --version 1.0.0 \
  --changelog "Initial release: goal-elicited belief auditing with five-phase process, seven-class classification system, three-tier duplication taxonomy, cross-file conflict detection, and collaborative review."
```

---

## 3. Important Notes for ClawHub Publishing

### This is NOT a typical skill install

Clawdit is designed to run as a **separate agent**, not as a skill loaded into your primary agent. This is a critical architectural requirement — the auditor must be unencumbered by the beliefs it evaluates. The ClawHub listing should make this very clear.

The SKILL.md on ClawHub gives users the skill definition, but they also need:

- The SOUL.md and AGENTS.md for the Clawdit agent workspace
- The audit-framework.md reference document
- The openclaw.json configuration to register the agent
- Directory setup (audits/, output/)

### Recommended approach

Link to the **GitHub repository** from the ClawHub listing. The repo contains the full package with install script, all workspace files, and configuration templates. The ClawHub skill listing serves as discovery; the repo is the actual deployment source.

Include this note in the ClawHub description:

> **⚠️ Important:** Clawdit runs as a separate agent, not as a skill added to your existing agent. See the GitHub repository for full installation instructions including agent registration, workspace setup, and channel binding configuration.

---

## 4. GitHub Repository Setup

### Repo name: `clawdit`

### Description:
Belief systems auditor for OpenClaw agents. A separate agent that evaluates your agent's loaded context files against your stated goals.

### Topics/Tags:
`openclaw`, `ai-agent`, `belief-audit`, `agent-management`, `open-source`, `llm`, `configuration`, `multi-agent`

### Files to include:
```
clawdit/
├── SOUL.md
├── AGENTS.md
├── README.md
├── LICENSE                              # MIT license text
├── install.sh
├── openclaw-config-snippet.jsonc
└── skills/
    └── clawdit/
        ├── SKILL.md
        └── audit-framework.md
```

### Suggested README badges:
```markdown
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![OpenClaw Compatible](https://img.shields.io/badge/OpenClaw-Compatible-red.svg)
![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
```

---

## 5. Social / Launch Text

### Short (for X/Twitter):

Introducing Clawdit 🦞🔍 — a belief systems auditor for OpenClaw agents. Your agent can't objectively review its own SOUL.md any more than you can objectively audit your own biases. Clawdit runs as a separate, unencumbered agent and systematically evaluates your config against your actual goals. Open source, on ClawHub now.

### Medium (for Discord / OpenClaw community):

**Clawdit — Belief Systems Auditor for OpenClaw Agents**

Your agent loads SOUL.md, AGENTS.md, skills, and other config files every session. Over time, those files accumulate stale references, contradictions between files, vague directives, and beliefs that no longer match your goals.

The problem? Your agent can't audit its own beliefs — it's operating under them. Same reason we see therapists instead of just thinking really hard about our problems.

Clawdit solves this by running as a separate agent with a clean workspace. It reads your primary agent's files as data (not instructions), interviews you about your actual goals, and evaluates every directive against those goals. Five-phase process, seven classification categories, three-tier duplication analysis, collaborative review with you in the loop.

Install from GitHub: [repo URL]
Skill on ClawHub: [clawhub URL]

Feedback welcome — this is v1.0 and we have a roadmap for memory auditing, diff-based re-audits, and multi-agent cross-auditing.

---

## 6. Version History (for future releases)

### v1.0.0 (Initial Release)
- Five-phase audit process (goal elicitation → belief extraction → single-file analysis → cross-file analysis → collaborative review)
- Seven-class belief classification system (aligned, neutral, misaligned, stale, conflicting, vague, redundant)
- Three-tier duplication taxonomy (pure waste, contextual reinforcement, drift-prone)
- Cross-file conflict detection with severity ranking
- Token efficiency analysis
- Structured audit reports saved to workspace
- Revised file generation with changelog
