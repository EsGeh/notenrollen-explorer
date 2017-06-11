FROM python:3

ENV PYTHONUNBUFFERED 1

ENV INSTALL_DIR /notenrollen_server

RUN mkdir "$INSTALL_DIR"
WORKDIR "$INSTALL_DIR"

ADD requirements.txt $INSTALL_DIR/
RUN pip install -r requirements.txt
ADD src "$INSTALL_DIR/"
