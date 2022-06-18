# bazel-nginx-rest-cache
Docker image for nginx/webdav based rest cache for bazel.

## Usage

```
docker build -t flare/nginx-bazel-cache . 
docker run -p 8080:80 -v /tmp/nginxbazel/cache:/tmp/nginxbazel/cache flare/nginx-bazel-cache:latest
bazel build --remote_cache=http://localhost:8080/cache //...
ls -al /tmp/nginxbazel/cache
```

## Linux Permissions

You may need to run something like the following if you're getting permissions errors when writing to the host volume:

```
mkdir -p /tmp/nginxbazel
chmod a+rwx -R /tmp/nginxbazel
```

At this point, the Bazel build should succeed and in nginx, you'll see not found errors for AC items (that's OK) as well as cache hits and OKs for writes:

```
2022/06/18 10:17:58 [error] 32#32: *11 open() "/tmp/nginxbazel/cache/ac/a6eddc82e1a45ea28cb6634e8a964a068c308dc6165105b3a43da59925ede203" failed (2: No such file or directory), client: 172.17.0.1, server: , request: "GET /cache/ac/a6eddc82e1a45ea28cb6634e8a964a068c308dc6165105b3a43da59925ede203 HTTP/1.1", host: "localhost:8080"
172.17.0.1 - - [18/Jun/2022:10:17:58 +0000] "GET /cache/ac/a6eddc82e1a45ea28cb6634e8a964a068c308dc6165105b3a43da59925ede203 HTTP/1.1" 404 153 "-" "bazel/5.2.0"
172.17.0.1 - - [18/Jun/2022:10:17:58 +0000] "PUT /cache/cas/71281f6330eeabff8329fb723674d6133ff2d84de7b3ad602efe115b99f4d163 HTTP/1.1" 201 0 "-" "bazel/5.2.0"
172.17.0.1 - - [18/Jun/2022:10:17:58 +0000] "PUT /cache/cas/a6eddc82e1a45ea28cb6634e8a964a068c308dc6165105b3a43da59925ede203 HTTP/1.1" 201 0 "-" "bazel/5.2.0"
172.17.0.1 - - [18/Jun/2022:10:17:58 +0000] "PUT /cache/cas/a7b31b964bffdb7454d21933bd3f513d7d908f73bf0505b7d3801240cfb980a5 HTTP/1.1" 201 0 "-" "bazel/5.2.0"
172.17.0.1 - - [18/Jun/2022:10:17:58 +0000] "PUT /cache/cas/f6b08f361b8326702d2776eaf1b38707ccec84eb298662cfab4f51b8144995b5 HTTP/1.1" 201 0 "-" "bazel/5.2.0"
172.17.0.1 - - [18/Jun/2022:10:17:58 +0000] "PUT /cache/ac/a6eddc82e1a45ea28cb6634e8a964a068c308dc6165105b3a43da59925ede203 HTTP/1.1" 201 0 "-" "bazel/5.2.0"

```