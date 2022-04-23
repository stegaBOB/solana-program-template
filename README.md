## Structured Template Solana BFP Program With Shank/Solita SDK Generation!

### Environment Setup
1. Install Rust from https://rustup.rs/
2. Install Solana from https://docs.solana.com/cli/install-solana-cli-tools#use-solanas-install-tool
3. Run `yarn install` to install dependencies 

### Build and test for program compiled natively
```
$ cargo build
$ cargo test
```

### Build and test the program compiled for BPF
```
$ cargo build-bpf
$ cargo test-bpf
```

### Generate the SDK and rebuild IDL
```
$ yarn sdk
```

### Replace default values
Values that need to be replaced:
- `MY_PROGRAM_NAME`
- `MY_PROGRAM_ID`

Use the `replace.sh` file to easily replace them!
Use the `-n` flag to specify the new name and the `-i` flag to specify a new ID.
