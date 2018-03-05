docker run -ti \
    -v /mnt/Media/Containers/mosquitto/mosquitto:/etc/mosquitto \
    -v /mnt/Media/Containers/mosquitto/mosquitto.d:/etc/mosquitto.d \
    -v /mnt/Media/Containers/mosquitto/lib:/var/lib/mosquitto \
    --name mqtt \
    -p 1883:1883 \
    -p 9883:9883 \
    --privileged \
    jllopis/mosquitto

