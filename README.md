# ProofPoint Docker Setup

This repository contains the Docker setup for **ProofPoint**, your secure device ownership and verification app.

---

## **1. Build the Docker Image**

Open your terminal in the project root (where the Dockerfile is located) and run:

```bash
docker build -t proofpoint-app .
docker run -p 8080:8080 proofpoint-app
docker ps
curl http://localhost:8080/health
docker stop <container_id>
docker rm <container_id>
docker system prune -a
docker logs <container_id>
ProofPoint/
│
├── backend/          # Server-side code
├── frontend/         # Front-end code
├── Dockerfile        # Docker instructions
├── README.md         # This file
└── .dockerignore     # Ignore files for Docker build

---

