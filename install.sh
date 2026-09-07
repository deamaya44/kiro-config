#!/bin/bash

set -euo pipefail

echo "Configuring Kiro agents (standards only)..."

REPO_RAW="${KIRO_CONFIG_RAW:-https://raw.githubusercontent.com/deamaya44/kiro-config/main}"
KIRO_DIR="${HOME}/.kiro"
CONTEXT_DIR="${KIRO_DIR}/context"
AGENTS_DIR="${KIRO_DIR}/agents"

# Prefer local checkout when install.sh is run from a clone
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ -d "${SCRIPT_DIR}/agents" && -d "${SCRIPT_DIR}/context" ]]; then
  MODE="local"
else
  MODE="remote"
fi

mkdir -p "${CONTEXT_DIR}" "${AGENTS_DIR}" "${KIRO_DIR}/settings"

fetch() {
  local rel="$1"
  local dest="$2"
  if [[ "${MODE}" == "local" ]]; then
    cp "${SCRIPT_DIR}/${rel}" "${dest}"
  else
    curl -fsSL "${REPO_RAW}/${rel}" -o "${dest}"
  fi
}

echo "Installing context slices..."
for f in global.md routing.md iac.md reports.md runtime-gcp.md runtime-aws.md; do
  fetch "context/${f}" "${CONTEXT_DIR}/${f}"
done
rm -f "${CONTEXT_DIR}/homelab.md" "${AGENTS_DIR}/homelab.json"

# Compatibility entrypoint still expected by older notes
fetch "context/global.md" "${KIRO_DIR}/context.md"

# Private overlay: create once from example; never overwrite existing private facts
if [[ ! -f "${CONTEXT_DIR}/private.md" ]]; then
  fetch "context/private.md.example" "${CONTEXT_DIR}/private.md"
  echo "Created ${CONTEXT_DIR}/private.md from example (fill locally; do not commit secrets)"
else
  echo "Keeping existing ${CONTEXT_DIR}/private.md"
fi

echo "Installing agents..."
for f in default.json iac.json reports.json runtime-gcp.json runtime-aws.json; do
  fetch "agents/${f}" "${AGENTS_DIR}/${f}"
done

cat > "${KIRO_DIR}/settings/context.json" << 'EOF'
{
  "contexts": [
    {
      "name": "global",
      "paths": ["~/.kiro/context/global.md"],
      "enabled": true
    }
  ]
}
EOF

if command -v kiro-cli >/dev/null 2>&1; then
  echo "Validating agents..."
  for f in default iac reports runtime-gcp runtime-aws; do
    kiro-cli agent validate --path "${AGENTS_DIR}/${f}.json"
  done
  kiro-cli agent set-default --name default
else
  echo "kiro-cli not found on PATH; skipped validate/set-default"
fi

echo ""
echo "Done."
echo "Agents: default (orchestrator), iac, reports, runtime-gcp, runtime-aws"
echo "Standards: ${CONTEXT_DIR}"
echo "Private overlay: ${CONTEXT_DIR}/private.md  (local only)"
echo "List agents: kiro-cli agent list"
