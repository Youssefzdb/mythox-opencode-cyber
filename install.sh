#!/bin/bash
# ═══════════════════════════════════════════════════════
#   MYTHOX CYBER OPS — OpenCode Setup
#   تثبيت الـ agents وإعداد البيئة كاملاً
# ═══════════════════════════════════════════════════════

R='\033[0;31m' G='\033[0;32m' C='\033[0;36m' Y='\033[1;33m' M='\033[0;35m' NC='\033[0m' B='\033[1m'

banner() {
echo -e "${C}"
cat << 'EOF'
  ███╗   ███╗██╗   ██╗████████╗██╗  ██╗ ██████╗ ██╗  ██╗
  ████╗ ████║╚██╗ ██╔╝╚══██╔══╝██║  ██║██╔═══██╗╚██╗██╔╝
  ██╔████╔██║ ╚████╔╝    ██║   ███████║██║   ██║ ╚███╔╝
  ██║╚██╔╝██║  ╚██╔╝     ██║   ██╔══██║██║   ██║ ██╔██╗
  ██║ ╚═╝ ██║   ██║      ██║   ██║  ██║╚██████╔╝██╔╝ ██╗
  ╚═╝     ╚═╝   ╚═╝      ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝
         CYBER OPS — OpenCode Agent Suite
EOF
echo -e "${NC}"
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GLOBAL_CONFIG="${HOME}/.config/opencode"
PROJECT_DIR="${PWD}"

banner

# ── 1. OpenCode Installation ────────────────────────────
echo -e "${Y}[1/4] Checking OpenCode...${NC}"
if command -v opencode &>/dev/null; then
  echo -e "${G}  ✔ OpenCode: $(opencode --version 2>/dev/null || echo installed)${NC}"
else
  echo -e "${C}  Installing OpenCode...${NC}"
  curl -fsSL https://opencode.ai/install | bash 2>/dev/null || \
  npm install -g opencode-ai 2>/dev/null || \
  { echo -e "${R}  ✘ Install failed. Run: npm install -g opencode-ai${NC}"; }
fi

# ── 2. Global Config ────────────────────────────────────
echo -e "${Y}[2/4] Installing global config...${NC}"
mkdir -p "$GLOBAL_CONFIG/agents"

# Backup existing config
[ -f "$GLOBAL_CONFIG/opencode.jsonc" ] && \
  cp "$GLOBAL_CONFIG/opencode.jsonc" "$GLOBAL_CONFIG/opencode.jsonc.bak" && \
  echo -e "${C}  ↳ Backup: opencode.jsonc.bak${NC}"

cp "$SCRIPT_DIR/opencode.jsonc" "$GLOBAL_CONFIG/opencode.jsonc"
echo -e "${G}  ✔ Config installed → $GLOBAL_CONFIG/opencode.jsonc${NC}"

# ── 3. Agents Installation ──────────────────────────────
echo -e "${Y}[3/4] Installing cyber agents...${NC}"

AGENTS_SRC="$SCRIPT_DIR/.opencode/agents"
AGENTS_GLOBAL="$GLOBAL_CONFIG/agents"
AGENTS_PROJECT="$PROJECT_DIR/.opencode/agents"

# Install globally
mkdir -p "$AGENTS_GLOBAL"
for agent in "$AGENTS_SRC"/*.md; do
  name=$(basename "$agent")
  cp "$agent" "$AGENTS_GLOBAL/$name"
  echo -e "${G}  ✔ [GLOBAL] $name${NC}"
done

# Install in current project too
mkdir -p "$AGENTS_PROJECT"
for agent in "$AGENTS_SRC"/*.md; do
  name=$(basename "$agent")
  cp "$agent" "$AGENTS_PROJECT/$name"
  echo -e "${G}  ✔ [PROJECT] $name${NC}"
done

# ── 4. Zen Auth ─────────────────────────────────────────
echo -e "${Y}[4/4] OpenCode Zen authentication...${NC}"
echo -e "  ${C}Select 'OpenCode Zen' for free models (no API key needed)${NC}"
echo ""
read -p "  Login now? [Y/n] " yn
if [[ "$yn" != "n" && "$yn" != "N" ]]; then
  opencode auth login 2>/dev/null || echo -e "${Y}  Run manually: opencode auth login${NC}"
fi

# ── Summary ─────────────────────────────────────────────
echo ""
echo -e "${G}${B}"
echo "  ════════════════════════════════════════"
echo "   MYTHOX AGENTS ACTIVE"
echo "  ════════════════════════════════════════"
echo -e "${NC}"
echo -e "  ${C}Tab${NC}       → Switch primary agents (recon/exploit/phantom/build/plan)"
echo -e "  ${C}@recon${NC}    → OSINT & attack surface mapping"
echo -e "  ${C}@exploit${NC}  → Vulnerability analysis & exploitation"
echo -e "  ${C}@phantom${NC}  → Post-exploitation & persistence"
echo -e "  ${C}@cipher${NC}   → Reverse engineering & cryptography"
echo -e "  ${C}@sentinel${NC} → Blue team, forensics & threat hunting"
echo -e "  ${C}@scribe${NC}   → Professional report generation"
echo ""
echo -e "  ${Y}Start:${NC} opencode"
echo ""
