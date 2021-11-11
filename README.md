# Docker - docker and docker in docker!

Docker image with alpine linux and docker.  
Using docker ce and a few scripts which have been slightly modified from the original docker repo:  
https://github.com/docker-library/docker

The images are built as multi-architecture images, 
but they are limited to the platforms that are able to run specific software, see the supported architectures
within the parentheses in the tag list.

There are three different versions, which all contain docker. Additionally, there is a `docker in docker` image
and a `buildx` image. The `buildx` image contains the docker cli-plugin `buildx`.

## Tags:

### Docker Hub

* [`jitesoft/docker`](https://gitlab.com/jitesoft/dockerfiles/docker/blob/master/Dockerfile)
    * `latest` (amd64, arm64, arm7)
    * `ce`  (amd64, arm64, arm7, ppc64le, s390x)
* [`jitesoft/docker`](https://gitlab.com/jitesoft/dockerfiles/docker/blob/master/Dind/Dockerfile)
    * `latest-dind` (amd64, arm64)
    * `ce-dind`  (amd64, arm64, armv7, ppc64le, s390x)
* [`jitesoft/docker`](https://gitlab.com/jitesoft/dockerfiles/docker/master/BuildX/Dockerfile)
    * `latest-buildx` (amd64, arm64, armv7)

### GitLab

* [`registry.gitlab.com/jitesoft/dockerfiles/docker`](https://gitlab.com/jitesoft/dockerfiles/docker/blob/master/Dockerfile)
    * `latest` (amd64, arm64, arm7)
    * `ce`  (amd64, arm64, arm7, ppc64le, s390x)
* [`registry.gitlab.com/jitesoft/dockerfiles/docker/dind`](https://gitlab.com/jitesoft/dockerfiles/docker/blob/master/Dind/Dockerfile)
    * `latest` (amd64, arm64)
    * `ce`  (amd64, arm64, armv7, ppc64le, s390x)
* [`registry.gitlab.com/jitesoft/dockerfiles/docker/buildx`](https://gitlab.com/jitesoft/dockerfiles/docker/master/BuildX/Dockerfile)
    * `latest` (amd64, arm64, armv7)

### Licenses

This repository and the files in it are (in case other is not stated) released under the MIT license.  
Docker contains a multitude of licenses and you can read them here: https://www.docker.com/legal/components-licenses

### Image labels

This image follows the [Jitesoft image label specification 1.0.0](https://gitlab.com/snippets/1866155).
