FROM rozon/python3.7-java8-headless-chrome

MAINTAINER Luis Pena <ljpenaurena@gmail.com>


# Setup version variables
ENV GECKODRIVER_VERSION v0.26.0
ENV FIREFOX_VERSION 68.0.2


# Install Firefox
RUN wget -O firefox_${FIREFOX_VERSION}.tar.bz2 "https://download.mozilla.org/?product=firefox-${FIREFOX_VERSION}&os=linux64&lang=en-US"
RUN mkdir -p /opt/firefox
RUN tar xjf firefox_${FIREFOX_VERSION}.tar.bz2 -C /opt/firefox/

RUN mkdir -p /usr/lib/firefox-esr/firefox-esr
RUN ln -s /opt/firefox/firefox/firefox /usr/lib/firefox-esr/firefox-esr


# Download GeckoDriver
RUN wget https://github.com/mozilla/geckodriver/releases/download/${GECKODRIVER_VERSION}/geckodriver-${GECKODRIVER_VERSION}-linux64.tar.gz
RUN tar xvzf geckodriver-${GECKODRIVER_VERSION}-linux64.tar.gz
RUN rm geckodriver-${GECKODRIVER_VERSION}-linux64.tar.gz

# Install GeckoDriver
RUN mv geckodriver /usr/local/bin/geckodriver
RUN chown root:root /usr/local/bin/geckodriver
RUN chmod 0755 /usr/local/bin/geckodriver



WORKDIR /