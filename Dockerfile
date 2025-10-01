# === Stage 1: Build dependencies ===
FROM node:20 AS build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY backend/package*.json ./

# Install dependencies
RUN npm install

# Copy backend source code
COPY backend ./backend

# === Stage 2: Production image ===
FROM node:20-slim

# Set working directory
WORKDIR /app

# Copy dependencies from build stage
COPY --from=build /app/node_modules ./node_modules

# Copy backend source code
COPY --from=build /app/backend ./backend

# Expose port your app runs on (adjust if needed)
EXPOSE 3000

# Start the backend server
CMD ["node", "backend/server.js"]
# === Step 1: Base Image ===
FROM node:20

# === Step 2: Set working directory ===
WORKDIR /app

# === Step 3: Copy package.json and package-lock.json if they exist ===
COPY backend/package*.json ./backend/ 2>/dev/null || echo "No package.json found, skipping npm install"

# === Step 4: Install dependencies only if package.json exists ===
RUN if [ -f ./backend/package.json ]; then \
        echo "Installing backend dependencies..." && \
        npm install --prefix ./backend; \
    else \
        echo "No package.json found, skipping npm install"; \
    fi

# === Step 5: Copy backend code only if folder exists ===
COPY backend ./backend 2>/dev/null || echo "No backend folder found, skipping copy"

# === Step 6: Expose backend port if needed ===
EXPOSE 3000

# === Step 7: Start the backend server if server.js exists ===
CMD if [ -f ./backend/server.js ]; then \
        echo "Starting backend server..." && \
        node ./backend/server.js; \
    else \
        echo "No server.js found, container will exit" && \
        tail -f /dev/null; \
    fi
RUN if [ -f ./backend/package.json ]; then \
        npm install --prefix ./backend; \
    else \
        echo 'No backend found, skipping npm install'; \
    fi
# === Step 1: Base image ===
FROM node:20

# === Step 2: Set working directory ===
WORKDIR /app

# === Step 3: Copy package.json and install dependencies ===
COPY backend/package*.json ./
RUN npm install

# === Step 4: Copy backend code ===
COPY backend ./backend

# === Step 5: Expose port ===
EXPOSE 3000

# === Step 6: Start the backend server ===
CMD ["node", "backend/server.js"]
# Copy package files first
COPY backend/package*.json ./

# Install only production dependencies
RUN npm install --only=production

# Copy all backend filesWORKDIR /app
COPY backend/package*.json ./
RUN npm install --only=production

COPY backend/ ./
COPY backend/package*.json ./
RUN npm install --only=production
# ProofPoint Dockerfile

# Use Node 18 LTS as base
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first (if exists)
COPY backend/package*.json ./

# Install production dependencies only
RUN npm install --omit=dev

# Copy all backend files into container
COPY backend/ ./

# Expose the app port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
WORKDIR /app
COPY backend/package*.json ./
RUN npm install --omit=dev
# Copy the rest of your backend files here
COPY backend/ ./
# Use Node 18 LTS
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json if exists
COPY backend/package.json ./

# Install dependencies (production only)
RUN npm install --omit=dev

# Copy all backend files into container
COPY backend/ ./

# Expose app port
EXPOSE 3000

# Start the app
CMD ["node", "index.js"]
# Use Node 18 LTS
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json if exists
COPY backend/package.json ./

# Install dependencies (production only)
RUN npm install --omit=dev

# Copy all backend files into container
COPY backend/ ./

# Expose app port
EXPOSE 3000

# Start the app
CMD ["node", "index.js"]
# Use Node.js 18 alpine image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY backend/package*.json ./
RUN npm install --omit=dev

# Copy all backend files
COPY backend/ ./

# Expose app port
EXPOSE 3000

# Start the server
CMD ["node", "index.js"]
COPY backend/package*.json ./
COPY backend/ ./
