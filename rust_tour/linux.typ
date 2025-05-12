#pagebreak()
= Rust Tour
#show raw: it => block(
  fill: rgb("#1d2433"),
  inset: 8pt,
  radius: 5pt,
  text(fill: rgb("#a2aabc"), it)
)
== Linux
(The command below will make sure rust is installed)

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
Full toolchain is installed which includes rustc, cargo, rust-std.

This script installs rustup, the Rust toolchain installer, which in turn installs:
#set list(marker: ([•], [--]),indent: 15pt)
    - rustc – the Rust compiler

    - cargo – Rust's package manager and build tool

    - rust-std – the standard library

=== Toolchain Management with rustup:
    If you've installed rustup in the past, you can update your installation by running:
    ```
    rust update
    ```
    
=== Configuring the PATH:
  ```bash
    export PATH="$HOME/.cargo/bin:$PATH"  
    ```
=== Uninstall Rust:
    ```bash 
    rustup self uninstall
    ```
