#!/usr/bin/env bash

# Replaces the references to MY_PROGRAM_NAME and MY_PROGRAM_ID with the provided name and ID

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

NAME_FILES=(
  "$SCRIPT_DIR"/.solitarc.js
  "$SCRIPT_DIR"/package.json
  "$SCRIPT_DIR"/Cargo.toml
)
ID_FILES=(
  "$SCRIPT_DIR"/program/src/lib.rs
)

print_usage() {
  printf "Usage: \n-n: Name to replace MY_PROGRAM_NAME with \n-i: Base-58 ID to replace MY_PROGRAM_ID with"
}

OLD_NAME="MY_PROGRAM_NAME"
OLD_ID="MY_PROGRAM_ID"

NEW_NAME=""
NEW_ID=""

while getopts 'n:i:' flag; do
  case "${flag}" in
  n) NEW_NAME="${OPTARG}" ;;
  i) NEW_ID="${OPTARG}" ;;
  *)
    print_usage
    exit 1
    ;;
  esac
done

if [ "$NEW_ID" == "" -a "$NEW_NAME" == "" ]; then
  print_usage
  exit 1
fi

if [ "$NEW_NAME" != "" ]; then
  for file in "${NAME_FILES[@]}"; do
    sed -i "" "s/$OLD_NAME/$NEW_NAME/g" "${file}"
  done
  echo "Successfully replaced all $OLD_NAME's with $NEW_NAME!"
fi

if [ "$NEW_ID" != "" ]; then
  for file in "${ID_FILES[@]}"; do
    sed -i "" "s/$OLD_ID/$NEW_ID/g" "${file}"
  done
  echo "Successfully replaced all $OLD_ID's with $NEW_ID!"
fi
