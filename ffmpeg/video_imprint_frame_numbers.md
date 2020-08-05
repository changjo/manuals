# 영상에 프레임 넘버를 각인시키기

```bash
ffmpeg -i video.mp4 \
  -vf "drawtext=fontfile=Arial.ttf: fontsize=75: text=%{n}: x=(w-tw)/2: y=h-(2*lh): fontcolor=white: box=1: boxcolor=0x00000099" \
  -y video_with_frame_nums.mp4
```
