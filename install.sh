#!/bin/bash
# =============================================================================
# Clawdit Installer
# Deploys the Clawdit agent workspace to your OpenClaw installation
# =============================================================================

set -e

OPENCLAW_HOME="${OPENCLAW_STATE_DIR:-$HOME/.openclaw}"
WORKSPACE="${OPENCLAW_HOME}/workspace-clawdit"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "🦞🔍 Clawdit Installer"
echo "======================"
echo ""
echo "OpenClaw home: ${OPENCLAW_HOME}"
echo "Workspace:     ${WORKSPACE}"
echo ""

# Check if OpenClaw is installed
if [ ! -d "${OPENCLAW_HOME}" ]; then
    echo "❌ OpenClaw home directory not found at ${OPENCLAW_HOME}"
    echo "   Make sure OpenClaw is installed before running this script."
    exit 1
fi

# Check for existing workspace
if [ -d "${WORKSPACE}" ]; then
    echo "⚠️  Workspace already exists at ${WORKSPACE}"
    read -p "   Overwrite? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "   Aborted."
        exit 0
    fi
fi

echo "📁 Creating directories..."
mkdir -p "${WORKSPACE}/skills/clawdit"
mkdir -p "${WORKSPACE}/audits"
mkdir -p "${WORKSPACE}/output"
# Note: Agent config lives in openclaw.json, not in the agent dir.
# The dir is created for OpenClaw's agent resolution but stays empty.

echo "📄 Copying workspace files..."
cp "${SCRIPT_DIR}/SOUL.md" "${WORKSPACE}/SOUL.md"
cp "${SCRIPT_DIR}/AGENTS.md" "${WORKSPACE}/AGENTS.md"
cp "${SCRIPT_DIR}/skills/clawdit/SKILL.md" "${WORKSPACE}/skills/clawdit/SKILL.md"
cp "${SCRIPT_DIR}/skills/clawdit/audit-framework.md" "${WORKSPACE}/skills/clawdit/audit-framework.md"

echo "📄 Creating .gitignore..."
cat > "${WORKSPACE}/.gitignore" << 'GITIGNORE'
# Audit outputs contain private agent config details
audits/
output/
GITIGNORE

echo ""
echo "✅ Clawdit workspace deployed successfully!"
echo ""
echo "📋 Next steps:"
echo ""
echo "   1. Add the Clawdit agent to your ~/.openclaw/openclaw.json"
echo "      See openclaw-config-snippet.jsonc for the config block to merge."
echo ""
echo "   2. Add a channel binding to route messages to the Clawdit agent."
echo "      Options: dedicated Telegram bot, Discord channel, or WhatsApp peer."
echo ""
echo "   3. Restart your gateway:"
echo "      openclaw gateway restart"
echo ""
echo "   4. Verify the agent is registered:"
echo "      openclaw agents list --bindings"
echo ""
echo "   5. Send '/clawdit' or 'audit my agent' to the Clawdit agent."
echo ""
echo "🦞 Happy auditing!"
