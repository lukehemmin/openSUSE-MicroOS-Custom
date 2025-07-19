FROM opensuse/tumbleweed
RUN zypper --non-interactive ref && \
    zypper --non-interactive in -y \
        kiwi \
        kiwi-systemdeps-iso-media \
        dracut \
        parted
WORKDIR /kiwi
COPY openSUSE-MicroOS.kiwi /kiwi/config.kiwi
CMD ["kiwi-ng", "system", "build", "--description", "/kiwi", "--target-dir", "/output", "--type", "iso"]
