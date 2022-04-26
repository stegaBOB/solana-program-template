# The Best Solana Program Template 
## Includes Shank/Solita SDK generation, Amman support, scripts, .github configuration, and more!

### Environment Setup
1. Install Rust from https://rustup.rs/
2. Install Solana from https://docs.solana.com/cli/install-solana-cli-tools#use-solanas-install-tool
3. Run `yarn install` to install dependencies

---

### Replace default values
```
$ yarn rename -n cool_program_name -i NewProgramKeypair111111111111111111111111111
```

Values that will be replaced:
- `my_program_name` (and `my-program-name`)
- `MyProgram1111111111111111111111111111111111`

---

### Build the rust program alone
```
$ yarn build:rust
```

---

### Generate the JS SDK and rebuild IDL only (using shank and solita)
```
$ yarn solita
```

---

### Build the JS SDK only (must be generated first)
```
$ yarn build:sdk
```

---

### Build the program and generate/build the IDL/SDK/docs
```
$ yarn build
```

---

### Start Amman and run the test script
Run the following command in a separate shell
```
$ amman start
```

Then, run the Amman script
```
$ yarn amman
```
