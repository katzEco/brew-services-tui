#!/usr/bin/env bash

listArg() {
  local argument_number=$1
  shift "$argument_number"
  local arguments=("$@")
  echo "${arguments[@]}"
}