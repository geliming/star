FROM registry.cn-beijing.aliyuncs.com/akimimi/production-php56:latest

ENV WORKSPACE /data0/workspace
ENV CONFIGSPACE /data0/workspace

COPY ./ $WORKSPACE/app
RUN mkdir -p $WORKSPACE/app/tmp $WORKSPACE/app/tmp/cache/persistent $WORKSPACE/app/tmp/cache/models $WORKSPACE/app/files $WORKSPACE/app/config-master
RUN chown -R dev:dev $WORKSPACE/app/ && chmod -R 777 $WORKSPACE/app/tmp/ $WORKSPACE/app/files/
RUN mv /data0/config-files/config.dev.php   /data0/config-files/config.php
RUN mv /data0/config-files/database.dev.php /data0/config-files/database.php
RUN ln -s /data0/config-files/config.php   $WORKSPACE/app/Config/config.php
RUN ln -s /data0/config-files/database.php $WORKSPACE/app/Config/database.php

EXPOSE $ssh_port
EXPOSE $http_port
EXPOSE $phpfpm_port

ENTRYPOINT ["/root/start-service.sh"]

