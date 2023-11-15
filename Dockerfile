FROM node:16-slim as BASE

RUN npm i -g @soos-io/soos-sbom

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["-h"]