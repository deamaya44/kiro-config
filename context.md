# Contexto Global de Kiro

This file is kept for compatibility. The live standard is split under `context/`:

- `context/global.md` — communication, git, security, infra change rules
- `context/routing.md` — when the orchestrator delegates
- `context/iac.md` — Terraform/OpenTofu house style
- `context/reports.md` — reports, assessments, D2
- `context/runtime-gcp.md` — live GCP/K8s operations
- `context/runtime-aws.md` — live AWS operations
- `context/private.md.example` — template for local private facts (not company data in git)

`install.sh` copies slices to `~/.kiro/context/` and installs only these agents:

`default`, `iac`, `reports`, `runtime-gcp`, `runtime-aws`
