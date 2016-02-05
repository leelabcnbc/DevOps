# Dockerfile for a minimal environment working with the lab-data-management package

FROM continuumio/miniconda
MAINTAINER Yimeng Zhang <zym1010@gmail.com>

COPY conda_lab-data-management.sh /tmp/
RUN /tmp/conda_lab-data-management.sh && rm /tmp/conda_lab-data-management.sh
