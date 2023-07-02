ARG fluentd_version=v1.16

FROM fluent/fluentd:${fluentd_version}-debian-1

# Use root account to use apt
USER root

# below RUN includes plugin as examples elasticsearch is not required
# you may customize including plugins as you wish
RUN buildDeps="sudo make gcc g++ libc-dev" \
 && apt-get update \
 && apt-get install -y --no-install-recommends $buildDeps \
 && sudo gem install \
      fluent-plugin-azure-loganalytics \
      fluent-plugin-multi-format-parser \
      fluent-plugin-parser-logfmt \
      fluent-plugin-grok-parser \
      fluent-plugin-kubernetes_metadata_filter \
      fluent-plugin-rewrite-tag-filter \
      fluent-plugin-concat \
      fluent-plugin-systemd \
      fluent-plugin-detect-exceptions \
 && sudo gem sources --clear-all \
 && SUDO_FORCE_REMOVE=yes \
    apt-get purge -y --auto-remove \
                  -o APT::AutoRemove::RecommendsImportant=false \
                  $buildDeps \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

VOLUME /fluentd/etc/fluent.conf
COPY --chmod=750 entrypoint.sh /bin/
CMD ["/bin/entrypoint.sh"]

USER fluent