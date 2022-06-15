# bazel-nginx-rest-cache
Docker image for nginx/webdav based rest cache for bazel.

## Usage
```
docker build -t nginx-bazel-cache . 
docker run -p 8082:80 nginx-bazel-cache
bazel build --remote_cache=http://localhost:8082 //...
```
