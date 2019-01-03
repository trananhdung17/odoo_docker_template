#!/usr/bin/env bash

case "$1" in
    run)
        /sbin/sshd -D
        ;;
    shell)
        /bin/bash
        ;;
    *)
        exit
        ;;
esac
