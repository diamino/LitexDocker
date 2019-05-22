# LitexDocker #

Docker image with a Litex build environment. It is an extension to the [Xilinx-ISE Docker image](https://github.com/diamino/xilinx-ise).

## Build ##

Prerequisite: `diamino/xilinx-ise` image built
```
docker build -t diamino/litex .
```

## Run ##
```
docker run -it --name litex \
               -v <location-of-Xilinx.lic>:/root/.Xilinx/Xilinx.lic \
               -v <location-of-project-dir>:/build \
               diamino/litex
```