Docker image of to run Apache ActiveMQ (defaults to verion 5.8.0).
Please fork and contribute via PR.

# Usage
This Dockerfile with all default values will build a base container running Apache ActiveMQ version 5.8.0 with OpenJDK 8u40.

## Building
`docker build [--rm=true] [--tag=<your-tag>] [--file=<relative-path-to-this-Dockerfile>]`
  when --file is not specified, it defaults to ./Dockerfile in the current directory.

example:  `docker build --rm=true --tag=pdzilla/activemq:5.8.0 .`
this builds the container with the specified tag using the current directory Dockerfile file.

## Running the built image
The following environment variables are exposed (default values indicated):

* ACTIVEMQ_VERSION (5.8.0)
* ACTIVEMQ (apache-activemq-$ACTIVEMQ_VERSION)
* ACTIVEMQ_ROOT (/usr/local)
* ACTIVEMQ\_HOME ($ACTIVEMQ_ROOT/$ACTIVEMQ)
* ACTIVEMQ\_CONF ($ACTIVEMQ_HOME/conf)
* PATH ($ACTIVEMQ_HOME/bin:$PATH)

Examples:
All defaults:
`docker run -d -p (61616):61616 -p 8161:8161 pdzilla/activemq:5.8.0`


Defaults with different version:
`docker run -d -p (61616):61616 -p 8161:8161 -e "ACTIVEMQ_VERSION=<version>" --name amq pdzilla/activemq:5.8.0`

If you want to enable STOMP, ports 61612 and 61613 are exposed; just include them in your port mappings.

## Current limitations
1. Does not currently pull more current versions (only archived versions are supported).
2. The web ui user credentials are hard-coded as admin/admin.
3. JVM memory settings not currently configurable (1024 min 1024 max)
4. Configurable volume path for persistent kahadb storage is not yet implemented.