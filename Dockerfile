# === Step 1: Base Image ===
FROM node:20

# === Step 2: Set working directory ===
WORKDIR /app

# === Step 3: Copy backend package files and install dependencies ===
COPY backend/package*.json ./
RUN npm install

# === Step 4: Copy backend code ===
COPY backend ./backend

# === Step 5: Expose port ===
EXPOSE 8080

# === Step 6: Start the backend server ===
CMD ["node", "backend/server.js"]

# === Step 1: Base Image ===
FROM node:20

# === Step 2: Working directory ===
WORKDIR /app

# === Step 3: Copy package.json and install dependencies ===
COPY backend/package*.json ./
RUN npm install

# === Step 4: Copy backend code ===
COPY backend ./backend

# === Step 5: Expose port ===
EXPOSE 8080

# === Step 6: Start the backend server ===
CMD ["node", "backend/server.js"]
