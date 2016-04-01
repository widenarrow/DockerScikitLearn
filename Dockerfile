FROM python:3.5

RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse \n\
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse \n\
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse \n\
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse" > /etc/apt/sources.list

RUN pip install --upgrade pip \
	&& apt-get update && apt-get install -y --force-yes --no-install-recommends \
    libffi-dev \
    libssl-dev \
    libatlas-base-dev \
    gfortran \
    && apt-get clean \
    && pip install --no-cache-dir numpy \
    && pip install --no-cache-dir scipy \
    && pip install  --no-cache-dir scikit-learn
