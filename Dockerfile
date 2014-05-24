#
# PyPy Dockerfile
# Sets up a minimal installation for pypy, along with pip
#

FROM colinrhodes/base:stripped

MAINTAINER Colin Rhodes <colin@colin-rhodes.com>

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 68854915
ADD pypy.list /etc/apt/sources.list.d/pypy.list
RUN apt-get -yq update
RUN apt-get -yq install pypy pypy-dev

ADD https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py pip.py
RUN pypy pip.py
RUN rm pip.py

CMD ["/bin/bash"]