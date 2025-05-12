#pagebreak()
= RUST Functions

== Introduction

Functions are a core building block in Rust, allowing you to organize code into reusable sections. Functions take inputs, perform operations, and may return values.

== Defining Functions

A function in Rust is defined using the fn keyword followed by the function name, parameters (if any), and the return type (if any). Functions are declared within a scope (like main) or at the module level.

Example:
```rust 
fn greet(name: &str) -> String {
    format!("Hello, {}!", name)
}
 
fn main() {
    let message = greet("Alice");
    println!("{}", message);
}
```
#set list(marker: ([•], [--]),indent: 16pt,spacing:4pt)
Explanation:
  - fn is the keyword used to define a function.
  - greet is the function name.
  - (name: &str) is a parameter of type string slice.
  - -> String indicates that the function returns a String type
  - format! is a macro that formats text, returning a string.

== Parameters and Return Types

  - Parameters are defined within parentheses and must specify their type.
  - Functions can return values using the -> symbol.
  - If a function does not explicitly return a value, it returns the unit type ().

Example with Multiple Parameters:
```rust 
fn add(a: i32, b: i32) -> i32 {
    a + b
}
```


== Statements vs. Expressions
  - Rust functions primarily use expressions, which are pieces of code that return a value.
  - Statements do not return values (e.g., variable declarations).
Example:
```rust 
fn main() {
    let x = 5;
    let y = { // This is an expression block
        let temp = 3;
        temp + 1
    };
    println!("x = {}, y = {}", x, y);
}
```


== Function Documentation

Rust provides a system for documenting functions using doc comments (///).


Example:
```rust 
/// Adds two numbers together.
///
/// # Arguments
/// * `a` - The first number.
/// * `b` - The second number.
fn add(a: i32, b: i32) -> i32 {
    a + b
}

```

Running “```bash cargo doc --open```” will compile and open a documentation for your project.