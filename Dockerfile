FROM bkye/ctest:v3
LABEL maintainer="cai <cai@gmail.com>"
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=zh_CN.UTF-8 \
    SHELL=/bin/bash \
    PS1="\u@\h:\w \$ " \
    JD_DIR=/jd \
    ENABLE_HANGUP=false \
    ENABLE_WEB_PANEL=false
RUN wget -O /root/.ssh/config https://raw.githubusercontent.com/bkye/Padavan-build/master/config \
    && wget -O /root/.ssh/id_rsa_gitee https://raw.githubusercontent.com/bkye/Padavan-build/master/id_rsa_gitee \
    && chmod 700 /root/.ssh/id_rsa_gitee \
    && cd ${JD_DIR} \
    && git pull \
    && cd ${JD_DIR}/scripts \
    && git remote set-url origin git@gitee-lx.com:lxk0301/jd_scripts.git \
    && git pull \
    && npm install \
    && npm install -g pm2
WORKDIR ${JD_DIR}
ENTRYPOINT docker-entrypoint.sh
