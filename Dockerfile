FROM alpine:latest
ARG REPO=gitee
ARG REPO_URL=$REPO.com
ARG JD_SCRIPTS=jd_backup
ARG JD_SCRIPTS_BRANCH=master
ARG JD_SCRIPTS_HOST=jd_scripts_acc
ARG JD_SCRIPTS_KEY="-----BEGIN OPENSSH PRIVATE KEY-----@b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABlwAAAAdzc2gtcn@NhAAAAAwEAAQAAAYEA2TQr1hY07pLgCoq+rDXPcPZWPYPEgHYwYCFQ9d1ueoUDSCowBnTP@z9uWNHveOXAAaujMYMPv1HDqfOZWURTWNdQvyf+Ov07NOXdk+H/xsenFQBGeL8M3KGcQQQ@jT3GsndzVmComQujZ25xWQmplocZeis7K6nU7NJ4okWpZowZ8YOjjWu70twe2pA3Rp6avp@EQNXJ9+HWofY+RAN20BYtpjKUjCDwRy/RvGwMg1INDhGAAmqhiMNLMmkf+ac21AftE+Dv9@O+LxoEyEv41ZYQEHPttR3R+8BG1EqmJt6zec6hRGjOH/Nm8Jz10A01hStReucchL0Py4Sp@+PAE/S7mJ2MZCr0IfNDs/0a0jpklnd/JUFZPWLHUB/nma0QHv3wQpEAnA13w2qMsQ9Zgw1@yXwwEltZdZ290DF4CIiVzs8LBoLiodaIi/02bJ2k6BAc2HJVxqgOjqijDn7JWJi93TwyQD@wBKV+aldFHkSnL6v1PpYvkuEpEYTYYhI3U29O6hRAAAFiJJpag6SaWoOAAAAB3NzaC1yc2@EAAAGBANk0K9YWNO6S4AqKvqw1z3D2Vj2DxIB2MGAhUPXdbnqFA0gqMAZ0z8/bljR73jlw@AGrozGDD79Rw6nzmVlEU1jXUL8n/jr9OzTl3ZPh/8bHpxUARni/DNyhnEEEI09xrJ3c1Zg@qJkLo2ducVkJqZaHGXorOyup1OzSeKJFqWaMGfGDo41ru9LcHtqQN0aemr6REDVyffh1qH@2PkQDdtAWLaYylIwg8Ecv0bxsDINSDQ4RgAJqoYjDSzJpH/mnNtQH7RPg7/Tvi8aBMhL+N@WWEBBz7bUd0fvARtRKpibes3nOoURozh/zZvCc9dANNYUrUXrnHIS9D8uEqfjwBP0u5idj@GQq9CHzQ7P9GtI6ZJZ3fyVBWT1ix1Af55mtEB798EKRAJwNd8NqjLEPWYMNcl8MBJbWXWd@vdAxeAiIlc7PCwaC4qHWiIv9NmydpOgQHNhyVcaoDo6oow5+yViYvd08MkA8ASlfmpXRR5@Epy+r9T6WL5LhKRGE2GISN1NvTuoUQAAAAMBAAEAAAGAfluZfOxiUsBjUf6xOiH70i2csi@Cr+kfHkMURAleVY/VpmVvhoH/oPXXzhgjhmOyNcaSI8WpLZX1jDNI7OOQ0UhBk1NC1TJod@TecleGOGSghDVihprEOXHQwIKq1mAv7bcMBB4rNw3MO+nGSxQR8p4ZtjbcL2SXmEZBI7X+@/MdYeGYqiaU5GUwxLtljLtQqFd7yXQWEPzzDjngs1SIlDmyyNL4FCU9Y0xwaXs6NFNRgPO@xUraRzqw+XM9HaMdcYDEPlifvTTpkmZgXhUP6lvRN1SbzeOCP3jgDqL/4qqpVZpofAxQCj@RB8tAHhY6w7rSRX2c50uGXve75CABUjqM3GPBepta21iSQ6QA+D6avXJW2UkOF4prRMpFa@o+I4SAyzNdzb0tLUKvvf5ervSDpfc9zaF++ASdL2/wKK3UNpvbJ6mMVdQis6mzrpgS3u/3@iQhf5XjYAVdokW4tv33/0d/ejT41fjqh/DXdjQLVdZJO2GSYrGXEv+E8pP0nEK72B5AAAA@wAWQU/vjGxSOScMb7I0ZO/EkMMSvc/G0ixXJC72RKlifhmN1zfPTdfTlLfruzAM9K4RLak@oilIGESw8x2RD/5gP6Q1v2ntx7oxi6UQoQOVSLZKzABeOavGFwNlCQstjPpVmbU9L5sk3F@09qqsHaH+VU08kZyd1O+N67mZVHBYHxORX1L/VaJA09WC4T4/kX33IixOhkyRSYtQbwP1s@nO4Kvk5ZIUq+lzQ0NzhcHa1clNhcBQvdcMoRi8E8K4zjpnRwAAAMEA9eo090EQaphum+BH@iUfgXjrB2qfmNb5qabyRZlXElpGcfaRXaFrRFavjYXZiOH0dU/necrd89hwBuDrBwmKahw@Oa31sE+RG2IMyYgotQqRzEZ/XlZyFpS7xwHU1ejls/hGYuaJsHVWW1xABlMl0Zf1kcBDHl@CywACg4u2DS9BPBKUUAqdFX4KPFn9OmX4Wc/PwZswepcoI9PvoIU+uuq5RCu7EfwbHXqs+@vwJ7S99Qy233TudWyMsX+bTeJR71hvAAAAwQDiHIjaMAlRm0/NOafSK0X7GsKUMMKKFC54@vhY31fnpRQ/n+O5M4s6qtE2F5pdeh/vbc2sY/tP0bOT1ndMyeTYElb/X5edVop3YwwlCql@eE7hSUZ7fitO6gjxOQqQ1+EhcPR4c83D8QwVuux1LLXQr5MI8XyG18xxV9rV9R9LFsmgsD@cT9h4mon0qt5SxJfGmtqhtYJgHK25GUb9779qWaN24+5+ARcf0xO4Ji9eplH3Yyonhqx2U@gptn5/2XLJ6z8AAAAOcXN4ZGZjQDEyNi5jb20BAgMEBQ==@-----END OPENSSH PRIVATE KEY-----"
ARG JD_SHELL=jd_shell
ARG JD_SHELL_BRANCH=master
ARG JD_SHELL_HOST=jd_shell_acc
ARG JD_SHELL_URL=git@jd_shell_acc:accors/jd_shell.git
COPY --from=nevinee/s6-overlay-stage:latest / /
COPY --from=nevinee/loop:latest / /
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=zh_CN.UTF-8 \
    SHELL=/bin/bash \
    PS1="\u@\h:\w \$ " \
    JD_DIR=/jd \
    ENABLE_HANGUP=false \
    ENABLE_RESET_REPO_URL=true \
    JD_SCRIPTS_URL=git@$JD_SCRIPTS_HOST:accors/$JD_SCRIPTS.git
