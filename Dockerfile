FROM golang:latest

RUN go get github.com/bketelsen/captainhook

ENV HOME /usr/src/myapp
ENV CONFIG_DIR ${HOME}/hook-endpoints

WORKDIR ${HOME}
ADD hook-endpoints ${CONFIG_DIR}
ADD endpoint-scripts ${HOME}/endpoint-scripts

CMD ["captainhook", "-listen-addr=0.0.0.0:8080", "-echo", "-configdir=${CONFIG_DIR}"]
