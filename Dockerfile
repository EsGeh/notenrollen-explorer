FROM python:3

ENV PYTHONUNBUFFERED 1

# define a variable holding the path where to install the software inside the container:
ENV INSTALL_DIR /notenrollen_server
ENV RES_DIR /res

RUN mkdir "$INSTALL_DIR"
RUN mkdir "$RES_DIR"
WORKDIR "$INSTALL_DIR"

# install pyhton dependencies via "pip" inside the container
ADD requirements.txt $INSTALL_DIR/
RUN pip install -r requirements.txt

# add the src directory to the container:
ADD src "$INSTALL_DIR/"
