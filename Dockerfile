FROM bkye/ctest:v3
LABEL maintainer="cai <cai@gmail.com>"
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=zh_CN.UTF-8 \
    SHELL=/bin/bash \
    PS1="\u@\h:\w \$ " \
    JD_DIR=/jd \
    ENABLE_HANGUP=false \
    ENABLE_WEB_PANEL=false
RUN apk update -f \
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
    && wget -O /root/.ssh/config https://raw.githubusercontent.com/bkye/Padavan-build/master/config \
    && wget -O /root/.ssh/id_rsa_gitee https://raw.githubusercontent.com/bkye/Padavan-build/master/id_rsa_gitee \
    && chmod 700 /root/.ssh/id_rsa_gitee \
	&& cd ${JD_DIR} \
	&& git pull \
    && cd ${JD_DIR}/scripts \
    && git remote set-url origin git@gitee-lx.com:lxk0301/jd_scripts.git
    && git pull \
    && npm install \
    && npm install -g pm2 \
    && ln -sf ${JD_DIR}/jd.sh /usr/local/bin/jd \
    && ln -sf ${JD_DIR}/git_pull.sh /usr/local/bin/git_pull \
    && ln -sf ${JD_DIR}/rm_log.sh /usr/local/bin/rm_log \
    && ln -sf ${JD_DIR}/export_sharecodes.sh /usr/local/bin/export_sharecodes \
    && cp -f ${JD_DIR}/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh \
    && chmod 777 /usr/local/bin/docker-entrypoint.sh \
    && rm -rf /root/.npm
WORKDIR ${JD_DIR}
ENTRYPOINT docker-entrypoint.sh
