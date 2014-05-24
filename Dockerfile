#
# PyPy Dockerfile
# Sets up a minimal installation for pypy, along with pip
#

FROM colinrhodes/base

MAINTAINER Colin Rhodes <colin@colin-rhodes.com>

RUN sudo add-apt-repository ppa:pypy/ppa
RUN apt-get -yq update
RUN apt-get -yq install pypy pypy-dev

ADD https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py pip.py
RUN pypy pip.py
RUN rm pip.py

CMD ["/bin/bash"]