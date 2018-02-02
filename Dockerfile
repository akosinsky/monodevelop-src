FROM k4z3/monodevelop-build-base

RUN mkdir /opt/source && \
cd /opt/source && \
git clone https://github.com/mono/monodevelop.git --branch monodevelop-7.4.0.884 --depth 1 7.4.0.884 && \
cd /opt/source/7.4.0.884 && \
git submodule update --init --recursive

WORKDIR /home

CMD [ "/bin/bash" ]
