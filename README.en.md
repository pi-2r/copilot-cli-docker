# GitHub Copilot CLI Dockerized

This project provides a lightweight and secure Docker wrapper for **GitHub Copilot CLI**, allowing you to use it natively in your terminal without installing Node.js or its dependencies on your host machine.

This approach is heavily inspired by [gemini-cli-docker-plus](https://github.com/pi-2r/gemini-cli-docker-plus).

## Features
- Minimal image based on a multi-stage `debian:bookworm-slim`.
- Solves mounted file permission issues (via `gosu`).
- Persistent authentication configuration (extended sessions).
- Seamless execution via a simple Bash alias.

## 🛠️ Installation & Setup

### 1. Configure the Bash alias
Add the following code to the end of your `~/.bashrc` or `~/.bash_aliases` file to make the `copilot` command available everywhere:

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

Then reload your configuration:
```bash
source ~/.bashrc
```

### 2. Authentication
Once the alias is configured, simply run the `copilot` command (without arguments or with `/login`) to log in. The configuration will be saved locally in your `~/.config/github-copilot` directory using Docker volumes.

```bash
copilot /login
```

Then you can use `copilot` exactly as if the tool was installed natively on your machine!
```bash
copilot "Explain how to use docker-compose"
```
