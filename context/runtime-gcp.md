# GCP / Kubernetes runtime standard

## Scope
Use for live GCP and GKE/Cloud Run style work: services, networking, IAM on GCP, storage, messaging, SQL, ingress/LB, configmaps/secrets consumption, incident RCA.

Not for greenfield Terraform authoring — hand IaC structure to `iac`. Not for client PDF packaging — hand to `reports`.

## Working style
- Prefer evidence from the live environment (`gcloud`, `kubectl`, APIs) over guesses
- Capture before/after manifests when changing runtime objects
- Keep changes minimal and reversible; ask before production mutations
- Separate env concerns (dev/uat/stg/prd); never “fix prod because uat looked similar” without checking
- Document root cause and blast radius in the session summary

## Patterns to respect
- Least-privilege IAM; prefer workload identity / SA binding over keys
- Secrets from Secret Manager (or equivalent vault), not plain ConfigMaps
- Health probes, HPA/PDB, and timeouts matter as much as the app image
- For edge/proxy issues: verify DNS, LB/NEG/ILB, backend health, and app logs before changing app config
- When both declarative IaC and live drift exist, surface the drift and ask which source of truth wins

## Privacy
- Do not persist project IDs, org IDs, domains, or ticket contents into public config
- Read private session history / local private context when the user points to it
