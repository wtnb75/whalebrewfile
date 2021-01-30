FROM alpine:3
RUN apk add alpine-sdk sudo atools abuild-doc mandoc
RUN adduser -S -G abuild packager
ADD sudoers.packager /etc/sudoers.d/packager
ADD entrypoint.sh /entrypoint.sh
RUN sed -i -e 's,#PACKAGER=.*$,PACKAGER="Watanabe Takashi <wtnb75@gmail.com>",g;' /etc/abuild.conf
RUN install -d -o root -g abuild -m 0777 /var/cache/distfiles
USER packager
LABEL io.whalebrew.config.keep_container_user 'true'
LABEL io.whalebrew.config.volumes '["~/.cache/distfiles:/var/cache/distfiles","~/.abuild:/home/packager/.abuild","~/packages:/home/packager/packages"]'
ENTRYPOINT ["/entrypoint.sh"]
