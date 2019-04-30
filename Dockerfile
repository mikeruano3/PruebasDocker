FROM aydusacg4/p1_g4:Version6
RUN rm -rf /var/www/html/ProyectoClase/
RUN git clone https://github.com/AYD2G4/ProyectoClase.git /var/www/html/ProyectoClase
RUN rsync -a -v --ignore-existing /var/www/laravel/* /var/www/ProyectoClase
RUN cp /var/www/html/ProyectoClase/ProyectoClase/.env.example /var/www/html/ProyectoClase/ProyectoClase/.env
RUN cd /var/www/html/ProyectoClase/ProyectoClase/ && yes | composer install && yes | php artisan key:generate

CMD ["apachectl", "-D", "FOREGROUND"]
ENTRYPOINT cd /var/www/html/ProyectoClase/ProyectoClase/ && yes | php artisan migrate:refresh && php artisan serve --host=0.0.0.0 --port=8000

###sudo netstat -ntlp | grep LISTEN
