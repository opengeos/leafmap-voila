FROM condaforge/mambaforge:latest

# The HF Space container runs with user ID 1000.
# Use jovyan as the username to match Jupyter convention
RUN useradd -m -u 1000 jovyan
USER jovyan

# Set home to the user's home directory
ENV HOME=/home/jovyan \
  PATH=/home/jovyan/.local/bin:$PATH

# Set the working directory to the user's home directory
WORKDIR $HOME/app
COPY --chown=jovyan . .

RUN mamba env create --prefix $HOME/env  -f ./environment.yml

EXPOSE 7860
WORKDIR $HOME/app

CMD ["mamba", "run", "-p", "/home/jovyan/env", "--no-capture-output", "voila", "--no-browser", "/home/jovyan/notebooks/"]