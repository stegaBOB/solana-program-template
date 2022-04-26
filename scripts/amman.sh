#!/usr/bin/env bash

## Example amman script

echo -e "\x1b[1;33mMAKE SURE YOU START AMMAN WITH \x1b[0;4mammman start\x1b[0;1;33m BEFORE RUNNING THIS COMMAND\x1b[0m"
sleep 1.5

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
ROOT_DIR=$(dirname "$SCRIPT_DIR")
AMMAN_DIR=$ROOT_DIR/amman

cd "$ROOT_DIR" || exit

## Prepare Wallets

solana-keygen new --silent --no-bip39-passphrase --outfile "$AMMAN_DIR"/solpair1.json --force
solana-keygen new --silent --no-bip39-passphrase --outfile "$AMMAN_DIR"/solpair2.json --force

### Airdrop and label them

amman airdrop "$AMMAN_DIR"/solpair1.json -l soladdr1
amman airdrop "$AMMAN_DIR"/solpair2.json -l soladdr2

### Use first one as default wallet

solana config set --keypair "$AMMAN_DIR"/solpair1.json

amman account soladdr1

## Token Creation

amman run -l token1 -l tx-create-token1 --   spl-token create-token --mint-authority "$AMMAN_DIR"/solpair1.json

## Token Account Creation

amman run -l ata-tok1-addr1 -l tx-create-ata-tok1-addr1 --   spl-token create-account +token1 --owner +soladdr1

## Token Minting

amman run -l tx-mint-token1-to-ata-tok1-addr1 -t --   spl-token mint +token1 10 +ata-tok1-addr1 --mint-authority "$AMMAN_DIR"/solpair1.json

## Token Transferring

### Create ATA for 'soladdr2'

amman run -l ata-tok1-addr2 -l tx-ata-tok1-addr2 --   spl-token create-account +token1 --owner +soladdr2

### Transfer the token Soladdr2

amman run -l tx-transfer-token1-addr2 -t --   spl-token transfer +token1 1 +soladdr2 --owner "$AMMAN_DIR"/solpair1.json
