build:
	cat ~/.ssh/id_rsa.pub > authorized_keys
	docker build -t netextender-client .

run:
	docker run -it --name netextender-forward -it -p 2222:22 --privileged netextender-client

bash:
	docker exec -it netextender-forward bash

