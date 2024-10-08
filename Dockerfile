# Use an official Node.js runtime as a parent image
FROM node:20.16.0-alpine

# Set working directory
WORKDIR /app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Set build-time arguments
ARG JWT_SECRET
ARG JWT_ACCESS_SECRET
ARG JWT_REFRESH_SECRET
ARG DB_USER
ARG DB_PASS
ARG DB_NAME
ARG DB_PORT
ARG DB_HOST

# Pass the build-time arguments as environment variables
ENV JWT_SECRET=${JWT_SECRET}
ENV JWT_ACCESS_SECRET=${JWT_ACCESS_SECRET}
ENV JWT_REFRESH_SECRET=${JWT_REFRESH_SECRET}
ENV POSTGRES_DB=${DB_NAME}
ENV POSTGRES_USER=${DB_USER}
ENV POSTGRES_PASSWORD=${DB_PASS}
ENV POSTGRES_PORT=${DB_PORT}
ENV POSTGRES_HOST=${DB_HOST}

# Build the application (assuming you have a build script in package.json)
RUN npm run build --verbose

# Expose the port the app runs on
EXPOSE 3000

# Start the Node.js app
CMD ["npm", "start"]