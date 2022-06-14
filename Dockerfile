FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

RUN mkdir /cache
RUN chmod 0777 /cache
