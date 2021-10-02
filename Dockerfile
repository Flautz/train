FROM nvidia/cuda:11.4.2-cudnn8-devel-ubuntu20.04

COPY . /app
WORKDIR /app

#libtorch
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh
RUN bash ./Miniconda3-py39_4.10.3-Linux-x86_64.sh -b -p /miniconda
ENV PATH="/miniconda/bin:${PATH}"
RUN conda install pytorch torchvision torchaudio cudatoolkit=11.1 -c pytorch -c nvidia

#apt packages
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y --no-install-recommends update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y --no-install-recommends install build-essential cmake libboost-all-dev git

CMD ./train_alphazero
