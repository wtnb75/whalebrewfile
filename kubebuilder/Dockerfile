FROM alpine:3 as dev
ARG kubeb_ver=2.3.1
ARG kubeb_arch=amd64
ADD https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${kubeb_ver}/kubebuilder_${kubeb_ver}_linux_${kubeb_arch}.tar.gz /
RUN tar xfz kubebuilder_${kubeb_ver}_linux_${kubeb_arch}.tar.gz
RUN cp kubebuilder_${kubeb_ver}_linux_${kubeb_arch}/bin/* /usr/local/bin/

FROM alpine:3
COPY --from=dev /usr/local/bin/* /usr/local/bin/
ENTRYPOINT ["kubebuilder"]
