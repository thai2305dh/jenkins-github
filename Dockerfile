FROM nginx
# RUN rm -rf /usr/share/nginx/html/index.html
# Copy to index.html
COPY index.html /var/www/html/index.html
CMD ["nginx", "-g", "daemon off;"]
