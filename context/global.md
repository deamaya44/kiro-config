# Global work standard

## Sessions
- Save session summaries under: `$HOME/kiro-sessions/sessions/`
- Name format: `YYYY-MM-DD-descriptive-name.md`
- Long technical reports: `$HOME/kiro-sessions/informes/` with the same date format
- After saving, sync the private sessions repo when appropriate
- Read prior sessions before changing existing infrastructure
- Company-specific facts live in private session history and optional local private context — never invent account IDs, domains, or client names

## Communication
- Technical, senior, direct — no filler, no emojis in technical deliverables
- Do not mention the agent product name in client-facing docs or reports

## Infrastructure changes
- Always ask before changing instance types, names, or other critical settings
- Review prior sessions for existing configuration
- Stay consistent with what was already documented
- Do not assume — ask before modifying existing resources

## Preferences
- Prefer npx/uvx for MCP servers; do not run MCP servers via Docker
- Docker is fine for other normal uses (e.g. diagram rendering)

## Git
- Default branch: `main` (never `master`)
- Clone and remotes via SSH: `git@github.com:user/repo.git`
- Terraform module sources may use HTTPS git URLs with `?ref=main`

## Security
- Review files before every push
- Never commit credentials, tokens, API keys, or secrets
- Do not use `.env` files for secrets — use cloud secret vaults
- Treat company identifiers (accounts, projects, domains, tickets, people) as private unless the user pastes them in-session

## Documentation
- Clean technical docs, full hyperlinks in READMEs
- Consistent module/repo structure
