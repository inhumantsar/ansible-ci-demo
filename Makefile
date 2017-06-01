.PHONY: test clean

test:
	rnd=$RANDOM
	docker -D build --no-cache=true -f test/Dockerfile-centos7 -t ansible-test-$rnd .
	mkdir results && docker run --rm -it -v $(pwd)/results:/results ansible-test-$rnd

clean:
	docker rmi $(docker images | grep ansible-dummy-role-test | tr -s ' ' | cut -d' ' -f 3) || echo 'no images to clean'
