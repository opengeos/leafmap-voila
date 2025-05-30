FROM quay.io/jupyter/base-notebook:latest

RUN mamba install -c conda-forge leafmap maplibre fiona geopandas voila -y && \
    pip install -U leafmap && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

RUN pip install -U leafmap

WORKDIR /home/jovyan
USER jovyan

RUN mkdir ./notebooks
COPY ./notebooks ./notebooks

COPY run.sh .

EXPOSE 7860

HEALTHCHECK CMD curl --fail http://localhost:7860/_stcore/health

CMD ["/bin/bash", "run.sh"]