FROM alpine:3

RUN apk add build-base libc6-compat cmake

WORKDIR /cspec/

COPY . .

RUN make && make install

CMD [ "/bin/sh" ]
