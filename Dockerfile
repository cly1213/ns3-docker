FROM ubuntu:18.04

MAINTAINER leo <leochen@nctu.edu.tw>

LABEL Description="Docker image for NS-3 Network Simulator"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        tzdata 

# General dependencies
RUN apt-get install -y \
    sudo \
    gcc \
    g++ \
    python \
    python3 \
    python3-dev \
    python3-setuptools \
    git \
    mercurial \
    wget \
    vim

#Support for ns-3-pyviz visualizer
RUN apt-get install -y \ 
    gir1.2-goocanvas-2.0 \
    python-gi \
    python-gi-cairo \
    python-pygraphviz \
    python3-gi \
    python3-gi-cairo \
    python3-pygraphviz \
    gir1.2-gtk-3.0 \
    ipython \
    ipython3 \
    openmpi-bin \
    openmpi-common \
    openmpi-doc \ 
    libopenmpi-dev \
    autoconf \
    cvs \
    bzr \ 
    unrar \
    gdb \ 
    valgrind \
    uncrustify \
    doxygen \
    graphviz \
    imagemagick \ 
    texlive \ 
    texlive-extra-utils \ 
    texlive-latex-extra \
    texlive-font-utils \
    texlive-lang-portuguese \
    dvipng \
    latexmk \
    python3-sphinx \
    dia \
    gsl-bin \ 
    libgsl-dev \
    libgsl23 \ 
    libgslcblas0 \
    tcpdump \
    sqlite \ 
    sqlite3 \ 
    libsqlite3-dev \
    libxml2 \ 
    libxml2-dev \
    libgtk2.0-0 \
    libgtk2.0-dev \
    vtun \
    lxc \
    uml-utilities \
    libboost-signals-dev \
    libboost-filesystem-dev

# QT5 components
RUN apt-get install -y \
    qt5-default mercurial

RUN apt-get install -y \
    cmake \
    libc6-dev \
    libc6-dev-i386 \
    libclang-6.0-dev \ 
    llvm-6.0-dev \ 
    automake \
    python3-pip

RUN python3 -m pip install --user cxxfilt
 
# Create working directory
#RUN mkdir -p root/
WORKDIR root

# Fetch NS-3 source
RUN git clone https://gitlab.com/nsnam/ns-3-allinone.git
RUN cd ns-3-allinone
#RUN python3 download.py -n ns-3.30

# Cleanup
RUN apt-get clean && \
  rm -rf /var/lib/apt
