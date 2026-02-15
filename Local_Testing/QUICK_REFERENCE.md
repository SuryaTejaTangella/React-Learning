# Self-Hosted Runner Quick Reference

## 🚀 Quick Start (3 Steps)

### Step 1: Get Runner Token

```
GitHub Repo → Settings → Actions → Runners → New self-hosted runner
→ Select: Linux, x64 → Copy token
```

### Step 2: Run Setup Script

```powershell
# Windows PowerShell
.\setup-runner.ps1
```

```bash
# Mac/Linux
./setup-runner.sh
```

### Step 3: Push Code and Watch Pipeline

```bash
git add .
git commit -m "trigger pipeline"
git push origin main
```

---

## 📊 Verify Setup

**Check if runner is online:**

```
GitHub Repo → Settings → Actions → Runners
```

Look for green dot with "Idle" status

**View runner logs:**

```bash
docker-compose logs -f github-runner
```

**Check deployed app:**

```
http://localhost:3000
```

---

## 📁 Files Created

| File                   | Purpose                              |
| ---------------------- | ------------------------------------ |
| `runner.Dockerfile`    | GitHub Actions runner image          |
| `runner-entrypoint.sh` | Runner initialization script         |
| `setup-runner.sh`      | Setup script (Unix)                  |
| `setup-runner.ps1`     | Setup script (Windows)               |
| `docker-compose.yml`   | Multi-container orchestration        |
| `.env`                 | Secrets (auto-created, don't commit) |

---

## 🔄 CI/CD Pipeline Flow

```
Push to main
    ↓
Workflow triggers on self-hosted runner
    ↓
Job 1: Quality Check (ESLint)
    ↓
Job 2: Build & Push
    ├─ Build Docker image locally
    └─ Push to Docker Hub
    ↓
Job 3: Deploy
    ├─ Pull image from Docker Hub
    ├─ Stop old container
    ├─ Run new container (port 3000)
    └─ App live at http://localhost:3000
```

---

## ⚡ Common Commands

```bash
# Start services
docker-compose up -d

# View logs
docker-compose logs -f github-runner
docker-compose logs -f react-app

# Stop all services
docker-compose down

# Restart runner
docker-compose restart github-runner

# View running containers
docker ps

# Check app logs
docker logs -f react-app-prod

# Stop app
docker stop react-app-prod

# Remove app
docker rm react-app-prod
```

---

## 🐛 Troubleshooting

| Problem                  | Solution                                                          |
| ------------------------ | ----------------------------------------------------------------- |
| Runner won't connect     | Check RUNNER_TOKEN in .env is correct                             |
| Build fails              | View logs: `docker-compose logs github-runner`                    |
| Port 3000 in use         | Change port in workflow or kill app: `docker stop react-app-prod` |
| Docker permission error  | Ensure `/var/run/docker.sock` is mounted                          |
| Can't push to Docker Hub | Verify DOCKER_USERNAME & DOCKER_PASSWORD in GitHub secrets        |

---

## 🎓 What You're Learning

- ✅ GitHub Actions Workflows
- ✅ Self-Hosted Runners
- ✅ Docker-in-Docker (DinD)
- ✅ CI/CD Pipelines
- ✅ Automated Deployments
- ✅ Docker Compose
- ✅ Container Networking
- ✅ DevOps Best Practices

---

## 📚 References

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Self-Hosted Runners](https://docs.github.com/en/actions/hosting-your-own-runners)
- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
