# Kiro Config

> 🚀 Configuración personal de Kiro CLI con contexto global, sincronización de sesiones y mejores prácticas.

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
git clone git@github.com:deamaya44/kiro-config.git
cd kiro-config
./install.sh
```

## 🎯 Qué incluye

- **Contexto global**: Preferencias y patrones de trabajo cargados automáticamente
- **Sesiones sincronizadas**: Repositorio privado para compartir sesiones entre dispositivos
- **Agente configurado**: Herramientas preconfiguradas (AWS, Git, Terraform, búsqueda web)
- **Mejores prácticas**: Seguridad, Git, Terraform y más

## 📁 Estructura

```
~/.kiro/
├── context.md           # Contexto global
└── settings/
    └── context.json     # Configuración de contextos

~/kiro-sessions/         # Repo privado sincronizado
└── sessions/
    ├── 2026-02-19-session-name.md
    └── ...
```

## 🔄 Sincronización de Sesiones

Las sesiones se guardan automáticamente en `~/kiro-sessions/sessions/` y se sincronizan con GitHub.

### Sincronizar manualmente

```bash
# Descargar sesiones de otros dispositivos
cd ~/kiro-sessions && git pull

# Subir nuevas sesiones
cd ~/kiro-sessions
git add sessions/
git commit -m "Update sessions $(date +%Y-%m-%d)"
git push
```

### Configurar en nuevo dispositivo

```bash
# 1. Instalar Kiro CLI
curl -fsSL https://cli.kiro.dev/install | bash

# 2. Configurar SSH para GitHub
ssh-keygen -t rsa -b 4096 -C "tu@email.com"
gh ssh-key add ~/.ssh/id_rsa.pub

# 3. Instalar configuración
curl -sSL https://raw.githubusercontent.com/deamaya44/kiro-config/main/install.sh | bash
```

## 🔧 Contexto incluido

### Git
- Usar siempre rama `main` (nunca `master`)
- SSH para todos los repos: `git@github.com:usuario/repo.git`

### Seguridad
- NO usar archivos `.env` para secretos
- Usar vaults en la nube (AWS Secrets Manager, Parameter Store)
- Revisar archivos antes de hacer push

### Terraform
- NO usar `.tfvars` - toda configuración en `locals.tf`
- Variables solo en módulos reutilizables
- `for_each` con locals para múltiples recursos
- Módulos desde GitHub: `git::https://github.com/deamaya44/aws_modules.git//modules/nombre?ref=main`

## ✏️ Personalización

Editar contexto después de instalar:

```bash
nano ~/.kiro/context.md
```

## 🔄 Actualizar configuración

```bash
cd ~/kiro-config  # Si clonaste manualmente
git pull
./install.sh
```

## 💡 Consejos de uso

### Guardar sesiones

```
guarda esta sesión con nombre: migracion-vm-python
```

### Recuperar sesiones

```
recupera la sesión de migracion-vm-python
```

## 📚 Recursos

- [Kiro CLI Docs](https://kiro.dev/cli/)
- [Módulos AWS](https://github.com/deamaya44/aws_modules)
- [Sesiones privadas](https://github.com/deamaya44/kiro-sessions) (requiere acceso)

## 📝 Licencia

MIT - Ver [LICENSE](LICENSE) para más detalles.
