#!/bin/bash

set -e

echo "🚀 Configurando Kiro..."

KIRO_CONTEXT_DIR="$HOME/.kiro/context"
SESSIONS_DIR="$HOME/kiro/sessions"
SCRIPT_DIR="$(dirname "$0")"

mkdir -p "$KIRO_CONTEXT_DIR"
mkdir -p "$SESSIONS_DIR"

echo "📝 Copiando contexto global..."
cp "$SCRIPT_DIR/context.md" "$KIRO_CONTEXT_DIR/context.md"

echo ""
echo "✅ Listo! Kiro leerá el contexto automáticamente"
echo "📁 Sesiones: $SESSIONS_DIR"
echo "📄 Contexto: $KIRO_CONTEXT_DIR/context.md"
