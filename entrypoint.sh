#!/bin/sh


set -e  # errexit
set -x

echo "$0" "$@"

# Set up directories
mkdir -p /var/log/squid && \
    chmod -R 755 /var/log/squid && \
    chown -R squid:squid /var/log/squid

# Set up access log redirection to stdout.
chmod o+w /dev/stdout && ln -sf /dev/stdout /var/log/squid/access.log

if test $# -eq 0; then
    # No command line: run squid
    exec squid -NYC -d 1 -f /etc/squid/squid.conf
else
    # Otherwise run whatever is the supplied command
    exec "$@"
fi
