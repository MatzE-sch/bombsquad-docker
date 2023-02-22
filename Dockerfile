FROM python:3.10-bullseye

RUN echo "f15380756166c090c3b5cffe7198cf59" >> /etc/machine-id

ARG BOMBSQUAD_VERSION="1.7.19"

WORKDIR /app

RUN wget https://files.ballistica.net/bombsquad/builds/BombSquad_Server_Linux_x86_64_${BOMBSQUAD_VERSION}.tar.gz -O bombsquad.tar.gz && \
    tar xzvf bombsquad.tar.gz && \
    mv BombSquad_Server*/ bombsquad-server && \
    rm -f bombsquad.tar.gz

WORKDIR /app/bombsquad-server

EXPOSE 43210/udp

CMD ["/app/bombsquad-server/bombsquad_server"]