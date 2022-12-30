# Using Node 19 base image
FROM node:19-alpine

# Set the working directory to /app inside the container
WORKDIR /app

# Copy the depedencies files to the current directory
COPY package.json package-lock.json ./

# Install dependencies (npm ci makes sure the exact versions gets installed package-lock.json) (clean install)
RUN npm ci

# Adding the application in app folder after installing all the depedencies
COPY . .

# Exposing the port 3000
EXPOSE 3000

# Start the application
CMD ["npm", "start"]