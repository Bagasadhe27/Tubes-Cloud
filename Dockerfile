# Use Node.js base image
FROM node:18

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if present)
COPY package.json package-lock.json ./

# Install the required dependencies
RUN npm install --global expo-cli
RUN npm install --force

# Copy the rest of the application code
COPY . .

# Expose port 19000 for Expo
EXPOSE 19000

# Expose ports for Expo debugging (optional)
EXPOSE 19001 19002

# Start the Expo server
CMD ["npm", "start"]