# ansible-ci-demo

## What?

Exemplar for individualised Ansible Roles based on the basic `ansible-galaxy init` template and [William Yeh's Ansible Docker image](https://github.com/William-Yeh/docker-ansible).


## Why?

To illustrate, and maybe provide a simple template for, easy Docker-based Ansible testing.

## How?

### Running it

    make clean && make test

### Under the Hood

* `test/Dockerfile-centos7` - Defines the Docker image we'll be building for the tests.
* `Makefile` - `make test` fires a `docker build` process, which starts with a base image in our target OS and Ansible pre-installed, then runs the fresh built image with the role files in there.
* `test/checks.sh` - Check scripting goes here. It'll be run within the Docker container. Results are written to `$RESULTS_FILE`. By default this is a file called "centos7" on the /results volume that `make test` mounts as part of `docker run.`
* `ansible-playbook-wrapper` - Simple wrapper for Ansible grabbed from William Yeh's code. It uses the PLAYBOOK env var we expose/set in the Dockerfile to run the tests.
* `test.yml` - This simple playbook does an `include` on all the role files for testing.

## Enabling CI for a GitLab Group
1. Go to https://gitlab.somedomain.xyz/groups/yourgroup/edit
2.
