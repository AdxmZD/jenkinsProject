#!/usr/bin/env bash

cat index.html | grep "Deployed by Jenkins job: ${1}"
