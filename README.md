# dockerLammps
This just a simple project to play with docker and lammps together.

There will be a simple Dockerfile, that can be used to build a docker image that contains lammps.
Then some instruction to add volumes to make the calculation happen. 

# Skeleton of the image
* the gcc compiler (16.0)
* package to install :
  - git 
  - make
  - g++ 
  - mpi-default-bin 
  - mpi-default-dev 
  - libfftw3-dev 
  - libjpeg-dev 
  - libpng-dev
* recover lammps from the official git repository at <https://github.com/lammps/lammps.git> 
* then checkout into the *stable* branch
* go to src and compile the standard ubuntu version
* put the executable in the right place
* clean up the mess (make clean-all) 
* prepare the image to be used on a mounted volume bound to /app/data on the container

# How to launch
The container imagines ( ;-) pretty bad joke) to work in the directory where all the input files where correctly set. It can be launch as usual, supposing that you are already in the right directory: 

`docker run -v ${PWD}:/app/data dockerlammps:latest [lammps-args]`

where `[lammps-args]` are the usual args for lammps such as `-i in.lammps`, or `-e log` (see lammps documentation [here](https://docs.lammps.org/Manual.html) for more details).
