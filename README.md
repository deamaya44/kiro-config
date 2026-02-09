# Kiro Config

> 🚀 Configuración personal de Kiro CLI con contexto global, preferencias de desarrollo y mejores prácticas.

## 📋 Prerequisitos

Instalar Kiro CLI:

```bash
curl -fsSL https://cli.kiro.dev/install | bash
```

## ⚡ Instalación

### Opción 1: Instalación rápida (recomendada)

```bash
curl -sSL https://raw.githubusercontent.com/deamaya44/kiro-config/main/install.sh | bash
```

### Opción 2: Instalación manual

```bash
git clone https://github.com/deamaya44/kiro-config.git
cd kiro-config
./install.sh
```

## 🎯 Qué incluye

- **Contexto global**: Preferencias y patrones de trabajo cargados automáticamente en cada sesión
- **Agente configurado**: Herramientas preconfiguradas (AWS, Git, Terraform, búsqueda web, etc.)
- **Sesiones organizadas**: Directorio automático en `~/kiro/sessions/`
- **Mejores prácticas**: Seguridad, Git, Terraform y más

## 📁 Estructura

```
.
├── context.md      # Contexto global con preferencias
├── install.sh      # Script de instalación automatizada
├── README.md       # Este archivo
└── .kiro/          # Configuración de Kiro CLI
    └── settings/
```

## 🔧 Contexto incluido

### Git
- Usar siempre rama `main` (nunca `master`)

### Seguridad
- NO usar archivos `.env` para secretos
- Usar vaults en la nube (AWS Secrets Manager, Parameter Store)
- Exportar variables de entorno directamente en el sistema

### Terraform
- NO usar `.tfvars` - toda configuración en `locals.tf`
- Variables solo en módulos reutilizables
- `for_each` con locals para múltiples recursos
- Interpolación con `terraform.workspace` para multi-ambiente
- Módulos desde GitHub: `git::https://github.com/deamaya44/aws_modules.git//modules/nombre?ref=main`

## ✏️ Personalización

### Editar contexto después de instalar

```bash
nano ~/.kiro/context.md
```

### Ejemplos de personalización

#### Agregar tu región AWS preferida

```markdown
## AWS
- Región por defecto: us-east-1
- Perfil: default
```

#### Definir convenciones de nombres

```markdown
## Convenciones de Nombres
- Archivos: snake_case
- Variables: camelCase
- Funciones: camelCase
- Clases: PascalCase
```

#### Agregar herramientas favoritas

```markdown
## Herramientas
- Editor: VSCode
- Linter: eslint / pylint
- Formatter: prettier / black
- Testing: jest / pytest
```

#### Configurar estructura de proyectos

```markdown
## Estructura de Proyectos
```bash
proyecto/
├── src/           # Código fuente
├── tests/         # Tests
├── docs/          # Documentación
└── infra/         # Infraestructura (Terraform)
```
```

#### Agregar comandos frecuentes

```markdown
## Comandos Frecuentes
- Deploy: `terraform apply -auto-approve`
- Test: `npm test` o `pytest`
- Lint: `npm run lint` o `pylint src/`
```

## 🔄 Actualizar configuración

```bash
cd ~/kiro-config  # Si clonaste manualmente
git pull
./install.sh
```

## 📚 Recursos

- [Kiro CLI Docs](https://cli.kiro.dev)
- [Módulos AWS](https://github.com/deamaya44/aws_modules)

## 📝 Licencia

MIT
