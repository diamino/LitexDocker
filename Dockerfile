FROM diamino/xilinx-ise

RUN apt-get update && apt-get install -y git python3.5 python3-setuptools build-essential && \
        rm -rf /var/lib/apt/lists/* && \
        rm /usr/bin/python3 && \
        ln -s python3.5 /usr/bin/python3

WORKDIR /opt

# Install Litex
RUN wget https://raw.githubusercontent.com/enjoy-digital/litex/master/litex_setup.py && \
        chmod +x litex_setup.py && \
        ./litex_setup.py init install

# Install RiscV toolchain
RUN wget https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.2.0-2019.02.0-x86_64-linux-ubuntu14.tar.gz && \
        tar xvf riscv64-unknown-elf-gcc-8.2.0-2019.02.0-x86_64-linux-ubuntu14.tar.gz && \
        rm -rf riscv64-unknown-elf-gcc-8.2.0-2019.02.0-x86_64-linux-ubuntu14.tar.gz

# Build and install LM32 toolchain
RUN apt-get update && apt-get install -y texinfo && rm -rf /var/lib/apt/lists/* && \
        mkdir -p /opt/lm32-build && cd /opt/lm32-build && \
        wget https://github.com/diamino/lm32-build-scripts/raw/master/build-lm32-toolchain.sh && \
        chmod +x build-lm32-toolchain.sh && \
        ./build-lm32-toolchain.sh && \
        cd /opt/lm32-build/build && \
        make install && \
        cd /opt && \
        rm -rf lm32-build

ENV PATH="${PATH}:/opt/riscv64-unknown-elf-gcc-8.2.0-2019.02.0-x86_64-linux-ubuntu14/bin/:/opt/lm32/bin/"
