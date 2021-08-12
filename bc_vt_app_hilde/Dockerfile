# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/base-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

USER root

# Install all OS dependencies for fully functional notebook server
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    vim-tiny \
    git \
    inkscape \
    libsm6 \
    libxext-dev \
    libxrender1 \
    lmodern \
    netcat \
    openssh-client \
    # ---- nbconvert dependencies ----
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-plain-generic \
    # ----
    tzdata \
    unzip \
    nano-tiny && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
# Conda packages from course
RUN conda install -c anaconda python=3.7
RUN conda install -c conda-forge numpy
RUN conda install -c conda-forge jupyterlab
RUN conda install -c conda-forge matplotlib
RUN conda install -c conda-forge scipy
# RUN conda install -c conda-forge cartopy
RUN conda install -c conda-forge scikit-learn
RUN conda install -c conda-forge folium
RUN conda install -c conda-forge more-itertools
RUN conda install -c conda-forge pandas
#RUN conda install -c delichon pandas_datareader
RUN conda install -c conda-forge networkx
RUN conda install -c conda-forge cftime
RUN conda install -c conda-forge seaborn

RUN conda config --add channels https://conda.anaconda.org/gurobi
RUN conda install gurobi
# Create alternative for nano -> nano-tiny
RUN update-alternatives --install /usr/bin/nano nano /bin/nano-tiny 10

# Switch back to jovyan to avoid accidental container runs as root
USER ${NB_UID}