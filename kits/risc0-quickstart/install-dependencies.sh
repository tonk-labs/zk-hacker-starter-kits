#!/bin/bash

# Function to check if a command exists
command_exists() {
    type "$1" &> /dev/null
}

# Check if cargo (Rust's package manager) is installed
if command_exists cargo; then
    echo "Rust is already installed."
    # Run the specified cargo commands
    cargo install cargo-binstall
    cargo binstall cargo-risczero
    cargo risczero install
else
    echo "Rust is not installed. Installing Rust..."
    # Install Rust using rustup (the recommended way to install Rust)
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    # Source the cargo environment script to update the current shell
    source $HOME/.cargo/env

    # Run the specified cargo commands
    cargo install cargo-binstall
    cargo binstall cargo-risczero
    cargo risczero install
fi

