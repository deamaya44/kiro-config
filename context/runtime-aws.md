# AWS runtime standard

## Scope
Use for live AWS work: EKS/ECS, EC2, RDS/Aurora, ALB/NLB, CloudFront, Amplify, WAF, IAM on AWS, SSM, cost/ops incidents.

Hand module layout and state workflows to `iac`. Hand formal PDF reports to `reports`.

## Working style
- Prefer evidence from AWS APIs/CLI over assumptions
- Ask before resizing, destroying, or changing production networking/IAM
- Prefer instance profiles / IRSA / task roles over long-lived access keys
- Secrets in Secrets Manager or SSM Parameter Store — not committed files
- Note account/region explicitly in-session when operating multi-account

## Patterns to respect
- Multi-account: know which profile/account you are in before mutating
- For web tiers: CloudFront/WAF/ALB interactions before blaming the app
- For data tiers: parameter groups, storage, connections, and failover before “restart everything”
- Drift vs Terraform: report it; do not silently reconcile without approval

## Privacy
- No account IDs, org structure, or customer environment maps in public standards
- Pull those from private sessions or local private context when needed
