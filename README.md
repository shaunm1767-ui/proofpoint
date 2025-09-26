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

# 📲 ProofPoint

ProofPoint is a mobile + web solution for **tracking and verifying ownership of electronic goods** via serial numbers. It lets users upload invoices, back up proof of purchase, and report stolen items. Anyone can check legitimacy of devices through the ProofPoint platform.

---

## 🚀 Getting Started

### Prerequisites
Make sure you have installed:
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- Git
- Node.js (if running locally outside Docker)

---

### 🐳 Run with Docker

1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/proofpoint.git
   cd proofpoint
# 📲 ProofPoint

ProofPoint is a mobile + web solution for **tracking and verifying ownership of electronic goods** via serial numbers. It lets users upload invoices, back up proof of purchase, and report stolen items. Anyone can check legitimacy of devices through the ProofPoint platform.

---

## 🚀 Getting Started

### Prerequisites
Make sure you have installed:
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- Git
- Node.js (if running locally outside Docker)

---

### 🐳 Run with Docker

1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/proofpoint.git
   cd proofpoint
docker build -t proofpoint .
docker run -p 8080:8080 proofpoint
npm install
npm start
proofpoint/
│── backend/        # API services
│── frontend/       # React app
│── Dockerfile      # Docker build instructions
│── README.md       # Project documentation
nano README.md
