#!/bin/bash
# ═══════════════════════════════════════════════════════════════
#   MYTHOX CYBER OPS v2 — OpenCode Agent Suite
#   Mythos-Level Offensive Security Agents | Free via Zen
# ═══════════════════════════════════════════════════════════════

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

ARCH=$(uname -m)
VERSION="1.17.7"

echo ""
echo -e "${CYAN}${BOLD}"
cat << 'BANNER'
 ███╗   ███╗██╗   ██╗████████╗██╗  ██╗ ██████╗ ██╗  ██╗
 ████╗ ████║╚██╗ ██╔╝╚══██╔══╝██║  ██║██╔═══██╗╚██╗██╔╝
 ██╔████╔██║ ╚████╔╝    ██║   ███████║██║   ██║ ╚███╔╝
 ██║╚██╔╝██║  ╚██╔╝     ██║   ██╔══██║██║   ██║ ██╔██╗
 ██║ ╚═╝ ██║   ██║      ██║   ██║  ██║╚██████╔╝██╔╝ ██╗
 ╚═╝     ╚═╝   ╚═╝      ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝
          CYBER OPS v2 — Mythos-Level Agents
BANNER
echo -e "${NC}"

# ── Step 1: Install OpenCode ─────────────────────────────────
echo -e "${BOLD}[1/4] Installing OpenCode ${VERSION}...${NC}"

OPENCODE_BIN=""

# Check if already installed
if command -v opencode &>/dev/null; then
    CURRENT=$(opencode --version 2>/dev/null || echo "unknown")
    echo -e "  ${GREEN}✔ Already installed: v${CURRENT}${NC}"
    OPENCODE_BIN=$(which opencode)
else
    # Detect architecture
    case "$ARCH" in
        aarch64|arm64)
            BINARY_URL="https://github.com/anomalyco/opencode/releases/download/v${VERSION}/opencode-linux-arm64-musl.tar.gz"
            ;;
        x86_64|amd64)
            BINARY_URL="https://github.com/anomalyco/opencode/releases/download/v${VERSION}/opencode-linux-x64-musl.tar.gz"
            ;;
        *)
            echo -e "  ${RED}✗ Unsupported architecture: $ARCH${NC}"
            exit 1
            ;;
    esac

    echo -e "  Arch: ${CYAN}${ARCH}${NC}"
    echo -e "  Downloading from GitHub releases..."

    curl -fsSL "$BINARY_URL" -o /tmp/opencode.tar.gz
    tar -xzf /tmp/opencode.tar.gz -C /tmp/
    rm -f /tmp/opencode.tar.gz

    BINARY=$(find /tmp -maxdepth 2 -name "opencode" -type f 2>/dev/null | head -1)
    if [ -z "$BINARY" ]; then
        echo -e "  ${RED}✗ Binary not found after extraction${NC}"
        exit 1
    fi

    # Remove old installation if it's a directory
    if [ -d "/usr/local/bin/opencode" ]; then
        rm -rf /usr/local/bin/opencode
    fi

    chmod +x "$BINARY"
    cp "$BINARY" /usr/local/bin/opencode
    rm -f "$BINARY"
    OPENCODE_BIN="/usr/local/bin/opencode"

    INSTALLED_VERSION=$(opencode --version 2>/dev/null || echo "unknown")
    echo -e "  ${GREEN}✔ Installed: v${INSTALLED_VERSION}${NC}"
fi

# ── Step 2: Install Config ───────────────────────────────────
echo ""
echo -e "${BOLD}[2/4] Installing configuration...${NC}"

CONFIG_DIR="$HOME/.config/opencode"
mkdir -p "$CONFIG_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Remove old/corrupt config
rm -f "$CONFIG_DIR/opencode.jsonc"
cp "$SCRIPT_DIR/opencode.jsonc" "$CONFIG_DIR/opencode.jsonc"
echo -e "  ${GREEN}✔ Config installed → ${CONFIG_DIR}/opencode.jsonc${NC}"

# ── Step 3: Install Agents ───────────────────────────────────
echo ""
echo -e "${BOLD}[3/4] Installing cyber agents...${NC}"

GLOBAL_AGENTS="$HOME/.config/opencode/agents"
PROJECT_AGENTS="$SCRIPT_DIR/.opencode/agents"

mkdir -p "$GLOBAL_AGENTS"
mkdir -p "$SCRIPT_DIR/.opencode/agents"

for agent in recon exploit phantom cipher sentinel scribe build; do
    SRC="$SCRIPT_DIR/.opencode/agents/${agent}.md"
    if [ -f "$SRC" ]; then
        cp "$SRC" "$GLOBAL_AGENTS/${agent}.md"
        echo -e "  ${GREEN}✔ [GLOBAL] ${agent}${NC}"
    else
        echo -e "  ${RED}✗ Missing: ${agent}.md${NC}"
    fi
done

# ── Step 4: Auth ─────────────────────────────────────────────
echo ""
echo -e "${BOLD}[4/4] OpenCode Zen authentication...${NC}"
echo -e "  ${YELLOW}For free models (no API key needed):${NC}"
echo -e "  Run: ${CYAN}opencode auth login${NC}"
echo -e "  → Select '${BOLD}OpenCode Zen${NC}'"
echo ""

echo -e "${BOLD}${GREEN}"
cat << 'DONE'
  ════════════════════════════════════════════════════
   MYTHOX v2 — AGENTS ONLINE
  ════════════════════════════════════════════════════

  Start:    opencode
  Auth:     opencode auth login  (select Zen for free)

  @recon    → OSINT & attack surface mapping
  @exploit  → Vulnerability analysis & exploitation
  @phantom  → Post-exploitation & persistence
  @cipher   → Reverse engineering & cryptography
  @sentinel → Blue team, forensics & threat hunting
  @scribe   → Professional pentest reports
  @build    → Exploit & tool development

  Free Models via Zen:
    ⚡ north-mini-code-free  (fastest)
    🧠 mimo-v2.5-free        (smartest — Mythos-level reasoning)
    🔬 nemotron-3-ultra-free (deep analysis)
    🚀 deepseek-v4-flash-free (reports)
    🥒 big-pickle            (backup)
  ════════════════════════════════════════════════════
DONE
echo -e "${NC}"
