#!/bin/bash

docker build . -t cpan-testers --build-arg USER=$USER --build-arg UID=$(id -u) || exit 255
