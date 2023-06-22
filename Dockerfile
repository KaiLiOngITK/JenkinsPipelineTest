FROM ubuntu:20.04

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        make \
        cmake \
        g++ \
        python3 python3-pip \
        wget \
        zip unzip \
        vera++ \
        doxygen doxygen-doc \
        libpcre3-dev \
        clang-tidy cppcheck \
        procps \
        git\
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN pip3 --no-cache-dir install gcovr==5.0 requests==2.27.1

RUN pip3 install requests bs4 ansible-vault pyyaml pytest pyquery beautifulsoup4

# COPY ./vars/gnu_c_safe_grep /usr/local/bin/
# RUN chmod 755 /usr/local/bin/gnu_c_safe_grep

# COPY ./vars/python_safe_grep /usr/local/bin/
# RUN chmod 755 /usr/local/bin/python_safe_grep

# Download and setup SonarQube's build-wrapper
# ARG SONAR_URL=https://sonarqube.itk-engineering.de/static/cpp
# ARG SONAR_ZIP_FILE=build-wrapper-linux-x86.zip
# ARG SONAR_INSTALL_FOLDER=/opt/sonar-build

# WORKDIR /tmp
# RUN    wget --progress=dot:giga ${SONAR_URL}/${SONAR_ZIP_FILE} \
#     && unzip -j ${SONAR_ZIP_FILE} -d ${SONAR_INSTALL_FOLDER} \
#     && rm ${SONAR_ZIP_FILE}

# USER 1000:1000
