# Linux KDE Desktop

> A persistent, browser-accessible KDE Desktop environment powered by Docker and Dev Containers.

---

## Overview

This project provides a fully functional **KDE Desktop** running inside a Docker container, accessible directly through your web browser on **port 3000**. Designed for use with [GitHub Codespaces](https://github.com/features/codespaces) or any Dev Container-compatible environment.

The desktop persists across restarts — your files, settings, and installed apps are saved in a dedicated volume.

---

## Features

- Full KDE Desktop accessible in the browser (no VNC client needed)
- Persistent storage — your data survives container restarts
- App installer script — install and save apps with a single command
- Auto-restore — previously installed apps are reinstalled on startup
- Docker-in-Docker support via Dev Container features
- Timezone support (default: Asia/Kolkata)

---

## Getting Started

### Prerequisites

- [Docker](https://www.docker.com/) installed
- [VS Code](https://code.visualstudio.com/) with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers), **or** a GitHub Codespaces account

### 1. Open in Dev Container

```bash
git clone https://github.com/og-py3/linux-kde-desktop.git
cd linux-kde-desktop
code .
```

When prompted, click **"Reopen in Container"**. VS Code will build the image and start the environment automatically.

### 2. Access the Desktop

```
http://localhost:3000
```

---

## Project Structure

```
linux-kde-desktop/
├── .devcontainer/
│   └── devcontainer.json
├── scripts/
│   ├── start-desktop.sh
│   └── install-apps.sh
├── Dockerfile
└── README.md
```

---

## Scripts

### start-desktop.sh
Runs automatically on container start. Waits for Docker, creates or resumes the persistent desktop container, and reinstalls saved apps.

### install-apps.sh
Run inside the desktop terminal to install and persist an app:

```bash
bash /workspaces/linux/scripts/install-apps.sh firefox
```

---

## Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `PUID` | `1000` | User ID |
| `PGID` | `1000` | Group ID |
| `TZ` | `Asia/Kolkata` | Timezone |
| `TITLE` | `My Desktop` | Browser window title |

---

## Docker Image

Uses [LinuxServer.io Webtop](https://docs.linuxserver.io/images/docker-webtop/): `lscr.io/linuxserver/webtop:ubuntu-kde`

---

## License

MIT