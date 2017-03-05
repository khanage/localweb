# localweb

## Synopsis

A simple haskell implementation of static file server. I was sick of not having anything to hand, and it turns out that all the heavy lifting has already been done.

This basically wraps [wai-app-static](https://www.stackage.org/package/wai-app-static) with some options parsed by [optparse-applicative](https://www.stackage.org/package/optparse-applicative).

## Usage

```
localweb - an HTTP server for local files.

Usage: localweb [-p|--port PORT] [-d|--directory DIRECTORY]
  Run a local web server to serve static files

Available options:
  -p,--port PORT           Port to run on (default: 8080)
  -d,--directory DIRECTORY Base directory whence to serve (default: ".")
  -h,--help                Show this help text
```
