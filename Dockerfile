FROM scratch
ADD openwrt-rockchip-armv8-rootfs.tar.gz /
#CMD ["/bin/ash"]
EXPOSE 22 80 443
# using exec format so that /sbin/init is proc 1 (see procd docs)
ENTRYPOINT ["/sbin/init"]
