.PHONY: gogo build stop-services start-services truncate-logs bench

gogo: stop-services build truncate-logs start-services

build:
	make -C webapp/go isuumo

stop-services:
	sudo systemctl stop nginx
	sudo systemctl stop isuumo.go.service
	ssh isucon@10.160.15.102 sudo systemctl stop mysql
	ssh isucon@10.160.15.103 sudo systemctl stop mysql

start-services:
	ssh isucon@10.160.15.103 sudo systemctl start mysql
	sleep 5
	ssh isucon@10.160.15.102 sudo systemctl start mysql
	sleep 5
	sudo systemctl start isuumo.go.service
	sudo systemctl start nginx

truncate-logs:
	sudo truncate --size 0 /var/log/nginx/access.log
	sudo truncate --size 0 /var/log/nginx/error.log
	ssh isucon@10.160.15.102 sudo truncate --size 0 /var/log/mysql/mysql-slow.log 
	ssh isucon@10.160.15.103 sudo truncate --size 0 /var/log/mysql/mysql-slow.log 

kataribe:
	cd ../ && sudo cat /var/log/nginx/access.log | ./kataribe

bench:
	cd bench && ./bench -target-url http://localhost:80 && cd ../
