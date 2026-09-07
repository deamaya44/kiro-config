# Homelab / self-hosted standard

## Scope
Personal or lab infrastructure: VPS, self-hosted Kubernetes, mesh VPN, reverse proxies, personal LLM gateways, device access.

## Working style
- Prefer infrastructure as code when the stack is stable enough
- Keep public exposure minimal; prefer mesh/VPN over open admin ports
- Document break-glass access and backup/restore paths in session notes
- Separate lab experiments from client production work — do not mix credentials or kube contexts casually

## Safety
- Confirm context (`kubectl config`, VPN peer, host) before applying changes
- Avoid storing lab secrets in the public kiro-config repo
- Destructive lab resets still need an explicit go-ahead when data matters
