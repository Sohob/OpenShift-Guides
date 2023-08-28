# Nginx official image
FROM nginx:1.17
# Use a custom configuration 
COPY nginx.conf /etc/nginx/nginx.conf
# Create our workspace and move the build into it
WORKDIR /code
COPY /code .
# Expose the port
EXPOSE 8080:8080
# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]