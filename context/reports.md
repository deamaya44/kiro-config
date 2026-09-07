# Reports and assessments standard

## Before generating a report, ask
1. Legal client/company name (verify from official site if needed)
2. Logo URL or file for the header
3. Audience / receiving area (cover and footer)

Do not invent client branding. Do not embed private company facts from memory into public templates.

## HTML → PDF format (house default)
- Body: Times New Roman, 12pt, justified with `hyphens: auto`
- Structure: Cover → Table of contents → Numbered sections
- Cover and TOC: no header/footer
- From section 1: header = client logo (left) + report title (right); footer = client name + `counter(page)`
- Tables (APA-inspired default):
  - `Tabla N` bold + italic title above the table
  - Horizontal rules only; header row light gray `#f0f0f0`, bold black text
  - `font-size: 10.5pt`, `table-layout: fixed`, wrap long cells, repeat `thead`
  - Keep tables from splitting awkwardly (`break-inside: avoid` on wrapper)
  - Optional italic note under the table
- Page breaks: `break-before: page` on each main `h2`
- Portrait by default; landscape only if explicitly requested
- Strict APA7 only when explicitly requested

## PDF generation
- Tool: WeasyPrint (CSS Paged Media)
- Do not use Chrome headless for final PDFs
- Typical macOS env:
  - venv: `/tmp/weasy_env/bin/python3`
  - `DYLD_LIBRARY_PATH="/opt/homebrew/lib"`
- Verify page orientation after render before delivery

## Output paths (placeholders — never hardcode a client)
- HTML/PDF: `~/Documents/<org>/<client>/<project>/informe-<desc>-YYYY-MM-DD.{html,pdf}`
- Reference the matching session summary under kiro-sessions

## Diagrams (D2)
- Render with Docker image `terrastruct/d2` — do not install via brew
```bash
docker run --rm -v "$(pwd)/diagrams:/work" terrastruct/d2 \
  --layout=elk --theme=0 --pad=40 /work/file.d2 /work/file.svg
```
- Theme `0`, layout `elk`, prefer `direction: right`
- No custom `style.fill` unless required for accessibility
- Post-process only the root `<svg>` tag for browser viewing (`preserveAspectRatio`, width/height)
- Keep `.d2` in git; regenerate `.svg` as needed

## Code assessments
- One assessment per repo + optional fleet rollup
- Gate/score model with severities and prioritized findings
- Reuse the user's local assessment generators when present; do not invent proprietary scoring
- Store outputs next to the project under `assessments/` unless told otherwise
