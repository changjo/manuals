# SSH를 통해서 원격에서 Jupyter Notebooks 접근하기
(참조: https://coderwall.com/p/ohk6cg/remote-access-to-ipython-notebooks-via-ssh)

나에게 단지 SSH 접근에 대한 포트만 열려 있을 때, Jupyter notebook을 어떻게 접근할 것인가 이것이
문제였다..

## 방법

리모트 상의 컴퓨터에서 jupyter notebook을 실행한다. 아래의 경우는 jupyter notebook을 8889
포트로 접근하도록 하였다.
```shell
remote_user@remote_host$ jupyter notebook --no-browser --port=8889
```

로컬 상에서 아래 명령어를 이용하여 SSH tunnel을 시작한다. SSH tunneling은 크게 Local port
forwarding과 Remote port forwarding으로 이루어져 있는데 우리가 사용하려하는 경우에는 Local
port forwarding 이다.

![](http://www.hanbit.co.kr/data/editor/20160921142857_stfgabxd.gif)

(출처: http://www.hanbit.co.kr/network/category/category_view.html?cms_code=CMS5064906327)

```shell
local_user@local_host$ ssh -N -f -L localhost:8888:localhost:8889 remote_user@remote_host -p 22
```

```
-N : Remote command를 실행하지 않는다. 단지 포트포워딩을 할 때 유용하다.
-f : SSH가 백그라운드로 실행되도록 한다.
-L : Local port forwarding...
-p : SSH 접속 포트...
```

그러면 우리는 local machine browser에서 localhost:8888로 접근할 수 있다.
