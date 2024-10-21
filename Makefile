setup:
	pip install -r requirements.txt

server:
	fastapi dev main.py

build-image:
	docker build -t delivery-backend-api .

run-container:
	docker run -d --name prod-container -p 8000:80 delivery-backend-api

stop-container:
	docker stop prod-container

up:
	docker compose up -d

down:
	docker compose down

create-docker-tag:
	docker tag delivery-backend-api devsergioramos/fastech-delivery-backend

push-docker-image:
	docker push devsergioramos/fastech-delivery-backend