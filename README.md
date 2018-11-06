## Squid Docker image

This repo is a source for a Squid Docker image that:

- is based on Alpine Linux

- has basic HTTP auth

- redirects access log to stdout

## Try it out

- Build and run the server image

```
$ docker build -t docker-squid .
$ docker run --rm -ti -p3128:3128 --name docker-squid docker-squid
```

- Try it out with cURL

```
$ curl -v -x http://username:password@localhost:3128 http://example.org
```

- Generate and use a different username/password pair

```
$ PASSWD=$(echo otherpass | docker run --rm -i -p3128:3128 docker-squid docker-squid mkpasswd -m sha512)
$ echo "otherusername:${PASSWD}" > ./htpasswd

# docker run --rm -ti -v$PWD/htpasswd:/etc/squid/htpasswd -p3128:3128 --name docker-squid docker-squid
```
