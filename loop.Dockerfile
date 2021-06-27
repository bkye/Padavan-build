FROM scratch
ARG TARGET
COPY loop/bin/$TARGET/loop /usr/local/bin/loop
