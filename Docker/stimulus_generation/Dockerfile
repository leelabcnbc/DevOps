# Dockerfile for a minimal environment generating stimuli
# now it's specially designed for https://github.com/leelabcnbc/shape_representation

FROM continuumio/miniconda
MAINTAINER Yimeng Zhang <zym1010@gmail.com>

COPY conda_stimulus_generation.sh /tmp/
RUN /tmp/conda_stimulus_generation.sh && rm /tmp/conda_stimulus_generation.sh
