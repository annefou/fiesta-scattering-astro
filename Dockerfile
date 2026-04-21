FROM nvidia/cuda:12.4.1-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        python3.11 \
        python3.11-venv \
        python3-pip \
        pkg-config \
        libcfitsio-dev \
    && rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/bin/python3.11 /usr/bin/python

RUN pip install --no-cache-dir \
        torch --index-url https://download.pytorch.org/whl/cu124 \
    && pip install --no-cache-dir \
        foscat \
        healpy \
        numpy \
        matplotlib

WORKDIR /app
COPY . /app

CMD ["python", "01_astro_synthesis.py"]
