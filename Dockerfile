# Use the official Node.js image from Docker Hub
FROM node:16-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json (if you have it) to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose the port that your application will run on
EXPOSE 8080

# Define the command to run your app
CMD ["node", "index.js"]
