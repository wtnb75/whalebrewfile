FROM alpine:3
RUN apk add alpine-sdk sudo atools abuild-doc mandoc ccache
RUN adduser -S -G abuild packager
ADD sudoers.packager /etc/sudoers.d/packager
ADD entrypoint.sh /entrypoint.sh
RUN sed -i -e 's,#PACKAGER=.*$,PACKAGER="Watanabe Takashi <wtnb75@gmail.com>",g;' /etc/abuild.conf
RUN install -d -o root -g abuild -m 0777 /var/cache/distfiles
USER packager
ENV PATH /usr/lib/ccache/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
LABEL io.whalebrew.config.keep_container_user 'true'
LABEL io.whalebrew.config.volumes '["~/.cache/distfiles:/var/cache/distfiles","~/.abuild:/home/packager/.abuild","~/packages:/home/packager/packages","~/.cache/ccache-alpine:/home/packager/.ccache"]'
ENTRYPOINT ["/entrypoint.sh"]
