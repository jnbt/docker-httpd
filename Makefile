NAME=jnbt/httpd
VERSION=2.4.62

build:
	docker build -t ${NAME} .

shell: build
	docker run --rm -it ${NAME} bash

test: build
	docker run --rm -it -p 8080:80 -v $(PWD)/www:/usr/local/apache2/htdocs/:ro ${NAME}

push: build
	docker image tag ${NAME} ${NAME}:${VERSION}
	docker image push ${NAME}:${VERSION}

release:
	git commit -av -e -m "Upgrade to httpd ${VERSION}" && \
	git tag -f ${VERSION} && \
	git push && \
	git push --tags -f
