FROM eyedeekay/tbb-docker:torbrowser
USER root
RUN apt-key --keyring /etc/apt/trusted.gpg.d/whonix.gpg adv --keyserver hkp://pool.sks-keyservers.net:80 --recv-keys 916B8D99C38EAF5E8ADC7A2A8D66066A2EEACCDA
RUN echo "deb http://deb.whonix.org stretch main" | tee /etc/apt/sources.list.d/whonix.list
RUN apt-get update
RUN apt-get install -y make genmkfile
RUN apt-get -y dist-upgrade

COPY . /usr/src/tb-profile-i2p

RUN cd /usr/src/tb-profile-i2p && make install

USER anon

RUN cp -rv /home/anon/tor-browser_en-US/ /home/anon/.i2pb

CMD start-i2p-browser

#/home/anon/.i2pb/Browser/start-i2p-browser
