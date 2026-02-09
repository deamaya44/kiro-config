#!/bin/bash

set -e

echo "🚀 Configurando Kiro..."

SESSIONS_DIR="$HOME/kiro/sessions"
SCRIPT_DIR="$(dirname "$0")"

mkdir -p "$SESSIONS_DIR"

echo "📝 Instalando contexto global..."
cp "$SCRIPT_DIR/context.md" "$HOME/.kirocontext"

echo ""
echo "✅ Listo! Kiro leerá el contexto automáticamente"
echo "📁 Sesiones: $SESSIONS_DIR"
echo "📄 Contexto: $HOME/.kirocontext"
