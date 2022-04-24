# Boilerplate Solana BFP With SDK Generation!

### Environment Setup
1. Install Rust from https://rustup.rs/
2. Install Solana from https://docs.solana.com/cli/install-solana-cli-tools#use-solanas-install-tool
3. Run `yarn install` to install dependencies 

### Build the rust program alone
```
$ yarn build:rust
```

### Generate the JS SDK and rebuild IDL only
```
$ yarn sdk
```

### Build the JS SDK only (must be generated first)
```
$ yarn build:sdk
```

### Build the program and generate and build the IDL/SDK
```
$ yarn build
```

### Replace default values

Values that need to be replaced:
- `my_program_name` (and `my-program-id`)
- `my_program_id`

Use the `rename.sh` file to easily replace all references of the old names and ids with the new ones!
Use the `-n` flag to specify the new name and the `-i` flag to specify a new ID.