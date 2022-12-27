# Using Node 19 base image
FROM node:19-alpine

# Set the working directory to /app inside the container
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH (easier to run scripts and executables in the application)
ENV PATH /app/node_modules/.bin:$PATH

# Copy the depedencies files
COPY package.json .
COPY package-lock.json .

# Install dependencies (npm ci makes sure the exact versions in the lockfile gets installed)
RUN npm ci

# Adding the application in app folder
COPY . .

# Exposing the port 3000
EXPOSE 3000

# Starting the application
CMD ["npm", "start"]
