export IMAGE_PREFIX = bmzhao
export IMAGE_NAME = kissmanga-downloader
export TAG = latest

.PHONY: clean run build remove push

build:
	mvn package
	docker build -t=$(IMAGE_PREFIX)/$(IMAGE_NAME):$(TAG) .

run: remove
	#docker run --name=$(IMAGE_NAME) $(IMAGE_PREFIX)/$(IMAGE_NAME):$(TAG)
	docker-compose up

clean:
	mvn clean

remove:
	(docker stop $(IMAGE_NAME) && docker rm $(IMAGE_NAME)) 2>/dev/null || :
	docker-compose down

push:
	docker push $(IMAGE_PREFIX)/$(IMAGE_NAME):$(TAG)
