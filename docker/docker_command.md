# Docker 명령어 모음

### [docker commit](https://docs.docker.com/engine/reference/commandline/commit/)

컨테이너의 변화된 내용을 새로운 이미지로 만든다.

```shell
docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
```

</br>

### [docker save](https://docs.docker.com/engine/reference/commandline/save/)

하나 또는 그 이상의 도커 이미지들을 tar 파일로 저장한다. (디폴트로는 STDOUT으로..)

```shell
docker save [OPTIONS] IMAGE [IMAGE...]
```

#### Options

```
--output, -o : STDOUT 대신에 파일에 저장한다.
```

#### Examples

```shell
$ docker save busybox > busybox.tar

$ docker save --output busybox.tar busybox

$ docker save -o fedora-all.tar fedora

$ docker save -o fedora-latest.tar fedora:latest

$ docker save -o ubuntu.tar ubuntu:lucid ubuntu:saucy
```

</br>

### [docker load](https://docs.docker.com/engine/reference/commandline/load/)

tar 파일 또는 STDIN으로부터 이미지를 불러들인다.

```shell
docker load [OPTIONS]
```

#### Options

```
--input, -i : STDIN 대신에 tar 파일로부터 읽는다.
--quiet, -q
```

#### Examples

```shell
$ docker load < busybox.tar.gz

$ docker load --input fedora.tar
```

</br>

### [docker tag](https://docs.docker.com/engine/reference/commandline/tag/)

SOURCE_IMAGE 이미지의 새로운 tag를 만든다.

```shell
docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
```

</br>

### [docker rename](https://docs.docker.com/engine/reference/commandline/rename/)

컨테이너의 이름을 변경한다.

```shell
docker rename CONTAINER NEW_NAME
```

</br>

### [docker history](https://docs.docker.com/engine/reference/commandline/history/)

이미지의 history를 보여준다.

```shell
docker history [OPTIONS] IMAGE
```

</br>

## docker network

### [Macvlan](https://docs.docker.com/engine/userguide/networking/get-started-macvlan/)

도커 컨테이너 ip를 호스트 ip하고 같은 네트워크로 구성하고 싶었습니다.. Macvlan을 이용하니 가능하네요..

![](https://docs.docker.com/engine/userguide/networking/images/macvlan_bridge_simple.svg)

Macvlan 네트워크 생성.

```shell
$ docker network create -d macvlan --subnet 10.0.0.0/24 --gateway=10.0.0.1 -o parent=eno1 dockernet
```

컨테이너 생성
```shell
$ docker run -i -t --name test --net=dockernet --ip=10.0.0.211 test_image:latest
```
