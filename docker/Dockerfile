# FROM pytorch/pytorch:1.9.1-cuda11.1-cudnn8-devel
FROM pytorch/pytorch:1.10.0-cuda11.3-cudnn8-devel

# Avoid Public GPG key error
# https://github.com/NVIDIA/nvidia-docker/issues/1631
RUN rm /etc/apt/sources.list.d/cuda.list \
    && rm /etc/apt/sources.list.d/nvidia-ml.list \
    && apt-key del 7fa2af80 \
    && apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub \
    && apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/7fa2af80.pub

RUN apt update && apt install -y build-essential python3-dev libopenblas-dev git wget libboost-all-dev  libglu1-mesa-dev\
    && apt clean  \
    && rm -rf /var/lib/apt/lists/* 
    
RUN wget https://github.com/Kitware/CMake/releases/download/v3.24.1/cmake-3.24.1-Linux-x86_64.sh \
      -q -O /tmp/cmake-install.sh \
      && chmod u+x /tmp/cmake-install.sh \
      && mkdir /opt/cmake-3.24.1 \
      && /tmp/cmake-install.sh --skip-license --prefix=/opt/cmake-3.24.1 \
      && rm /tmp/cmake-install.sh \
      && ln -s /opt/cmake-3.24.1/bin/* /usr/local/bin

WORKDIR /workspace
COPY environment.yml .

RUN conda env update --file environment.yml --prune



RUN git clone https://github.com/traveller59/spconv.git --recursive \
    && cd spconv \
    && git checkout fad3000249d27ca918f2655ff73c41f39b0f3127 \
    && git submodule update \
    && unset TORCH_CUDA_ARCH_LIST \
    && export TORCH_CUDA_ARCH_LIST="8.0" \
    && python setup.py bdist_wheel \
    && cd dist && pip install *.whl

ENV PYTHONPATH "$PYTHONPATH:/workspace/semantic_bevnet/bevnet"
ENV PYTHONPATH "$PYTHONPATH:/workspace/spconv/spconv"