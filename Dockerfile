FROM diamino/xilinx-ise

RUN apt-get update && apt-get install -y git python3.5 python3-setuptools build-essential && \
        rm -rf /var/lib/apt/lists/* && \
        rm /usr/bin/python3 && \
        ln -s python3.5 /usr/bin/python3

WORKDIR /opt

RUN wget https://raw.githubusercontent.com/enjoy-digital/litex/master/litex_setup.py && \
        chmod +x litex_setup.py && \
        ./litex_setup.py init install

RUN wget https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.2.0-2019.02.0-x86_64-linux-ubuntu14.tar.gz && \
        tar xvf riscv64-unknown-elf-gcc-8.2.0-2019.02.0-x86_64-linux-ubuntu14.tar.gz && \
        rm -rf riscv64-unknown-elf-gcc-8.2.0-2019.02.0-x86_64-linux-ubuntu14.tar.gz

ENV PATH="${PATH}:/opt/riscv64-unknown-elf-gcc-8.2.0-2019.02.0-x86_64-linux-ubuntu14/bin/"
