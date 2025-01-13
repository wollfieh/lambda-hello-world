DOCKER_TAG=docker.io/wollfieh/pub:lambda

image:
	docker build --platform linux/amd64 -t ${DOCKER_TAG} .

push: image
	docker push ${DOCKER_TAG}


test:
	docker run --rm -p 9000:8080 --entrypoint /usr/local/bin/aws-lambda-rie ${DOCKER_TAG} ./main