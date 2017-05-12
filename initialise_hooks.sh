#!/bin/bash

ROOT_DIR=$(git rev-parse --show-toplevel)
cp -f ${ROOT_DIR}/hooks/pre-commit.sh ${ROOT_DIR}/.git/hooks/pre-commit

