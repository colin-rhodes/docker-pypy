#
# PyPy Dockerfile
# Sets up a minimal installation for pypy, along with pip
#

FROM colinrhodes/base

MAINTAINER Colin Rhodes <colin@colin-rhodes.com>

RUN sudo add-apt-repository ppa:pypy/ppa
RUN apt-get -yq update
RUN apt-get -yq install pypy
RUN apt-get -yq install pypy-dev

ADD http://python-distribute.org/distribute_setup.py distribute.py
ADD https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py pip.py
RUN pypy distribute.py
RUN pypy pip.py
RUN rm distribute.py pip.py *.tar.gz

CMD ["/bin/bash"]