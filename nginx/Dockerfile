FROM nginx:alpine

# Copy custom nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy SSL certificates (if using HTTPS)
# COPY ssl /etc/nginx/ssl

EXPOSE 80
# EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
