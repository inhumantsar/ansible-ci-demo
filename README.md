# ansible-dummy-role

## What?

Exemplar for individualised Ansible roles based on the basic `ansible-galaxy init` template and [William Yeh's Ansible Docker image](https://github.com/William-Yeh/docker-ansible).


## Why?

To illustrate, and maybe provide a simple template for, easy Docker-based Ansible testing.


## How?

    make clean && make test

## Directory structure

Everything came straight out of `ansible-galaxy init` except for the following:

* `Makefile` - Does the thing
* `test/checks.sh` - Is injected into the Docker container and runs checks to ensure the desired functional state is present.
* `test/Dockerfile-centos7` - Is used to build a CentOS 7 docker image for testing.