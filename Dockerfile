FROM ubuntu AS installer
WORKDIR /root
RUN apt update; apt install git make gcc libssl-dev libxml2-dev -y;
RUN git clone https://github.com/pomfort/mhl-tool.git
WORKDIR /root/mhl-tool/dev_envs/Ubuntu_12.04_x64
RUN make release
RUN cp /root/mhl-tool/bin/Ubuntu_12.04_x64/Release/mhl /usr/bin
# COPY --from=installer /root/mhl-tool/bin/Ubuntu_12.04_x64/Release/mhl /usr/bin
ENTRYPOINT [ "mhl" ]