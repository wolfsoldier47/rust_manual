#pagebreak()
= Rust Data Types

== Scalar Types
These represent a single value
#table(
  columns: 3,
  align: left,
  inset: 6pt,
  fill: rgb("#f0f0f0"),
  text(weight: "bold")[Type], 
  text(weight: "bold")[Description], 
  text(weight: "bold")[Example],

  "i8–i128", "Signed integers (8 to 128 bits)", "`let x: i32 = -42;`",
  "u8–u128", "Unsigned integers (8 to 128 bits)", "`let x: u64 = 42;`",
  "isize", "Signed integer, pointer-sized", "`let x: isize = 10;`",
  "usize", "Unsigned, pointer-sized", "`let x: usize = 100;`",
  "f32", "32-bit floating point", "`let x: f32 = 3.14;`",
  "f64", "64-bit floating point (default)", "`let x: f64 = 2.718;`",
  "bool", "Boolean", "`let is_ready: bool = true;`",
  "char", "A Unicode scalar value", "`let letter: char = '🦀';`"
)

Str type is a sequence of char type which is in double quotes for example:

“ ```rust let s: &str = "Rust"; ```”
#table(
  columns: 2,
  align: left,
  inset: 6pt,
  fill: rgb("#f0f0f0"),
  text(weight: "bold")[Type], 
  text(weight: "bold")[Description], 

  "&str", "String slice (view into a string)", 
  "u8–u128", "Growable, heap-allocated string", )


== Compound Types
They are Grouping multiple values into one type
for example:

Tuple:
```rust
let tup: (i32, f64, char) = (42, 6.9, 'R');
let (x, y, z) = tup;
```

Array:
```Rust
let arr: [i32; 4] = [1, 2, 3, 4];
```

Custom Types:
```rust 
struct User {
    name: String,
    age: u8,
}
```

Enums:
```rust
enum Result<T, E> {
    Ok(T),    // holds success value of type T
    Err(E),   // holds error value of type E
} 
```
#pagebreak()
Union(unsafe)
```rust
union MyUnion {
    i: i32,
    f: f32,
}

```

#highlight[Warning]: unions are a low-level, unsafe feature that let you define a type where all fields share the same memory, like C-style unions. They are rarely used in safe Rust, but they are powerful when you need tight control over memory layout, like in FFI (calling C code) or low-level systems programming

== References Types
#table(
  columns: 2,
  align: left,
  inset: 6pt,
  fill: rgb("#f0f0f0"),
  text(weight: "bold")[Type], 
  text(weight: "bold")[Description], 

  "&T", "Shared Reference", 
  "&mut T","Mutable reference",
)


== Collection Types (from std::collections)
#table(
  columns: 2,
  align: left,
  inset: 6pt,
  fill: rgb("#f0f0f0"),
  text(weight: "bold")[Type], 
  text(weight: "bold")[Description], 

  "Vec<T>", "Growable array (vector)", 
  "HashMap<K, V>","Key-value store",
  "HashSet<T>","Unordered set")

== Never Type
#table(
  columns: 2,
  align: left,
  inset: 6pt,
  fill: rgb("#f0f0f0"),
  text(weight: "bold")[Type], 
  text(weight: "bold")[Description], 

  "!", "Used for functions that never return (panic!, loops, etc.)", )