# Ubuntu 설치 및 환경 메뉴얼

### 1. 리눅스 설치 (Ubuntu)
- https://www.ubuntu.com/download/desktop


### 2. 그래픽 카드 드라이버 설치, CUDA 설치  
- Display Driver: https://www.geforce.com/drivers  
- CUDA: https://developer.nvidia.com/cuda-downloads  
- Guide: http://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#axzz4pi8gII6G  
- CUDNN : https://developer.nvidia.com/rdp/cudnn-download  
(참조:
https://askubuntu.com/questions/841876/how-to-disable-nouveau-kernel-driver)


### 3. Shell program 설치  
- ohmyz.sh: http://ohmyz.sh/

### 4. Docker 설치  
- https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/  
- Guide: https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository

### 5. Tensorflow 설치
- https://www.tensorflow.org/install/install_linux

### 6. Keras 설치

### 7. Jupyter Notebook 설치

### 8. OpenSSH 설치
- http://ubuntuhandbook.org/index.php/2016/04/enable-ssh-ubuntu-16-04-lts/

### 9. OpenCV 설치
- http://www.pyimagesearch.com/2016/10/24/ubuntu-16-04-how-to-install-opencv/

###  관련 유용한 기능:
```
$ pip3 uninstall jupyter
```
```
$ sudo pip3 install pip-autoremove
```
```
$ sudo pip-autoremove jupyter
```

</br>
</br>

### 1. Linux 설치후, update, upgrade 실행, git과 vim 설치

```
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install vim git
```

- editer로 nano 혹은 gedit 사용 가능

<br/>

### 2. Disable Nouveau kernel driver
- https://askubuntu.com/questions/841876/how-to-disable-nouveau-kernel-driver
```
$ sudo apt-get remove nvidia* && sudo apt autoremove
$ sudo apt-get install dkms build-essential linux-headers-generic
```
```
$ sudo nano /etc/modprobe.d/blacklist-nouveau.conf
```

하단에 추가
```
blacklist nouveau
options nouveau modeset=0
```
```
$ sudo update-initramfs -u
```
```
$ sudo reboot
```

<br/>

### 3. NVIDIA Display Driver 설치

- Ctrl+Alt+F1

```
$ sudo service lightdm stop
$ sudo init 3
$ sudo dpkg --add-architecture i386
$ sudo apt-get update
$ sudo apt-get install libc6:i386 libstdc++6:i386
$ sudo chmod +x DRIVER_NAME.run
$ sudo ./DRIVER_NAME.run
```

```
$ sudo service lightdm restart
```

- 로그인
- Reboot

<br/>

### 4. Install oh-my-zsh

```
$ sudo apt-get install zsh
$ sudo apt-get install curl
$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

<br/>

### 5. Install CUDA Toolkit

- Download **run** file on https://developer.nvidia.com/cuda-downloads

```
$ sudo sh cuda_8.0.61_375.26_linux.run
```
- **!주의! 설치시 NVIDIA driver는 설치 하지 않음.
(같이 설치하면 충돌날 수 있음)**

- Download patch if exists,
```
$ sudo sh cuda_8.0.61.2_linux.run
```

<br/>

### 6. Install cuDNN 6.0

- Download cudnn-8.0-linux-x64-v6.0.tgz on "https://developer.nvidia.com/rdp/cudnn-download"

```
$ tar xvzf cudnn-8.0-linux-x64-v5.1.tgz
$ sudo cp -P cuda/include/cudnn.h /usr/local/cuda/include
$ sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda/lib64
$ sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
```

```
$ gedit ~/.bashrc
```

- 제일 밑에 아래 내용 추가:

```
export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"
export CUDA_HOME=/usr/local/cuda
```
- Path 지정 완료 후, terminal을 종료후 다시 시작해야 Path가 적용됨.
- Path 확인
```
$ echo $PATH
$ echo $LD_LIBRARY_PATH
$ echo $CUDA_HOME
```

<br/>

### 7. Docker 설치

```
$ sudo apt-get update
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

$ sudo apt-get update
$ sudo apt-get install docker-ce
```

<br/>

### 8. Install TensorFlow

```
$ sudo apt-get install libcupti-dev
```
```
$ sudo apt-get install python-pip python-dev python-virtualenv # for Python 2.7
$ sudo apt-get install python3-pip python3-dev python-virtualenv # for Python 3.n
```

```
$ virtualenv --system-site-packages targetDirectory # for Python 2.7
$ virtualenv --system-site-packages -p python3 targetDirectory # for Python 3.n
```

```
$ source ~/tensorflow/bin/activate
```

```
(tensorflow)$ pip install --upgrade tensorflow-gpu  # for Python 2.7 and GPU
(tensorflow)$ pip3 install --upgrade tensorflow-gpu # for Python 3.n and GPU
```

<br/>

### 9. Install Keras

```
$ source ~/tensorflow/bin/activate
$ pip3 install keras
```
___
**sudo 사용하지 않고 쓰기, virtualenv에서 sudo를 쓰면 전체 시스템에 깔려서 path 문제 발생**
___

<br/>

### 10. Install Other packages

```
$ source ~/tensorflow/bin/activate
(tensorflow)$ pip3 install jupyter
```

```
(tensorflow)$ deactivate
$ sudo apt-get install python3-tk
$ sudo pip3 install numpy
$ sudo pip3 install librosa
$ sudo pip3 install h5py
$ sudo pip3 install seaborn
$ sudo pip3 install matplotlib
$ sudo pip3 install pandas
$ sudo pip3 install scipy scikit-learn
```

<br/>

### 11. OpenSSH 설치

```
$ sudo apt-get install openssh-server
$ sudo service ssh status
```

<br/>

### 12. Install OpenCV

```
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install build-essential cmake pkg-config
$ sudo apt-get install libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev
$ sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
$ sudo apt-get install libxvidcore-dev libx264-dev
$ sudo apt-get install libgtk-3-dev
$ sudo apt-get install libatlas-base-dev gfortran
$ sudo apt-get install python2.7-dev python3.5-dev
```

```
$ cd ~
$ wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.2.0.zip
$ unzip opencv.zip

$ wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/3.2.0.zip
$ unzip opencv_contrib.zip
```

```
$ cd ~/opencv-3.2.0/  #Open cv 버전 맞추어 수정
$ mkdir build
$ cd build
$ cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=OFF \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.2.0/modules \  #Open cv 버전 맞추어 수정
    -D PYTHON_EXECUTABLE=/usr/bin/python3 \    # python directory 정확히 맞추어 수정하기
    -D BUILD_EXAMPLES=ON ..
```

```
$ make -j8
$ sudo make install
$ sudo ldconfig
```

```
$ cd /usr/local/lib/python3.5/dist-packages/
$ sudo cp cv2.cpython-35m-x86_64-linux-gnu.so cv2.so
```

- opencv : version: 3.2.0

<br/>

### 설치 모두 끝났으면 Reboot.
