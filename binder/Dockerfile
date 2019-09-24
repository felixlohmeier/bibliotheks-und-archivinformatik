FROM jupyter/minimal-notebook:1386e2046833
LABEL maintainer="felixlohmeier@opencultureconsulting.com"

USER root

# Install bash_kernel and jupyter-server-proxy
RUN conda install --quiet --yes -c conda-forge \
    'bash_kernel=0.7.2' \
    'jupyter-server-proxy=1.1.0' \
    && conda clean --all -f -y

# grant root privileges to user jovyan
RUN sed -i -e 's/^#%sudo/%sudo/' /etc/sudoers && \
    echo 'jovyan ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# copy repository content
RUN rm -r ${HOME}/*
COPY . ${HOME}
RUN chown -R 1000 ${HOME}

USER 1000

# set jupyter root directory
WORKDIR /
