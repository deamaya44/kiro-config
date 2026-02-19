#!/bin/bash

set -e

echo "🚀 Configurando Kiro..."

KIRO_DIR="$HOME/.kiro"
SESSIONS_DIR="$HOME/kiro-sessions"
SCRIPT_DIR="$(dirname "$0")"

mkdir -p "$KIRO_DIR/settings"

echo "📦 Clonando repositorio de sesiones..."
if [ ! -d "$SESSIONS_DIR" ]; then
  git clone git@github.com:deamaya44/kiro-sessions.git "$SESSIONS_DIR"
else
  echo "⚠️  Repositorio ya existe, actualizando..."
  cd "$SESSIONS_DIR" && git pull
fi

mkdir -p "$SESSIONS_DIR/sessions"

echo "📝 Instalando contexto global..."
cp "$SCRIPT_DIR/context.md" "$KIRO_DIR/context.md"

echo "⚙️  Configurando contexto..."
cat > "$KIRO_DIR/settings/context.json" << 'EOF'
{
  "contexts": [
    {
      "name": "global",
      "paths": ["~/.kiro/context.md"],
      "enabled": true
    }
  ]
}
EOF

echo "🔧 Configurando agente default..."
mkdir -p "$KIRO_DIR/agents"
cat > "$KIRO_DIR/agents/default.json" << 'EOF'
{
  "name": "default",
  "description": "Agente por defecto con contexto global",
  "resources": [
    "file://~/.kiro/context.md"
  ],
  "tools": [
    "fs_read",
    "fs_write",
    "execute_bash",
    "glob",
    "grep",
    "code",
    "web_search",
    "web_fetch",
    "use_aws",
    "use_subagent"
  ]
}
EOF

kiro-cli agent set-default --name default
echo ""
echo "✅ Listo! Kiro leerá el contexto automáticamente"
echo "📁 Sesiones: $SESSIONS_DIR/sessions"
echo "📄 Contexto: $KIRO_DIR/context.md"
echo ""
echo "💡 Tip: Las sesiones se sincronizan automáticamente con GitHub"
echo "   Repo: git@github.com:deamaya44/kiro-sessions.git"
