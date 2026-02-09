#!/bin/bash

set -e

echo "🚀 Configurando Kiro..."

KIRO_CONFIG_DIR="$HOME/.kiro"
SESSIONS_DIR="$HOME/kiro/sessions"

mkdir -p "$KIRO_CONFIG_DIR"
mkdir -p "$SESSIONS_DIR"

echo "📝 Copiando contexto global..."
cp "$(dirname "$0")/context.md" "$KIRO_CONFIG_DIR/context.md"

echo "✅ Configuración completada!"
echo "📁 Directorio de sesiones: $SESSIONS_DIR"
echo "📄 Contexto global: $KIRO_CONFIG_DIR/context.md"
