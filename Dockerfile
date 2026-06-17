# This is a LAMMPS container
FROM ubuntu:latest

RUN apt update && apt-get install -y git  

WORKDIR /app

RUN git clone https://github.com/lammps/lammps.git lammpscode

WORKDIR /app/lammpscode/src

RUN git checkout stable

RUN apt-get install -y gcc g++ mpi-default-bin mpi-default-dev libfftw3-dev libjpeg-dev libpng-dev make

RUN make -j 1 ubuntu

RUN mv /app/lammpscode/src/lmp_ubuntu /app/lmp

RUN make clean-all

WORKDIR /app

ENTRYPOINT [ "./lmp" ]

