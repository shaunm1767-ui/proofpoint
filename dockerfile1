# === Step 1: Base Image ===
FROM node:20

# Set working directory
WORKDIR /app

# === Step 2: Copy and install backend dependencies ===
COPY backend/package*.json ./backend/
RUN cd backend && npm install

# === Step 3: Copy backend and frontend code ===
COPY backend/ ./backend
COPY frontend/ ./frontend

# === Step 4: Expose app port ===
EXPOSE 8080

# === Step 5: Environment variables for PostgreSQL ===
ENV PGHOST=postgres
ENV PGUSER=proofpoint
ENV PGPASSWORD=proofpointpass
ENV PGDATABASE=proofpoint_db
ENV PGPORT=5432

# === Step 6: Start the backend server ===
CMD ["node", "backend/server.js"]
version: "3.9"
services:
  postgres:
    image: postgres:15
    container_name: proofpoint-postgres
    restart: always
    environment:
      POSTGRES_USER: proofpoint
      POSTGRES_PASSWORD: proofpointpass
      POSTGRES_DB: proofpoint_db
    ports:
      - "5432:5432"
    volumes:
      - pgdata:/var/lib/postgresql/data

  proofpoint-app:
    build: .
    container_name: proofpoint-app
    ports:
      - "8080:8080"
    depends_on:
      - postgres
    environment:
      PGHOST: postgres
      PGUSER: proofpoint
      PGPASSWORD: proofpointpass
      PGDATABASE: proofpoint_db
      PGPORT: 5432

volumes:
  pgdata:
docker build -t proofpoint-app .
docker run -p 8080:8080 proofpoint-app
docker-compose up --build
