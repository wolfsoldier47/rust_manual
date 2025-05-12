= Rust Copy and Non-Copy Types


#text(weight: "bold",size: 10pt)[What are Copy Types?]

Copy types in Rust are those that can be duplicated with a simple bitwise copy, without requiring ownership transfer. When you assign a value of a Copy type to another variable, Rust performs a simple bitwise copy without invalidating the original variable.

Characteristics of Copy Types
  - Fast, because they are duplicated with a bitwise copy.

  - No ownership transfer, so the original value is still accessible.

  - Commonly used for primitive types and types without heap allocation.



Examples of Copy Types

- Integer types: i32, u32, u8, etc.

- Floating point types: f32, f64

- Boolean: bool

- Character: char

- Arrays and tuples, but only if all elements are also Copy types.

Example Code:
```rust 
fn main() {
    let x: i32 = 42;
    let y = x; // Copy happens here, x is still valid
    println!("x: {}, y: {}", x, y);
}
```

#text(weight: "bold",size: 10pt)[What are Non-Copy Types?]

Non-Copy types in Rust are types that involve ownership transfer when assigned to another variable. Instead of being copied, ownership is moved to the new variable, making the original variable invalid.

Characteristics of Non-Copy Types
#set list(marker: ([•], [--]),indent: 16pt,spacing:4pt)
  - Ownership transfer occurs when assigned or passed.

  - Cannot be duplicated without explicitly using methods like clone().

  - Commonly used for heap-allocated types and complex data structures.

Examples of Non-Copy Types

      - Strings: String

      - Vectors: Vec<T>

      - Boxed values: Box<T>

      - Any custom struct that does not explicitly implement Copy.

Example Code:
```rust  
fn main() {
    let s1 = String::from("Hello, Rust!");
    let s2 = s1; // Move occurs, s1 is no longer valid
    // println!("s1: {}", s1); // Error: s1 is moved
    println!("s2: {}", s2);
}
```

== Mut vs Non-Mut and Their Copy Behavior
A mut variable is one that can be modified after initialization.A non-mut variable is immutable and cannot be changed after initialization.

#text(weight: "bold",size: 10pt)[How mut Affects Copy Types]

A mutable Copy type can be changed, but it is still copied bitwise.

```rust 
fn main() {
    let mut x: i32 = 10;
    let y = x; // Copy occurs
    x = 20;   // x is changed, y remains the same
    println!("x: {}, y: {}", x, y);
}
```

#text(weight: "bold",size: 10pt)[How mut Affects Non-Copy Types]

A mutable Non-Copy type can be modified, but ownership rules still apply.
```rust 
fn main() {
    let mut s1 = String::from("Hello");
    let s2 = s1; // Move occurs, s1 is no longer valid
    // s1.push_str(", World!"); // Error: s1 is moved
    println!("s2: {}", s2);
}

```