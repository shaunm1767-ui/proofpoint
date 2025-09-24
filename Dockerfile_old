# ProofPoint Dockerfile

# Use Node 18 LTS
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY backend/package*.json ./
RUN npm install --only=production

# Copy all backend files
COPY backend/ ./

# Expose app port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
# ProofPoint Dockerfile

FROM node:18-alpine

WORKDIR /app

COPY backend/package*.json ./
RUN npm install --only=production

COPY backend/ ./

EXPOSE 3000

CMD ["npm", "start"]
FROM node:18-alpine

WORKDIR /app

# Copy package files first to speed up rebuilds
COPY backend/package*.json ./

RUN npm install --only=production

# Copy all backend files
COPY backend/ ./

EXPOSE 3000

CMD ["npm", "start"]
# ProofPoint Dockerfile
FROM node:18-alpine

WORKDIR /app

# Copy package files first
COPY backend/package*.json ./

# Install production dependencies
RUN npm install --only=production

# Copy all backend files
COPY backend/ ./

# Expose the port your app uses
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
# ProofPoint Dockerfile
FROM node:18-alpine

WORKDIR /app

# Copy package files first
COPY backend/package*.json ./

# Install production dependencies
RUN npm install --only=production

# Copy all backend files
COPY backend/ ./

# Expose the port your app uses
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
# ProofPoint Dockerfile
FROM node:18-alpine

WORKDIR /app

# Copy package files first
COPY backend/package*.json ./

# Install production dependencies
RUN npm install --only=production

# Copy all backend files
COPY backend/ ./

# Expose the port your app uses
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
# ProofPoint Dockerfile
FROM node:18-alpine

WORKDIR /app

# Copy package files first
COPY backend/package*.json ./

# Install production dependencies
RUN npm install --only=production

# Copy all backend files
COPY backend/ ./

# Expose the port your app uses
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
