.PHONY: gogo build stop-services start-services truncate-logs

gogo: stop-services build truncate-logs start-services

build:
	make -C ~/isuumo/webapp/go isuumo

stop-services:
	sudo systemctl stop nginx
	sudo systemctl stop isuumo.go.service
	sudo systemctl stop mysql

start-services:
	sudo systemctl start mysql
	sleep 5
	sudo systemctl start isuumo.go.service
	sudo systemctl start nginx

truncate-logs:
	sudo truncate --size 0 /var/log/nginx/access.log
	sudo truncate --size 0 /var/log/nginx/error.log
