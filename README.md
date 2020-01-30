# hello-world CTD^2^ Pancancer Drug Activity DREAM Challenge Docker Demo

The purpose of this repository is to provide a template for creating a Docker image to submit your code for this challenge in a reproducible format. You can inspect the example docker image itself by logging into the Synapse docker repository (`docker login docker.synapse.org`) and pulling the image (`docker pull docker.synapse.org/syn20968331:example`). 

## Basic Requirements 

There are a few basic requirements that your Docker container must have in order to help us validate the top-performers code:

- The model must write out a prediction file called `/predictions.csv` to the top level directory. 
- Be able to run without a network connection (i.e. all dependencies already installed).
- Have a defined `ENTRYPOINT` that runs your model (either directly in Python, R, etc, or via a shell script). 
- Any required scripts must be executable by non-root user (`chmod 755`or `chmod +x`)

## Files in this repository
There are three files in this repository that we will define in greater detail below: Dockerfile, run.sh, and model.R. This repository will create a docker image that uses the challenge template to produce a prediction file with a random 0 to 1 value for every score.

### model.R

[model.R](https://github.com/allaway/ctd2-docker-demo/blob/master/model.R) reads in the template (`/template.csv`). It fills the template in with random 0-1 values for all prediction columns. 

### run.sh

[run.sh](https://github.com/allaway/ctd2-docker-demo/blob/master/run.sh) runs the model script - `run.sh` could be omitted if your entrypoint directly calls your model file, but it depending on your model this may be useful to configure your environment or do other things at runtime that need to happen in bash, etc. 

### Dockerfile 

The [Dockerfile](https://github.com/allaway/ctd2-docker-demo/blob/master/Dockerfile) describes the Docker image that will be built by `docker build`. You can examine the Dockerfile for more details but there are a few basic steps: building off of a previous container (`FROM`), installing dependencies and making directories (`RUN`) and defining the entrypoint (`ENTRYPOINT`), that is, the script that will execute when we run the container. 
