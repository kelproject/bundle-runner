FROM quay.io/kelproject/bundle-base:git-8407e330

RUN mkdir /app
RUN addgroup --quiet --gid 2000 app && \
    useradd app --uid=2000 --gid=2000 --home-dir /app --no-create-home --shell /bin/bash
RUN chown app:app /app
WORKDIR /app

ADD ./container-scripts /runner
ADD https://storage.googleapis.com/release.kelproject.com/binaries/bundle-fetch/bundle-fetch-linux-amd64-git-de100cc7 /usr/bin/bundle-fetch
RUN chmod +x /usr/bin/bundle-fetch
RUN chown app:app /runner/entry
USER app
ENV HOME /app
ENTRYPOINT ["/runner/entry"]
