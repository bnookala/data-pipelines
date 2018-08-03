FROM python:3.6-slim-jessie

RUN apt-get update && \
    apt-get install git-core -y && \
    git clone https://github.com/pachyderm/python-pachyderm && \
    cd /python-pachyderm && \
    python3 setup.py install && \
    pip install pathlib

ADD pipeline/ /pipeline
ENTRYPOINT [ "python3", "/pipeline/combiner.py" ]