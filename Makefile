
build-bin:
	./build.bin.sh
build-docker:build-bin
	sudo docker build . -t smark/gobgp:v1

remove-bin:
	rm -rf gobgp gobgpd

run-bmpcase:
	sudo docker run --name as64512 --net bgp --ip=172.19.0.112 -v /app/gobgp/as64512:/etc/gobgp -dit smark/gobgp:v1
	sudo docker run --name as65000 --net bgp --ip 172.19.0.100 -v /app/gobgp/as65000:/etc/gobgp -dit smark/gobgp:v1
	sudo docker run --name as65001 --net bgp --ip 172.19.0.101 -v /app/gobgp/as65001:/etc/gobgp -dit smark/gobgp:v1

stop-bmpcase:
	sudo docker stop as64512
	sudo docker stop as65000
	sudo docker stop as65001
	sudo docker rm as64512 as65000 as65001