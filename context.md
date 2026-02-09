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
- **NO usar archivos .env** para secretos
- Usar **vaults de secretos en la nube** (AWS Secrets Manager, Parameter Store, etc.)
- Exportar variables de entorno directamente en el sistema cuando sea necesario
- Recomendar al usuario las mejores prácticas de seguridad
