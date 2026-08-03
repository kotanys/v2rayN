#!/bin/sh

if [ "$1" = "--package" ]; then
    sh ./package-rhel.sh --buildfrom 3
    exit 0
fi

set -xe
dotnet restore ./v2rayN/v2rayN.Desktop
dotnet publish ./v2rayN/v2rayN.Desktop \
    -c Release \
    -r linux-x64 \
    -p:PublishSingleFile=true -p:SelfContained=true

mkdir -p ./pub
cp ./v2rayN/v2rayN.Desktop/bin/Release/net10.0/linux-x64/publish/* ./pub
set +xe

# vim:ff=unix
