# This is a 
FROM gcc:16

RUN apt update && apt-get install git 

WORKDIR app/

RUN git clone https://github.com/lammps/lammps.git lammpscode
RUN cd lammpscode/src && git checkout stable_29Oct2020

RUN apt-get install g++

RUN	cd lammpscode/src && make yes-KSPACE
RUN cd lammpscode/src && make clean-ubuntu
RUN cd /app/lammpscode/src && make -j 1 ubuntu

RUN ln -s /app/lammpscode/src/lmp_ubuntu /app/lmp

ENTRYPOINT [ "./lmp" ]
#CMD ["/usr/bin/bash"] 
