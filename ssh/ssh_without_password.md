# SSH Login without Password
(출처: http://www.linuxproblem.org/art_9.html)

상황: A 컴퓨터의 유저 a가 B 컴퓨터의 유저 b로 비밀번호 없이 ssh 접속.

1. ssh key를 생성. (주의: passphrase를 입력하지 않음.)
```bash
a@A:~$ ssh-keygen -t rsa
```
```
Generating public/private rsa key pair.
Enter file in which to save the key (/home/a/.ssh/id_rsa): 
Created directory '/home/a/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/a/.ssh/id_rsa.
Your public key has been saved in /home/a/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:OoceF8lmHM2YaRab0K43WsaDAfpGQb5vfmx3od/JqcI a@A
```

2. (ssh를 통해) B 컴퓨터의 유저 b에 대해 `~/.ssh` 디렉토리를 생성.
```bash
a@A:~$ ssh b@B mkdir -p .ssh
```
```
b@B's password:
```

3. 유저 a의 새로운 public key를 `b@B:.ssh/authorized_keys`에 추가.
```bash
a@A:~$ cat .ssh/id_rsa.pub | ssh b@B 'cat >> .ssh/authorized_keys'
```
```
b@B's password:
```

4. 이제 a@A가 b@B에 비밀번호 없이 접속 가능.
```bash
a@A:~$ ssh b@B
```
