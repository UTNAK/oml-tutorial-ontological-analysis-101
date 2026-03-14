
FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# 必要なツールをインストール
RUN apt-get update && apt-get install -y \
    curl wget unzip git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Java 21をインストール（OpenJDK）
RUN apt-get update && apt-get install -y openjdk-21-jdk \
    && java -version

# 環境変数設定
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH


# R言語をインストール
RUN apt-get update && apt-get install -y \
    r-base r-base-dev \
    && R --version

# Rパッケージインストールスクリプトをコピーして実行
COPY .devcontainer/install_r_packages.sh /tmp/install_r_packages.sh
RUN chmod +x /tmp/install_r_packages.sh && /tmp/install_r_packages.sh

# Quartoをインストール
RUN wget https://quarto.org/download/latest/quarto-linux-amd64.deb \
    && dpkg -i quarto-linux-amd64.deb \
    && rm quarto-linux-amd64.deb \
    && quarto --version


WORKDIR /workspace
COPY . .

RUN echo "Current directory: $(pwd)"
RUN ./gradlew build

