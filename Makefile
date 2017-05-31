.PHONY: test clean

test:
	docker -D build --no-cache=true -f test/Dockerfile-centos7 -t ansible-dummy-role-test .

clean:
	docker rmi -f ansible-dummy-role-test || echo 'no images to clean'
