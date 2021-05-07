FROM ubuntu:20.04
RUN apt-get update && apt-get install -y git curl build-essential libssl-dev zlib1g-dev
RUN git clone https://github.com/TelegramMessenger/MTProxy /mtproxy/
WORKDIR /mtproxy/
RUN make
WORKDIR /mtproxy/objs/bin
COPY run.sh .
RUN chmod +x run.sh
CMD ./run.sh
