.PHONY: test clean

test:
	docker -D build --no-cache=true -f test/Dockerfile-centos7 -t ansible-test .
	mkdir -p results && docker run --rm -it -v $$(pwd)/results:/results ansible-test

clean:
	docker rmi $$(docker images | grep ansible-test | tr -s ' ' | cut -d' ' -f 3) || echo 'no images to clean'
