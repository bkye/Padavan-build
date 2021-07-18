FROM scratch
ADD openwrt-rockchip-armv8-rootfs.tar.gz /
CMD ["/bin/ash"]
