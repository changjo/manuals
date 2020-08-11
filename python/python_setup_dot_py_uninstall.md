# python setup.py uninstall 방법

*(출처: https://stackoverflow.com/questions/1550226/python-setup-py-uninstall)*


### `python setup.py install`로 설치했을 때
 
설치된 파일 리스트를 저장한 뒤, 지운다.
```bash
python setup.py install --record files.txt
xargs rm -rf < files.txt
```
---

### `pip install .` 사용을 권장
`python setup.py install` 대신 `pip install .`로 패키지를 설치할 수 있다.
`pip uninstall PACKAGE_NAME`을 입력하면 쉽게 제거할 수 있다.

#### 설치
```bash
pip install .
```

#### 삭제
```bash
pip uninstall PACKAGE_NAME
```