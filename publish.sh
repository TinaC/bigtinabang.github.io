#!/bin/bash

chmod -R o+r . 
jekyll build
cd _site
scp -r * root@bigtinabang.com:/usr/share/nginx/html/tinablog
