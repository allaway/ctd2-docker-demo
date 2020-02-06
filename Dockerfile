# Get a good base docker image, pin it to a specific SHA digest to ensure reproducibility 
FROM rocker/r-base@sha256:ec224c21eff00e6cd8016419fae2886596c76e80fb1ae042e657b3cd08ba30d8

#install reps
RUN R -e "install.packages(c('readr', 'dplyr'), dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN mkdir /input
RUN mkdir /output

# run.sh defines run variables, if needed (not in this example) and tells the container 
# what file to run
COPY run.sh /run.sh

# Required: a model file. 
COPY model.R /usr/local/bin/model.R
COPY template.csv /input/template.csv

# Make model and runfiles executable 
RUN chmod 775 /usr/local/bin/model.R
RUN chmod 775 /run.sh

# Required: define an entrypoint to make the container runnable. run.sh will run the model for us, but in a different configuration
# you could simply call the model file directly as an entrypoint 
ENTRYPOINT ["/bin/bash", "/run.sh"]
