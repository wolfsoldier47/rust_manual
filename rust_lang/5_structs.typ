= Rust Structs

== What is a Struct?

A struct (short for structure) in Rust is a custom data type that lets you group related data together. Structs are like objects in OOP languages, but without methods unless you implement them separately.

```rust 
struct Book {
    title: String,
    author: String,
    pages: u32,
    published: bool,
}
```

== Creating Instance

```rust 
let book1 = Book {
    title: String::from(“Bevy Workshop”),
    author: String::from(“Rust Malaysia”),
    pages: 10,
    published: true,
};
```

In the Rust programming language, String::from() is a function that creates a String (mutable string) from a given &str (string slice). It essentially converts a string literal or a string slice into a String data type, which allows for modification and ownership. For more info checkout #link("https://doc.rust-lang.org/std/string/struct.String.html")[struct strings]


```rust 
let book2 = Book {
    title: String::from("Bevy workshop"),
    ..book1
};
```
This copies all remaining fields from book1. book1 will no longer be valid if any fields that don’t implement Copy (like String) are moved. Which means if we try to access book1.author it will give an error as we already moved via “..book1” . However book1.title will still be accessible because we never moved it.

Accessing struct fields

```rust 
println!("Title:{}",book.title)
```
#highlight("Interesting fact"): println! is a macro in Rust (note the !), not a function. And “{}” is a placeholder or like a template which will be replaced by the value book1.title.


== Tuple Structs

Tuple structs are useful without named fields:
```rust 
struct Color(u8, u8, u8);
let red = Color(255, 0, 0);
```

To access the struct we can do red.0 or red.1.


== Unit-Like Stricts

```rust 
struct Marker;
let _m = Marker;
```

A unit-like struct is a struct with no fields, just a name. the underscore is to let the compiler know that i am not going to use this variable to avoid the warning.

== Implementing Methods
Implements are use to Implement methods for sturcts or enums using the impl block. This is a way to attach behaviour to your types which is similar to methods in classes in other languages.

```rust 
struct Counter {
    count: u32,
}
 
impl Counter {
    fn new() -> Self {
        Counter { count: 0 }
    }
 
    fn increment(&mut self) {
        self.count += 1;
    }
 
    fn get(&self) -> u32 {
        self.count
    }
}
 
fn main() {
    let mut c = Counter::new();
    c.increment();
    println!("Count: {}", c.get()); // prints: Count: 1
}

```
Using impl Block with the same name as struct you can associate it to the struct.

Three things to notice here:

  - function new() return self and doesn't take any self. This is an #highlight("associated function") (static with no self parameter. And if you notice its being accessed with double colon. These functions are usually used as a constructor , helper functions ,factory methods(return different variants) or name spacing to keep the related logic grouped with a type.
  - Method increment() takes a #highlight("mutable self") which means it will modify the existing instance.
  - Method get() is a self which will return the current value of the instance.

