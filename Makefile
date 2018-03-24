
TAG=jgensl2/ruby-fxgen-builder
VERSION=v1.0.0

package: docker docker_push

docker:
	docker build -t ${TAG}:${VERSION} .

docker_push:
	docker push ${TAG}:${VERSION}

test: docker
	docker run -it --rm -v $$PWD/example:/workdir -v $$PWD/output:/output ${TAG}:${VERSION}

# This will fail on OSX because the packages ruby is for Linux
emulate:
	mkdir -p output/emulate
	unzip -o output/function.zip -d output/emulate
	functions start
	cd output/emulate && functions deploy hello --trigger-http
