# 🎯 Lucky Draw (Move Smart Contract)

A simple Aptos Move contract that allows an admin to create a lucky draw event and lets players join by paying an entry fee.

## Features
- Initialize a lucky draw event by the admin.
- Players can join the draw by paying a fixed entry fee.
- Stores a list of participant addresses on-chain.

## Contract
- *init_draw(admin)* → Creates a new lucky draw event under the admin’s account.
- *enter_draw(player, admin_addr, entry_fee)* → Allows a player to join the lucky draw by paying the entry fee to the admin.

## How to Use

### 1. Compile
```bash
aptos move compile
```

### 2. Publish
```bash
aptos move publish --profile default
```

### 3. Initialize the Lucky Draw
```bash
aptos move run --function '<ACCOUNT_ADDRESS>::LuckyDraw::init_draw' \
  --profile default
```

### 4. Enter the Lucky Draw
```bash
aptos move run --function '<ACCOUNT_ADDRESS>::LuckyDraw::enter_draw' \
  --args 'address:<ADMIN_ADDRESS>' 'u64:100' \
  --profile default
```
- Replace `<ACCOUNT_ADDRESS>` with the deployed contract’s address.
- Replace `<ADMIN_ADDRESS>` with the admin’s account address.
- Change `100` to your desired entry fee.

## Requirements
- [Aptos CLI](https://aptos.dev/cli-tools/aptos-cli-tool/install-aptos-cli/)
- Rust & Git installed
- Aptos account set up:
```bash
aptos init --profile default
```

<img width="1899" height="888" alt="image" src="https://github.com/user-attachments/assets/15e79d58-99d8-4e4e-8f20-667cacef280b" />

## License
MIT License — feel free to use and modify.
