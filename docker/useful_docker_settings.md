# Docker 세팅 모음

### `nvidia-docker`가 기본적으로 실행되도록 하고 싶을 때

```shell
$ docker run --runtime=nvidia ...
```

위의 `--runtime=nvidia`가 default option으로 되어야 할 것이다...


#### 방법
(아래의 방법을 통해 PyCharm에서 `nvidia-docker`를 사용할 수 있다.)

`/etc/docker/daemon.json` 파일에 `"default-runtime"`을 삽입해주면 된다.

```json
{
    "default-runtime": "nvidia",
    "runtimes": {
        "nvidia": {
            "path": "/usr/bin/nvidia-container-runtime",
            "runtimeArgs": [ ]
        }
    }
}
```

이제 단순히
```shell
$ docker run ...
```
을 해주면 된다..
