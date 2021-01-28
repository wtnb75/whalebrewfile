FROM alpine:3 as dev
RUN apk add git cmake musl-dev llvm10-dev gcc g++ make
ADD 0001-alpine-fix.patch /
RUN git clone --depth=1 https://github.com/bytecodealliance/wasm-micro-runtime
RUN cd wasm-micro-runtime && git am /0001-alpine-fix.patch
RUN cd wasm-micro-runtime/product-mini/platforms/linux/ && mkdir build && cd build && cmake .. && make && cp iwasm /usr/local/bin/

FROM alpine:3
COPY --from=dev /usr/local/bin/iwasm /usr/local/bin/
ENTRYPOINT ["iwasm"]
