# http-volume-control

```sh
docker build -t go4ble/http-volume-control:latest .

docker run --rm -it --device /dev/snd -p 4567 go4ble/http-volume-control:latest
```
