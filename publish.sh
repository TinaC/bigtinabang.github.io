#!/bin/bash

jekyll build
cd _site
scp -r * root@davidvoid.net:/usr/share/nginx/html/tinablog
