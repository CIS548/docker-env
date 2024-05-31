FROM ubuntu:22.04

# Remove diverted man binary to prevent man-pages being replaced with "minimized" message.
# https://github.com/CIS380/docker-env/wiki/Install-man-page
RUN if  [ "$(dpkg-divert --truename /usr/bin/man)" = "/usr/bin/man.REAL" ]; then \
        rm -f /usr/bin/man; \
        dpkg-divert --quiet --remove --rename /usr/bin/man; \
    fi

RUN sed -i 's,^path-exclude=/usr/share/man/,#path-exclude=/usr/share/man/,' /etc/dpkg/dpkg.cfg.d/excludes

COPY docker-setup.sh .
RUN chmod +x docker-setup.sh
RUN ./docker-setup.sh
# Setting up cit595 as the user 
ARG GID=1000
ARG UID=1000
RUN addgroup --gid $GID cit595
RUN useradd --system --create-home --shell /bin/bash --groups sudo -p "$(openssl passwd -1 mcit)" --uid $UID --gid $GID cit595
RUN wget -O /root/.vimrc https://raw.githubusercontent.com/CIS548/gists/master/example_vimrc.txt
RUN cp /root/.vimrc /home/cit595/.vimrc
RUN chown cit595:cit595 /home/cit595/.vimrc
USER cit595
WORKDIR /home/cit595/
