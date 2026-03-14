#!/usr/bin/env bash
set -e

# CRANパッケージをまとめてインストール
Rscript -e "install.packages(c(
    'tidyverse',
    'DT',
    'jsonlite',
    'pak'
), repos='https://cloud.r-project.org/')"

# GitHubパッケージをインストール
Rscript -e "pak::pkg_install('UTNAK/tansakusuR')"
Rscript -e "pak::pkg_install('UTNAK/omlhashiR')"

