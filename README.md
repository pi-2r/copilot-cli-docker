# GitHub Copilot CLI Dockerized

Ce projet fournit une encapsulation Docker légère et sécurisée pour **GitHub Copilot CLI**, vous permettant de l'utiliser nativement dans votre terminal sans avoir à installer Node.js ou ses dépendances sur votre machine hôte.

Cette approche s'inspire de [gemini-cli-docker-plus](https://github.com/pi-2r/gemini-cli-docker-plus).

## Fonctionnalités
- Image minimale basée sur `debian:bookworm-slim` multi-étapes.
- Résout le problème des permissions de fichiers montés (via `gosu`).
- Configuration persistante de l'authentification (sessions prolongées).
- Execution transparente via un simple alias Bash.

## 🛠️ Installation & Initialisation

### 1. Configurer l'alias Bash
Ajoutez le code suivant à la fin de votre fichier `~/.bashrc` ou `~/.bash_aliases` pour rendre la commande `copilot` universelle :

```bash
# GitHub Copilot CLI via Docker
copilot() {
    docker run -it --rm \
        -e HOST_UID=$(id -u) \
        -e HOST_GID=$(id -g) \
        -v "$(pwd)":/workspace \
        -w /workspace \
        -v "$HOME/.config/github-copilot":/home/copilot/.config/github-copilot \
        -v "$HOME/.copilot":/home/copilot/.copilot \
        -v "$HOME/.gitconfig":/home/copilot/.gitconfig:ro \
        -e GH_TOKEN="${GH_TOKEN:-}" \
        -e GITHUB_TOKEN="${GITHUB_TOKEN:-}" \
        pi-2r/copilot-cli:latest "$@"
}
```

Rechargez ensuite votre configuration :
```bash
source ~/.bashrc
```

### 2. Authentification
Une fois l'alias configuré, exécutez simplement la commande `copilot` (sans arguments ou avec `/login`) pour vous connecter. La configuration sera sauvegardée localement dans votre répertoire `~/.config/github-copilot` grâce aux volumes Docker.

```bash
copilot /login
```

Ensuite, vous pouvez utiliser `copilot` comme si l'outil était installé nativement sur votre machine !
```bash
copilot "Explique comment utiliser docker-compose"
```
