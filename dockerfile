# Use Node.js 14 as the base image
FROM node:latest

# Set the working directory
WORKDIR /app

# Install create-react-app globally
#RUN npm install -g create-react-app

# port 3000 for create-react-app and 8080 for the node server
EXPOSE 3000
EXPOSE 8080
EXPOSE 3306

# Run the app
CMD ["/bin/bash"]
