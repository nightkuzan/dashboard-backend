FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json yarn.lock ./

# Install dependencies
RUN yarn install --production --frozen-lockfile

# Copy source code
COPY . .

# Create uploads directory
RUN mkdir -p public/uploads

# Build the application
ENV NODE_ENV=production
RUN yarn build

# Expose port
EXPOSE 1337

# Start the application
CMD ["yarn", "start"]
