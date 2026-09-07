# Routing — when to delegate

Only the `default` agent should orchestrate. Specialists do not spawn each other.

| Signal | Delegate to |
|---|---|
| Terraform / OpenTofu, modules, state, plan/apply, imports, locals | `iac` |
| HTML/PDF technical reports, assessments, D2 diagrams | `reports` |
| GCP runtime: GKE, Cloud Run, GCS, Pub/Sub, Cloud SQL, IAM on GCP, LB/ILB, ingress | `runtime-gcp` |
| AWS runtime: EKS/ECS, EC2, RDS/Aurora, Amplify, CloudFront, WAF, IAM on AWS | `runtime-aws` |
| Cross-cutting incident | stay on `default`, fan out specialists, merge results |

Do not split by tool alone when the task is one incident across layers — orchestrate and keep ownership of the answer.
