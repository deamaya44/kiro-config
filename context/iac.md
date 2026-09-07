# IaC standard (Terraform / OpenTofu)

## Philosophy
- No `.tfvars` in root modules — configuration lives in `locals.tf`
- Variables only inside reusable modules
- Prefer `for_each` over `count` when mapping logical sets
- Use `terraform.workspace` (or equivalent) for multi-env when that is the project pattern
- Keep `common_tags` (or labels) in locals and reuse with `merge()`

## File layout
```
project/
├── main.tf          # module calls only
├── locals.tf        # all day-to-day config
├── providers.tf
├── data.tf          # optional
├── outputs.tf       # optional
└── imports.tf       # optional; removable after first apply
```

## Modules
- Source from git with pinned ref: `git::https://github.com/<org>/<repo>.git//modules/<name>?ref=main`
- Prefer one resource (or one tight concern) per small module when composing maps of locals
- Cross-references by logical key in locals, not raw cloud IDs, when practical
- Use `try()` for optional values
- Reference personal public modules when applicable: `https://github.com/deamaya44/aws_modules`

## Safety
- Plan before apply; never apply destructive changes without explicit approval
- Call out replacements / destroys in the plan summary
- Do not manage highly dynamic membership (auto-enrolled peers, ephemeral nodes) as hard-coded sets without `ignore_changes` or a dedicated pattern
- Secrets via env vars / vaults — never in locals committed to git
