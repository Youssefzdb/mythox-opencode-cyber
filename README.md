# MYTHOX Cyber Ops v2 — OpenCode Agent Suite

> Mythos-Level Offensive Security Agents powered by OpenCode Zen (100% Free)

Inspired by **Anthropic's Claude Mythos** — the AI that autonomously finds zero-days in Firefox, writes 20-gadget ROP chains, and chains 4 vulnerabilities into browser sandbox escapes. This suite brings that methodology to OpenCode with free models.

## Agents

| Agent | Model | Role |
|-------|-------|------|
| `@recon` | MiMo V2.5 🧠 | OSINT, subdomain enum, attack surface mapping |
| `@exploit` | MiMo V2.5 🧠 | SQLi, XSS, RCE, binary exploitation, CVE weaponization |
| `@phantom` | North Mini ⚡ | Post-exploitation, PrivEsc, lateral movement, C2 |
| `@cipher` | MiMo V2.5 🧠 | Reverse engineering, crypto attacks, malware analysis |
| `@sentinel` | Nemotron 🔬 | Threat hunting, forensics, YARA/Sigma rules, SIEM |
| `@scribe` | DeepSeek 🚀 | Pentest reports, CVE advisories, CVSS scoring |
| `@build` | North Mini ⚡ | Exploit code, security tools, automation scripts |

## Install

```bash
git clone https://github.com/Youssefzdb/mythox-opencode-cyber
cd mythox-opencode-cyber
bash install.sh
```

## Activate Free Models

```bash
opencode auth login
# Select: OpenCode Zen
```

No API key needed. No credit card. 100% free.

## Usage

```bash
opencode          # Launch
@recon            # Recon agent
@exploit          # Exploit agent
@phantom          # Post-exploitation
@cipher           # Reverse engineering
@sentinel         # Blue team / forensics
@scribe           # Report writing
@build            # Code development
```

## Free Models Available

| Model | Speed | Reasoning | Best For |
|-------|-------|-----------|----------|
| `north-mini-code-free` | ⚡⚡⚡ | ❌ | Quick code, shell commands |
| `mimo-v2.5-free` | ⚡⚡ | ✅ | Deep vulnerability analysis |
| `nemotron-3-ultra-free` | ⚡⚡ | ❌ | Forensics, threat hunting |
| `deepseek-v4-flash-free` | ⚡⚡⚡ | ❌ | Reports, documentation |
| `big-pickle` | ⚡⚡ | ❌ | General purpose backup |

## Architecture

```
~/.config/opencode/
├── opencode.jsonc     ← Provider config (Zen, no temp errors)
└── agents/
    ├── recon.md
    ├── exploit.md
    ├── phantom.md
    ├── cipher.md
    ├── sentinel.md
    ├── scribe.md
    └── build.md
```

## Credits

Built on [OpenCode](https://opencode.ai) | Inspired by [Anthropic Mythos](https://red.anthropic.com/2026/mythos-preview/)
