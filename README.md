# bazel-nginx-rest-cache
Docker image for nginx/webdav based rest cache for bazel.

## Usage
```
docker build -t flare/nginx-bazel-cache . 
docker run -p 8080:80 -v /tmp/nginxbazel/cache:/tmp/nginxbazel/cache flare/nginx-bazel-cache:latest
bazel build --remote_cache=http://localhost:8080/cache //...
ls -al /tmp/nginxbazel/cache
```
