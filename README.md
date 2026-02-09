# Kiro Config

Configuración personal de Kiro CLI con contexto global y preferencias de desarrollo.

## Prerequisitos

Instalar Kiro CLI:

```bash
curl -fsSL https://cli.kiro.dev/install | bash
```

## Instalación

### Opción 1: Instalación rápida

```bash
curl -sSL https://raw.githubusercontent.com/deamaya44/kiro-config/main/install.sh | bash
```

### Opción 2: Instalación manual

```bash
git clone https://github.com/deamaya44/kiro-config.git
cd kiro-config
./install.sh
```

## Qué incluye

- **Contexto global**: Preferencias y patrones de trabajo automáticamente cargados
- **Configuración de agente**: Agente por defecto con herramientas preconfiguradas
- **Directorio de sesiones**: Organización automática en `~/kiro/sessions/`

## Estructura

```
.
├── context.md      # Contexto global con preferencias
├── install.sh      # Script de instalación
└── .kiro/          # Configuración de Kiro
```

## Contexto incluido

- Preferencias de Git (rama `main`)
- Mejores prácticas de seguridad
- Patrones de Terraform (locals, módulos, workspaces)
- Repositorio de módulos AWS

## Personalización

Edita `context.md` con tus propias preferencias antes de instalar, o modifica directamente `~/.kiro/context.md` después de la instalación.
