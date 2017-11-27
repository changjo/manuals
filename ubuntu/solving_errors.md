# Solving Errors on Ubuntu
### Jupyter Notebook
#### Google Chrome
##### Problem:
 `...ERROR:browser_gpu_channel_host_factory.cc(108)] Failed to launch GPU process.`
##### Solution:
```shell
$ export BROWSER=google-chrome
```
(Reference: https://github.com/jupyter/notebook/issues/2836#issuecomment-337643224)
