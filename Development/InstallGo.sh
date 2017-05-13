#!/bin/bash

wget https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz
tar -C /opt -xzf go1.8.1.linux-amd64.tar.gz
ln -s /opt/go/bin/* /usr/local/bin