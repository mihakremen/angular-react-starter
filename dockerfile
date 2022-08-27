FROM alpine:3.16.2

RUN apk add -U nginx

COPY nginx.conf /etc/nginx/nginx.conf

COPY ./angular/dist/angular-starter/ /usr/share/nginx/html/

RUN mkdir -p /tmp/client_body \
	/tmp/fastcgi_temp \
	/tmp/fastcgi_temp \
	/tmp/scgi_temp \
	/tmp/uwsgi_temp \
	
	&& chown -R nginx:nginx /etc/nginx/nginx.conf 
	
USER nginx

EXPOSE 8080

CMD ["nginx", "-c", "/etc/nginx/nginx.conf"] 

