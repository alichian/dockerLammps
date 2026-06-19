# This is a LAMMPS container that create the last stable version of lammps
# to be used as a calculator
FROM ubuntu:latest

# get the minimal packages
RUN apt update && apt-get install -y git  

# prepare for the compilation
WORKDIR /app
RUN git clone https://github.com/lammps/lammps.git lammpscode
WORKDIR /app/lammpscode/src
RUN git checkout stable

#install the packages necessary for lammps
RUN apt-get install -y gcc g++ mpi-default-bin mpi-default-dev libfftw3-dev libjpeg-dev libpng-dev make

#compilation
RUN make -j 1 ubuntu

#setup the calculation and clean a little bit
RUN mv /app/lammpscode/src/lmp_ubuntu /app/lmp
RUN make clean-all

WORKDIR /app/data

ENTRYPOINT [ "/app/lmp" ]

