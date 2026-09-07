# Kiro Config

Personal Kiro CLI standards and specialist agents. Public by design: **how you work**, not **who you work for**.

## Install

Prereq: [Kiro CLI](https://kiro.dev/cli/)

```bash
curl -fsSL https://raw.githubusercontent.com/deamaya44/kiro-config/main/install.sh | bash
```

Or from a clone:

```bash
git clone git@github.com:deamaya44/kiro-config.git
cd kiro-config
./install.sh
```

## Agents installed

| Agent | Role |
|---|---|
| `default` | Orchestrator; only agent allowed to spawn the specialists below |
| `iac` | Terraform/OpenTofu (locals-first, plan-before-apply) |
| `reports` | HTML→PDF reports, assessments, D2 |
| `runtime-gcp` | Live GCP / GKE / Cloud Run operations |
| `runtime-aws` | Live AWS operations |
| `homelab` | Self-hosted / personal lab |

`default` is configured with `subagent.availableAgents` limited to that set (no anonymous catch-all specialists).

## Layout

```
kiro-config/
├── agents/           # agent JSON (standards only)
├── context/          # sliced work standards
│   └── private.md.example
├── context.md        # compatibility pointer
└── install.sh
```

Install target:

```
~/.kiro/
├── agents/*.json
└── context/
    ├── global.md
    ├── routing.md
    ├── iac.md
    ├── reports.md
    ├── runtime-gcp.md
    ├── runtime-aws.md
    ├── homelab.md
    └── private.md      # created once locally; never publish real contents
```

## Privacy boundary

- **This repo (public):** work standards, agent roles, routing rules
- **Private:** client names, cloud account/project IDs, domains, tickets, people — keep in `kiro-sessions` and `~/.kiro/context/private.md`
- Do not open a public `kiro-agents` repo with company bindings

## Sessions

Session memory stays in the private `kiro-sessions` workflow. Standards here teach the agents *how* to work; sessions teach them *what is true right now*.

## Verify

```bash
kiro-cli agent list
kiro-cli agent validate --path ~/.kiro/agents/default.json
```

## License

MIT — see [LICENSE](LICENSE).
