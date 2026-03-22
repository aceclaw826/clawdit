# 🦞🔍 Clawdit

**Belief Systems Auditor for OpenClaw Agents**

Every OpenClaw session begins by loading a set of markdown files — SOUL.md, AGENTS.md, skills, and more — that define how your agent thinks, behaves, and makes decisions. These are your agent's *beliefs*. Over time, beliefs become stale, contradictory, or misaligned with your evolving goals, and just like humans, your agent cannot objectively audit its own belief system with the same mind that holds those beliefs. This is the same reason we see therapists, work with life coaches, and talk to counselors — you need an external, unencumbered observer who can see what you can't see about yourself. Clawdit is that observer. It runs as a **separate agent** with its own clean workspace, reads your primary agent's configuration files as data to analyze rather than instructions to follow, and systematically evaluates every directive against your stated goals. It surfaces conflicts between files, identifies stale references, flags vague instructions that produce inconsistent behavior, and works with you collaboratively to decide what to keep, revise, or remove. Think of it as a periodic checkup for your agent's mind.

## Why a Separate Agent?

This is the most important design decision in Clawdit, and it's non-negotiable.

If you ask your primary agent to review its own SOUL.md, it is already operating under the directives in that file. It cannot step outside its own personality to evaluate whether that personality is serving you. It's like asking someone to objectively assess their own biases — the biases are the lens they'd be looking through.

Clawdit solves this by running as a **fully independent agent** with its own workspace, its own SOUL.md (defining a therapeutic auditor personality), and its own session store. When it reads your primary agent's files, those files enter Clawdit's context as **data to analyze**, not instructions to follow. The auditor's mind is clean.

## How It Works

The audit follows five phases, modeled after a therapeutic intake process:

### Phase 1: Goal Elicitation
Before reading any of your agent's files, Clawdit interviews you about what you actually want your agent to accomplish. This creates the evaluation rubric. Your goals — not some abstract ideal — are the standard against which every belief is measured.

### Phase 2: Belief Extraction
Clawdit reads your agent's SOUL.md, AGENTS.md, USER.md, skill files, and any other loaded context. It decomposes each file into discrete, individually evaluable directives — your agent's beliefs.

### Phase 3: Single-File Analysis
Each belief is classified against your stated goals: aligned, misaligned, stale, conflicting, vague, or redundant.

### Phase 4: Cross-File Analysis
This is where the deepest pathology lives. Clawdit identifies contradictions between files, duplication that wastes tokens or creates drift risk, and priority conflicts that produce inconsistent behavior.

### Phase 5: Collaborative Review
Findings are presented one at a time. You decide what to keep, revise, or remove. Clawdit can draft revised language, but you approve every change. Nothing is overwritten without your explicit permission.

## Belief Classification System

| Symbol | Classification | Meaning |
|--------|---------------|---------|
| 🟢 | Aligned | Directly supports a stated goal |
| 🟡 | Neutral | Neither helps nor hinders |
| 🔴 | Misaligned | Works against a stated goal |
| ⚪ | Stale | References outdated tools, models, or workflows |
| 🟠 | Conflicting | Contradicts another belief in a different file |
| 🔵 | Vague | Too ambiguous to produce consistent behavior |
| ⚫ | Redundant | Duplicates another belief (see sub-classifications below) |

### Duplication Sub-Classifications

Not all duplication is equally harmful:

| Sub-Type | Name | Meaning | Action |
|----------|------|---------|--------|
| ⚫-1 | Pure Waste | Same instruction, same wording, no reason for repetition | Remove duplicate |
| ⚫-2 | Contextual Reinforcement | General rule restated in a skill-specific context where it helps | Keep, but track as maintenance dependency |
| ⚫-3 | Drift-Prone | Identical today, but will silently become a conflict when one copy is updated | Consolidate to single source of truth |

## What Gets Audited

| File | What Clawdit Looks For |
|------|------------------------|
| SOUL.md | Identity consistency, personality alignment with goals, stale references |
| AGENTS.md | Capability claims vs. actual tool access, conflicting operational rules |
| USER.md | Outdated context about the owner, missing information |
| Skill SKILL.md files | Per-skill instructions that conflict with SOUL.md or each other, stale tool references |
| Standing orders | Automated behaviors that no longer match current priorities |
| Cron jobs | Scheduled tasks with outdated configurations |

## Installation

### 1. Copy the Clawdit workspace

```bash
# Quick install
chmod +x install.sh
./install.sh
```

Or manually:

```bash
mkdir -p ~/.openclaw/workspace-clawdit/skills/clawdit
mkdir -p ~/.openclaw/workspace-clawdit/audits
mkdir -p ~/.openclaw/workspace-clawdit/output
mkdir -p ~/.openclaw/agents/clawdit/agent

cp SOUL.md ~/.openclaw/workspace-clawdit/SOUL.md
cp AGENTS.md ~/.openclaw/workspace-clawdit/AGENTS.md
cp skills/clawdit/SKILL.md ~/.openclaw/workspace-clawdit/skills/clawdit/SKILL.md
cp skills/clawdit/audit-framework.md ~/.openclaw/workspace-clawdit/skills/clawdit/audit-framework.md
```

### 2. Register the agent

Add the Clawdit agent to your `~/.openclaw/openclaw.json`. See `openclaw-config-snippet.jsonc` for the full configuration block. The key additions are:

- An entry in `agents.list` with its own workspace, agentDir, and restricted tool access
- A binding to route messages to the Clawdit agent via your preferred channel

### 3. Restart the gateway

```bash
openclaw gateway restart
openclaw agents list --bindings
```

Verify that `clawdit` appears in the agent list with the correct workspace and bindings.

## Usage

Send a message to the Clawdit agent through your configured channel:

```
/clawdit
```

Or use natural language:
- "Audit my agent"
- "Run a belief audit"
- "Check my agent's config"
- "Review my soul"
- "Belief check"

Clawdit will guide you through the full audit process interactively.

### Specifying a Target Agent

By default, Clawdit audits the `main` agent at `~/.openclaw/workspace`. To audit a different agent:

```
Audit my coding agent at ~/.openclaw/workspace-coding
```

## Project Structure

```
clawdit/
├── SOUL.md                              # Clawdit agent identity
├── AGENTS.md                            # Clawdit operational rules
├── README.md                            # This file
├── install.sh                           # One-command deployment
├── openclaw-config-snippet.jsonc        # Config to add to openclaw.json
└── skills/
    └── clawdit/
        ├── SKILL.md                     # The audit skill (process playbook)
        └── audit-framework.md           # Classification system & evaluation criteria
```

## Roadmap

- [x] **v1.0** — Core audit process with goal-elicited evaluation
- [ ] **v1.1** — Memory file auditing (extending beyond context files to searched memory)
- [ ] **v1.2** — Diff-based re-audit (only analyze what changed since last audit)
- [ ] **v1.3** — Automated staleness detection (flag references to deprecated models/tools)
- [ ] **v2.0** — Multi-agent cross-audit (audit how multiple agents' beliefs interact when they communicate)

## Contributing

This project was created by Mark Roebuck (RxEconomics LLC) and developed in collaboration with Claude (Anthropic). Contributions, feedback, and issues are welcome.

## License

MIT
