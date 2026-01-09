FROM nginx:alpine

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy the updated index.html into nginx
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80
