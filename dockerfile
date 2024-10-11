# Stage 1: Build the application
FROM node:18-alpine as build

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm run build

# Stage 2: Serve the application
FROM nginx:stable-alpine

# Copy the built React app from the build stage to Nginx's HTML folder
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 for the app to be accessible
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
