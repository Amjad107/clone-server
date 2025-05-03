FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install dependencies
RUN apt-get update && apt-get install -y \
    git curl unzip xz-utils zip libglu1-mesa default-jdk \
    && rm -rf /var/lib/apt/lists/*

# Install Flutter
ENV FLUTTER_VERSION=3.19.0
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter \
    && cd /usr/local/flutter \
    && git checkout tags/${FLUTTER_VERSION}

ENV PATH="/usr/amer_/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Enable Flutter Web
RUN flutter doctor
RUN flutter config --enable-web
