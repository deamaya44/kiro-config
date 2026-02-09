#!/bin/bash

set -e

echo "🚀 Configurando Kiro..."

KIRO_DIR="$HOME/.kiro"
SESSIONS_DIR="$HOME/kiro/sessions"
SCRIPT_DIR="$(dirname "$0")"

mkdir -p "$KIRO_DIR/settings"
mkdir -p "$SESSIONS_DIR"

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

echo ""
echo "✅ Listo! Kiro leerá el contexto automáticamente"
echo "📁 Sesiones: $SESSIONS_DIR"
echo "📄 Contexto: $KIRO_DIR/context.md"
