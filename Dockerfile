FROM nginx:latest

# Copy html file from the current dir to the nginx image
COPY ./index.html /usr/share/nginx/html/index.html