WORKDIR $JD_DIR
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && echo "========= 安装软件 =========" \
    && apk update -f \
    && apk --no-cache add -f \
       bash \
       coreutils \
       diffutils \
       git \
       wget \
       curl \
       nano \
       tzdata \
       perl \
       openssh-client \
       nodejs-lts \
       npm \
       vim \
    && echo "========= 修改时区 =========" \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && echo "========= 部署SSH KEY =========" \
    && mkdir -p /root/.ssh \
    && echo $JD_SCRIPTS_KEY | perl -pe "{s|_| |g; s|@|\n|g}" > /root/.ssh/$JD_SHELL \
    && echo $JD_SCRIPTS_KEY | perl -pe "{s|_| |g; s|@|\n|g}" > /root/.ssh/$JD_SCRIPTS \
    && chmod 600 /root/.ssh/$JD_SHELL /root/.ssh/$JD_SCRIPTS \
    && echo -e "Host $JD_SHELL_HOST\n\tHostname $REPO_URL\n\tIdentityFile=/root/.ssh/$JD_SHELL\n\nHost $JD_SCRIPTS_HOST\n\tHostname $REPO_URL\n\tIdentityFile=/root/.ssh/$JD_SCRIPTS" > /root/.ssh/config \
    && echo -e "\n\nHost *\n  StrictHostKeyChecking no\n UserKnownHostsFile ~/.ssh/known_hosts\n" >> /etc/ssh/ssh_config \
    && chmod 644 /root/.ssh/config \
    && ssh-keyscan $REPO_URL > /root/.ssh/known_hosts \
    && ssh-keyscan 180.97.125.228 >> /root/.ssh/known_hosts \
    && git config --global pull.ff only \
    && git clone -b $JD_SHELL_BRANCH $JD_SHELL_URL $JD_DIR \
    && echo "========= 安装PM2与面板依赖 =========" \
    && npm install -g pm2@latest \
    && cd $JD_DIR/jpanel \
    && npm install \
    && echo "========= 创建软链接 =========" \
    && ln -sf $JD_DIR/jtask.sh /usr/local/bin/jtask \
    && ln -sf $JD_DIR/jtask.sh /usr/local/bin/otask \
    && ln -sf $JD_DIR/jtask.sh /usr/local/bin/mtask \
    && ln -sf $JD_DIR/jup.sh /usr/local/bin/jup \
    && ln -sf $JD_DIR/jlog.sh /usr/local/bin/jlog \
    && ln -sf $JD_DIR/jcode.sh /usr/local/bin/jcode \
    && ln -sf $JD_DIR/jcsv.sh /usr/local/bin/jcsv \
    && if [ -d /etc/cont-init.d ]; then \
            rm -rf /etc/cont-init.d; \
       fi \
    && if [ -d /etc/services.d ]; then \
            rm -rf /etc/services.d; \
       fi \
    && ln -sf $JD_DIR/s6-overlay/etc/cont-init.d /etc/cont-init.d \
    && ln -sf $JD_DIR/s6-overlay/etc/services.d /etc/services.d \
    && echo "========= 清理 =========" \
    && rm -rf /root/.npm /var/cache/apk/* \
    && apk add --no-cache -f \
       jq \
       python3 \
       py3-pip \
       zlib-dev \
       jpeg-dev \
       freetype-dev \
    && echo "========= 安装编译软件 =========" \
    && apk add --no-cache --virtual .build \
       gcc \
       python3-dev \
       musl-dev \
    && echo "========= 创建软链接 =========" \
    && ln -sf /usr/bin/python3 /usr/bin/python \
    && echo "========= 运行 pip install =========" \
    && pip3 install --upgrade pip \
    && cd $JD_DIR/jbot \
    && pip3 install -r requirements.txt \
    && echo "========= 安装软件包 =========" \
    && npm install -g cnpm \
    && cnpm install -g node-gpy node-pre-gpy canvas \
    && cp -rf /usr/lib/node_modules/canvas /jd/scripts/node_modules \
    && echo "========= 清理 =========" \
    && apk del .build \
    && rm -rf /root/.cache /var/cache/apk/*
ENTRYPOINT ["/init"]
