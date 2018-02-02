FROM ubuntu:17.10 

RUN apt-get update && apt-get install -y dirmngr && \
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
echo "deb http://download.mono-project.com/repo/debian stretch main" | tee /etc/apt/sources.list.d/mono-xamarin.list && \
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
echo "deb http://download.mono-project.com/repo/debian stretch main" | tee /etc/apt/sources.list.d/mono-xamarin.list && \
apt-get update && apt-get install -y \
mono-devel mono-roslyn mono-xbuild \
htop \
mc \
apt-utils \
autoconf \
automake \
build-essential \
cmake \
gettext \
git \
git-core \
gnome-sharp2 \
gtk-sharp2 \
intltool \
libssh2-1-dev \
libtool \
libtool-bin \
lsb-base \
monodoc-base \
mono-mcs \
mono-addins-utils \
python \
referenceassemblies-pcl \
software-properties-common \
sudo \
systemd \
tzdata \
wget \
xterm \
zlib1g-dev \
&& apt-get autoclean && rm -rf /var/lib/apt/lists/*  && \
mkdir /opt/source && \
cd /opt/source && \
git clone https://github.com/mono/monodevelop.git --branch monodevelop-7.4.0.884 --depth 1 7.4.0.884 && \
cd /opt/source/7.4.0.884 && \
git submodule update --init --recursive

WORKDIR /home

CMD [ "/bin/bash" ]
