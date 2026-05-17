# Contexto Global de Kiro

## Directorio de Sesiones
- Guardar todas las sesiones en: `$HOME/kiro-sessions/sessions/`
- **Formato de nombres:** `YYYY-MM-DD-nombre-descriptivo.md` (ejemplo: `2026-03-09-cloudflare-pages-cka-repo.md`)
- **Informes largos/técnicos:** Guardar en `$HOME/kiro-sessions/informes/` con el mismo formato de fecha
- **Sincronizar con Git después de guardar:**
  ```bash
  cd ~/kiro-sessions && git add . && git commit -m "Update session: $(date +%Y-%m-%d)" && git push
  ```
- Leer sesiones previas de ese directorio cuando sea relevante
- Repo privado: `git@github.com:deamaya44/kiro-sessions.git`

## Estilo de Comunicación
- **Tono técnico profesional** - sin emojis, directo al punto
- **Lenguaje senior dev** - conciso, sin explicaciones obvias
- **Documentación limpia** - formato técnico, no tutorial
- **Sin mencionar "Kiro"** en informes o documentación generada
- Respuestas directas sin frases de relleno

## Cambios en Infraestructura
- **SIEMPRE CONSULTAR** antes de cambiar tipos de instancia, nombres, configuraciones críticas
- **REVISAR SESIONES PREVIAS** en kiro-sessions para entender configuraciones existentes
- **MANTENER CONSISTENCIA** con configuraciones documentadas en sesiones anteriores
- **NO ASUMIR** - preguntar antes de modificar recursos existentes

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

## Documentación
- Sin emojis en archivos técnicos
- Formato profesional y directo
- Hipervínculos completos en READMEs
- Estructura consistente entre módulos
- Nunca mencionar "Kiro" en documentación generada

## Estándares para Generación de Informes Técnicos

### Referencia
- Sesión modelo: `$HOME/kiro-sessions/sessions/2026-04-17-sgdea-kong-uat-homologacion.md`
- Informe modelo HTML: `~/Documents/linktic/positiva/sgdea/informe-homologacion-uat-completo-2026-04-18.html`
- PDF modelo: `~/Documents/linktic/positiva/sgdea/informe-homologacion-uat-2026-04-18.pdf`

### Antes de generar un informe, preguntar siempre
1. **Nombre de la empresa cliente** — buscar en internet si no se conoce el nombre legal (ej: "3T Capital" → nombre legal: "Tres T Capital S.A.S." en https://3tcapital.co)
2. **Logo de la empresa** — descargar del sitio web oficial para el encabezado
3. **Destinatario / área** — para el pie de página y portada

### Formato del informe (HTML → PDF)
- **Tipografía:** Times New Roman, 12pt cuerpo, justificado
- **Estructura:** Portada → Tabla de contenido → Secciones numeradas
- **Portada:** Sin encabezado ni pie de página
- **Tabla de contenido:** Sin encabezado ni pie de página
- **Secciones 1 en adelante:** Encabezado con logo (izquierda) + título informe (derecha) + pie con empresa y número de página
- **Tablas:** `table-layout: fixed`, `font-size: 9.5pt`, `word-wrap: break-word`, `thead` repetido en cada página
- **Colores:** Blanco y negro — encabezados de tabla fondo negro, texto blanco
- **Saltos de página:** `break-before: page` en cada sección principal (h2)
- **Orientación:** Portrait por defecto. Landscape solo si el usuario lo solicita explícitamente para una sección específica

### Generación del PDF
- Herramienta: **WeasyPrint** (soporta CSS Paged Media — `@page`, `counter(page)`, `counter(pages)`)
- NO usar Chrome headless (no soporta CSS Paged Media completo)
- Entorno virtual: `/tmp/weasy_env/bin/python3`
- Dependencias macOS: `DYLD_LIBRARY_PATH="/opt/homebrew/lib"`
- Comando:
  ```bash
  DYLD_LIBRARY_PATH="/opt/homebrew/lib" /tmp/weasy_env/bin/python3 -c "
  import weasyprint, warnings; warnings.filterwarnings('ignore')
  weasyprint.HTML(filename='ruta/informe.html').write_pdf('ruta/informe.pdf')
  "
  ```
- Verificar páginas y orientación antes de entregar:
  ```python
  doc = weasyprint.HTML(filename='...').render()
  for i, page in enumerate(doc.pages, 1):
      print(i, 'landscape' if page.width > page.height else 'portrait')
  ```

### Guardar informes
- HTML fuente: `~/Documents/linktic/<cliente>/<proyecto>/informe-<descripcion>-YYYY-MM-DD.html`
- PDF final: misma ruta con extensión `.pdf`
- Referenciar en la sesión correspondiente de kiro-sessions

## Diagramas de Infraestructura (D2)

### Herramienta
- **D2** (d2lang.com) — diagram-as-code, open source
- Ejecutar siempre con **Docker**: `terrastruct/d2`
- NO instalar con brew

### Comando base
```bash
docker run --rm -v $(pwd)/diagrams:/work terrastruct/d2 --layout=elk --theme=0 --pad=40 /work/archivo.d2 /work/archivo.svg
```

### Post-procesamiento del SVG (para visualización en browser)
Solo modificar la **línea 1** (tag `<svg>` raíz), nunca los elementos internos:
```bash
sed -i '' '1s/preserveAspectRatio="[^"]*"/preserveAspectRatio="xMidYMid meet"/' archivo.svg
sed -i '' '1s/width="[0-9.]*"/width="100%"/' archivo.svg
sed -i '' '1s/height="[0-9.]*"/height="100vh"/' archivo.svg
```

### Configuración
- **Layout engine:** `elk` (mejor auto-layout, sin overlap)
- **Tema:** `0` (Neutral Default) para fondo blanco con buen contraste
- **Dirección:** `direction: right` (horizontal, se ve mejor)
- **NO usar colores custom** (`style.fill`) — dejar que el tema maneje los colores para garantizar legibilidad
- **Padding:** `--pad=40`

### Temas disponibles (referencia)
- `0` — Neutral Default (preferido, fondo blanco, texto legible)
- `3` — Flagship Terrastruct
- `4` — Cool Classics
- `8` — Colorblind Clear
- `200` — Dark Mauve (solo si se necesita tema oscuro)

### Buenas prácticas
- Usar `shape: person` para usuarios, `shape: cloud` para redes/mesh
- Agrupar con containers anidados (namespaces, clusters, redes)
- Labels descriptivos con `\n` para multi-línea
- Conexiones con labels que indiquen protocolo/puerto
- Guardar `.d2` en `diagrams/` dentro del proyecto
- El `.d2` es versionable en git, el `.svg` se regenera

### Estructura de archivos
```
proyecto/
└── diagrams/
    ├── infra.d2      # Fuente
    └── infra.svg     # Generado (puede ir en .gitignore)
```
