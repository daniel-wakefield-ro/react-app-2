

# Use the official Node.js image as the base
FROM node:18

ENV CI=true
ENV WDS_SOCKET_PORT=0
# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm run build

CMD ["npm", "start"]
# Serve the app using a simple HTTP server
#RUN npm install -g serve
#CMD ["serve", "-s", "build", "-l", "3000"]



# Expose the port the app will run on
#EXPOSE 3000