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
