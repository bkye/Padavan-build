FROM node:lts-alpine
LABEL maintainer="cai <cai@gmail.com>"
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=zh_CN.UTF-8 \
    SHELL=/bin/bash \
    PS1="\u@\h:\w \$ " \
    JD_DIR=/jd \
    ENABLE_HANGUP=false \
    ENABLE_WEB_PANEL=false
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update -f \
    && apk upgrade \
    && apk --no-cache add -f bash \
                             coreutils \
                             moreutils \
                             git \
                             wget \
                             curl \
                             nano \
                             tzdata \
                             perl \
                             openssl \
							 openssh \
    && rm -rf /var/cache/apk/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
	&& echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config \
	&& echo "UserKnownHostsFile /dev/null" >> /etc/ssh/ssh_config \
	&& git config --global user.name ggd3386 \
	&& git config --global user.email vabijew724@jentrix.com \
	&& echo -e "\n" | echo -e "\n" |  echo -e "\n" | ssh-keygen -t rsa -C "vabijew724@jentrix.com" \
	&& git clone -b master https://gitee.com/bkye/ctest ${JD_DIR} \
	&& cd ${JD_DIR} \
	&& git remote rm origin \
	&& git remote add origin git@gitee.com:bkye/ctest.git \
    && cd ${JD_DIR}/panel \
    && npm install \
    && git clone -b master https://gitee.com/lxk0301/jd_scripts ${JD_DIR}/scripts \
    && cd ${JD_DIR}/scripts \
    && npm install \
    && npm install -g pm2 \
    && ln -sf ${JD_DIR}/jd.sh /usr/local/bin/jd \
    && ln -sf ${JD_DIR}/git_pull.sh /usr/local/bin/git_pull \
    && ln -sf ${JD_DIR}/rm_log.sh /usr/local/bin/rm_log \
    && ln -sf ${JD_DIR}/export_sharecodes.sh /usr/local/bin/export_sharecodes \
    && cp -f ${JD_DIR}/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh \
    && chmod 777 /usr/local/bin/docker-entrypoint.sh \
    && rm -rf /root/.npm \
	&& cat /root/.ssh/id_rsa.pub
WORKDIR ${JD_DIR}
ENTRYPOINT docker-entrypoint.sh
