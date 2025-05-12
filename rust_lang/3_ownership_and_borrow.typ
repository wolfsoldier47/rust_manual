#pagebreak()
= RUST Ownership & Borrowing rules.
Introduction:

Ownership is one of Rust’s unique and most powerful features, designed to ensure memory safety without a garbage collector. It allows Rust to efficiently manage memory through a set of rules.
#set list(marker: ([•], [--]),indent: 16pt,spacing:4pt)
Ownership Basics
    1. Each value in Rust has a single owner.
    2. When the owner goes out of scope, the value is dropped.
    3. A value can be moved or copied to another owner.

Example:
```rust 
fn main() {
    let s1 = String::from("hello");
    let s2 = s1; // s1 is moved to s2
 
    // println!("{}", s1); // Error: s1 is no longer valid
    println!("{}", s2);
}
```

Explanation:

    - The String type in Rust is not copy-able by default.

    - When s1 is assigned to s2, it is moved, making s1 invalid.

== Borrowing and References

Borrowing allows a function or variable to temporarily use a value without taking ownership of it.
  - Use & to create a reference.

  - Use &mut for mutable references.

Example:
```rust 
fn change(s: &mut String) {
    s.push_str(", world!");
}

fn main() {
    let mut s = String::from("hello");
    change(&mut s);
    println!("{}", s);
}
```

Explanation:
  - &mut s allows the function to borrow the string and modify it

  - Only one mutable reference is allowed at a time.

== Borrowing Rules

  - You can have one mutable reference or any number of immutable references, but not both at the same time.

  - References must always be valid.

Example:

```rust 
fn main() {
    let mut s = String::from("hello");
    let r1 = &s; // immutable borrow
    let r2 = &s; // another immutable borrow
    // let r3 = &mut s; // Error: cannot borrow as mutable
 
    println!("{}, {}", r1, r2);
}
```

== Slices - Borrowing Parts of Data

Slices allow borrowing a part of a data structure without taking ownership.

Example:

```rust 
fn main() {
    let s = String::from("hello world");
    let hello = &s[0..5]; // slice
    println!("{}", hello); ; // valid
    println!("{}", s); ; // valid
}
```