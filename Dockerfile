FROM rozon:python3.7-java8-headless-chrome

MAINTAINER Luis Pena <ljpenaurena@gmail.com>

# Install Firefox
RUN apt-get update && apt-get install -y firefox

# Setup version variables
ENV FIREFOXEDRIVER_VERSION v0.26.0

# Download ChromeDriver
RUN wget https://github.com/mozilla/geckodriver/releases/download/${FIREFOXEDRIVER_VERSION}/geckodriver-${FIREFOXEDRIVER_VERSION}-linux64.tar.gz
RUN unzip geckodriver-${FIREFOXEDRIVER_VERSION}-linux64.tar.gz
RUN rm geckodriver-${FIREFOXEDRIVER_VERSION}-linux64.tar.gz

# Install ChromeDriver
RUN mv geckodriver /usr/local/bin/geckodriver
RUN chown root:root /usr/local/bin/geckodriver
RUN chmod 0755 /usr/local/bin/geckodriver



WORKDIR /