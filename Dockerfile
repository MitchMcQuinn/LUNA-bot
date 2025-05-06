FROM node:18-slim

WORKDIR /app

# Copy package files for optimized layer caching
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy app source
COPY . .

# Set environment variables
ENV NODE_ENV=production

# Start the bot
CMD ["node", "index.js"]
