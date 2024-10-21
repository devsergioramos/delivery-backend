setup:
	pip install -r requirements.txt

server:
	fastapi dev main.py

up:
	docker compose up -d

down:
	docker compose down

docker-image:
	docker build -t delivery-backend-api .

docker-tag:
	docker tag delivery-backend-api devsergioramos/fastech-delivery-backend

docker-push:
	docker push devsergioramos/fastech-delivery-backend

docker-pull:
	docker pull devsergioramos/fastech-delivery-backend

docker-run:
	docker run -d --name prod-container -p 8000:8000 devsergioramos/fastech-delivery-backend

docker-stop:
	docker stop prod-container