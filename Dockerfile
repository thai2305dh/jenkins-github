FROM thai2305/thaigitlab
# RUN rm -rf /usr/share/nginx/html/index.html
# Copy to index.html
COPY index.html /usr/share/nginx/html/index.html
CMD ["nginx", "-g", "daemon off;"]
