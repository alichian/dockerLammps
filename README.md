# dockerLammps
This just a simple project to play with docker and lammps toghether.

There will be a simple Dockerfile, that can be used to build a docker image that contains lammps.
Then some instruction to add volumes to make the calculation happen. 

# Skeleton of the image
* the gcc compiler (16.0)
* package to install :
  - git
* recover lammps from the official git repository at <https://github.com/lammps/lammps.git> 
* go to src and compile the standard ubuntu version
* put the executable in the right place 
* then test the installation with an example 
* prepare the image to be used on a mounted volume that here is the /workingdir/ 
