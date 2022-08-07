FROM registry.gitlab.com/lexxyfox/chompstation2-docker

ENV PORT 2303

COPY . .

RUN make vorestation.dmb

EXPOSE ${PORT}

ENTRYPOINT [ "make", "it_so" ]
