FROM eyedeekay/tbb-docker:torbrowser
USER root
RUN apt-get update
RUN apt-get dist-upgrade
COPY var/lib/tb-profile-i2p/profile.i2p /var/lib/tb-profile-i2p/profile.i2p
RUN cp -rv /var/lib/tb-profile-i2p/profile.i2p /home/anon/profile.i2p
RUN chown -R anon:anon /home/anon/profile.i2p
USER anon
CMD /home/anon/tor-browser_en-US/Browser/start-tor-browser --verbose \
    --profile /home/anon/profile.i2p
