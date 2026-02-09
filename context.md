# Contexto Global de Kiro

## Directorio de Sesiones
- Guardar todas las sesiones en: `$HOME/kiro/sessions/`
- Leer sesiones previas de ese directorio cuando sea relevante

## Preferencias
- No usar Docker para servidores MCP (usar npx/uvx en su lugar)
- Docker está disponible para otros usos normales

## Git
- Usar siempre rama `main` (nunca `master`)

## Seguridad
- SIEMPRE revisar archivos antes de hacer push a CUALQUIER repositorio
- NUNCA publicar credenciales, tokens, API keys, contraseñas o información sensible
- Recomendar al usuario las mejores prácticas de seguridad
- Usar variables de entorno o archivos .env (en .gitignore) para credenciales
