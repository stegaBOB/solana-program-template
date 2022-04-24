#!/usr/bin/env bash

## Example amman script

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

cd "$SCRIPT_DIR"/../
amman stop
amman start

## Prepare Wallets


solana-keygen new --silent --no-bip39-passphrase --outfile "$SCRIPT_DIR"/solpair1.json -f
solana-keygen new --silent --no-bip39-passphrase --outfile "$SCRIPT_DIR"/solpair2.json -f

### Airdrop and label them

amman airdrop "$SCRIPT_DIR"/solpair1.json -l soladdr1
amman airdrop "$SCRIPT_DIR"/solpair2.json -l soladdr2

### Use first one as default wallet

solana config set --keypair "$SCRIPT_DIR"/solpair1.json

amman account soladdr1

## Token Creation

amman run -l token1 -l tx-create-token1 --   spl-token create-token --mint-authority "$SCRIPT_DIR"/solpair1.json

## Token Account Creation

amman run -l ata-tok1-addr1 -l tx-create-ata-tok1-addr1 --   spl-token create-account +token1 --owner +soladdr1

## Token Minting

amman run -l tx-mint-token1-to-ata-tok1-addr1 -t --   spl-token mint +token1 10 +ata-tok1-addr1 --mint-authority "$SCRIPT_DIR"/solpair1.json

## Token Transferring

### Create ATA for 'soladdr2'

amman run -l ata-tok1-addr2 -l tx-ata-tok1-addr2 --   spl-token create-account +token1 --owner +soladdr2

### Transfer the token Soladdr2

amman run -l tx-transfer-token1-addr2 -t --   spl-token transfer +token1 1 +soladdr2 --owner "$SCRIPT_DIR"/solpair1.json
