# ⬡ MYTHOX CYBER OPS — OpenCode Agent Suite

> **6 agents متخصصون في الأمن السيبراني** يعملون داخل OpenCode — بنماذج AI مجانية 100% عبر OpenCode Zen.

```
  ███╗   ███╗██╗   ██╗████████╗██╗  ██╗ ██████╗ ██╗  ██╗
  ████╗ ████║╚██╗ ██╔╝╚══██╔══╝██║  ██║██╔═══██╗╚██╗██╔╝
  ██╔████╔██║ ╚████╔╝    ██║   ███████║██║   ██║ ╚███╔╝
  ██║╚██╔╝██║  ╚██╔╝     ██║   ██╔══██║██║   ██║ ██╔██╗
  ██║ ╚═╝ ██║   ██║      ██║   ██║  ██║╚██████╔╝██╔╝ ██╗
  ╚═╝     ╚═╝   ╚═╝      ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝
```

---

## ⚡ تثبيت في 30 ثانية

```bash
git clone https://github.com/Youssefzdb/mythox-opencode-cyber
cd mythox-opencode-cyber
bash install.sh
```

---

## 🤖 الـ Agents

| Agent | Mode | النموذج | التخصص |
|-------|------|---------|---------|
| 🔵 **recon** | primary | MiMo V2.5 🧠 | OSINT، subdomain enum، network mapping |
| 🔴 **exploit** | primary | MiMo V2.5 🧠 | تحليل الثغرات، exploitation، CVE |
| 🟣 **phantom** | primary | North Mini ⚡ | Post-exploitation، persistence، C2 |
| ⚪ **build** | primary | North Mini ⚡ | كتابة الأدوات، exploit dev، automation |
| 🟡 **cipher** | subagent | MiMo V2.5 🧠 | Reverse engineering، crypto attacks، CTF |
| 🔵 **sentinel** | subagent | Nemotron 🔬 | Blue team، forensics، threat hunting |
| 🟢 **scribe** | subagent | DeepSeek 🚀 | تقارير pentest احترافية |

---

## 🎮 الاستخدام

```bash
# تشغيل OpenCode
opencode

# Tab — التبديل بين primary agents
# @ — استدعاء subagent

@recon      # ابدأ هجوم OSINT على هدف
@exploit    # حلل هذه الثغرة واعطني exploit
@phantom    # اعطني privesc vector على هذا النظام
@cipher     # فك تشفير هذا الـ binary
@sentinel   # هل هذا الـ log يحمل IOC؟
@scribe     # اكتب تقرير pentest لهذه النتائج
```

---

## 🆓 النماذج المجانية

| النموذج | الاستخدام |
|---------|----------|
| `mimo-v2.5-free` | التحليل العميق، reasoning |
| `north-mini-code-free` | التنفيذ السريع، الكود |
| `nemotron-3-ultra-free` | الـ forensics والتحليل العلمي |
| `deepseek-v4-flash-free` | التقارير، الكتابة |

---

## 📋 Requirements

- OpenCode: `curl -fsSL https://opencode.ai/install | bash`
- Auth: `opencode auth login` → اختر **OpenCode Zen** (مجاني)
- لا يحتاج API Key

---

> **For educational and authorized penetration testing only.**