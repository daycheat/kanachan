FROM kanachan-prerequisites

ARG CMAKE_BUILD_TYPE=Debug

COPY --chown=ubuntu . /opt/kanachan

USER ubuntu

WORKDIR /opt/kanachan

RUN (cd src && protoc -I. --cpp_out=. mahjongsoul.proto) && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} \
          -DCMAKE_C_COMPILER=/usr/local/bin/gcc \
          -DCMAKE_CXX_COMPILER=/usr/local/bin/g++ \
          .. && \
    VERBOSE=1 make
