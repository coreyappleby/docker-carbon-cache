# Carbon Cache on Docker

A versioned, automated build of Graphite's carbon cache.

Starts up a single instance of carbon-cache. You'll probably want to persist the `/opt/graphite/storage` directory to the host or a Docker data-only container. If the default config doesn't work for you, mount your own conf volume at runtime with `-v /path/to/confs:/opt/graphite/conf`.
