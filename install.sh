#!/bin/bash

set -e

echo "🚀 Configurando Kiro..."

KIRO_CONFIG_DIR="$HOME/.kiro"
mkdir -p "$KIRO_CONFIG_DIR"

SESSIONS_DIR="$HOME/kiro/sessions"
mkdir -p "$SESSIONS_DIR"

echo "📝 Configurando contexto global..."
curl -sSL https://raw.githubusercontent.com/TU_USUARIO/kiro-config/main/context.md -o "$KIRO_CONFIG_DIR/context.md"

echo "✅ Configuración completada!"
echo "📁 Directorio de sesiones: $SESSIONS_DIR"
echo "📄 Contexto global: $KIRO_CONFIG_DIR/context.md"
