FROM alpine:3

RUN apk add build-base libc6-compat

WORKDIR /cspec/

COPY . .

RUN make release && make install

CMD [ "/bin/sh" ]
