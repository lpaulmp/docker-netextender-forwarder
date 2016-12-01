build:
	docker build -t netextender-client:forward .

run:
	docker run --rm -it --privileged netextender-client:forward $@

bash:
	docker port netextender-client:forward 22
	docker run --rm -it --entrypoint bash netextender-client

