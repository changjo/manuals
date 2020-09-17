# Change Time Zone

[List of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)

예: Time zone을 `Asia/Seoul`로 변경

```bash
export DEBIAN_FRONTEND=noninteractive
export TZ="Asia/Seoul"

apt update && apt install -y tzdata
ln -fs /usr/share/zoneinfo/$TZ /etc/localtime
dpkg-reconfigure -f noninterative tzdata
```
