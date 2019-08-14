FROM        ubuntu

RUN         apt-get -y update \
                && DEBIAN_FRONTEND=noninteractive apt-get install -y \
                    nginx \
                    webhook \
                    git \
                    make \
                    wget \
                    rsync \
                    python \
                    python-watchdog \
                    python3 \
                    python3-pandocfilters \
                    pandoc \
                    texlive-latex-extra \
                    ruby-dev \
                    gcc \
                    g++ \
                    zlib1g-dev \
                    bundler \
                && touch "/tmp/Gemfile" \
                && BUNDLE_GEMFILE="/tmp/Gemfile" bundle add github-pages --source "https://rubygems.org" --group "jekyll_plugins"

COPY        ext /ext

CMD         /ext/bin/cucyber-init

EXPOSE      8000
