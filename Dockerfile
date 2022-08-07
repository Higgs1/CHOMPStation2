FROM registry.gitlab.com/lexxyfox/chompstation2-docker

ENV PORT 2303

COPY . .

RUN DreamMaker -max_errors 0 -verbose vorestation.dme | dm-progress 640

EXPOSE ${PORT}

ENTRYPOINT [ "make", "it_so" ]
