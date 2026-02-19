# Contexto Global de Kiro

## Directorio de Sesiones
- Guardar todas las sesiones en: `$HOME/kiro-sessions/sessions/`
- **Sincronizar con Git después de guardar:**
  ```bash
  cd ~/kiro-sessions && git add sessions/ && git commit -m "Update session: $(date +%Y-%m-%d)" && git push
  ```
- Leer sesiones previas de ese directorio cuando sea relevante
- Repo privado: `git@github.com:deamaya44/kiro-sessions.git`

## Preferencias
- No usar Docker para servidores MCP (usar npx/uvx en su lugar)
- Docker está disponible para otros usos normales

## Git
- Usar siempre rama `main` (nunca `master`)
- **Usar SSH para todos los repos** (no HTTPS)
  - Formato: `git@github.com:usuario/repo.git`
  - Para clonar: `git clone git@github.com:usuario/repo.git`
  - Para módulos de Terraform: `git::https://github.com/usuario/repo.git//path?ref=main`

## Seguridad
- SIEMPRE revisar archivos antes de hacer push a CUALQUIER repositorio
- NUNCA publicar credenciales, tokens, API keys, contraseñas o información sensible
- **NO usar archivos .env** para secretos
- Usar **vaults de secretos en la nube** (AWS Secrets Manager, Parameter Store, etc.)
- Exportar variables de entorno directamente en el sistema cuando sea necesario
- Recomendar al usuario las mejores prácticas de seguridad

## Terraform - Estilo y Estructura

### Filosofía
- **NO usar `.tfvars`** - toda la configuración en `locals.tf`
- **Variables solo en módulos** - root modules usan locals
- **`for_each` con locals** para múltiples recursos
- **Interpolación con `terraform.workspace`** para multi-ambiente
- **`common_tags` en locals** y reutilizar con `merge()`

### Estructura de Archivos
```
proyecto/
├── main.tf          # Llamadas a módulos
├── locals.tf        # Toda la configuración
├── providers.tf     # Providers
├── data.tf          # Data sources (opcional)
└── outputs.tf       # Outputs (opcional)
```

### Módulos
- Usar desde GitHub con HTTPS: `git::https://github.com/deamaya44/aws_modules.git//modules/nombre?ref=main`
- Siempre especificar `?ref=main`
- Usar `try()` para valores opcionales

### Repositorios de Referencia
- Módulos: https://github.com/deamaya44/aws_modules
