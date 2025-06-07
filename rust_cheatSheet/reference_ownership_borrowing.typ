#pagebreak()
#set page(
  margin: (
    top: 2cm,
    bottom: 2cm,
    left: 1.5cm,
    right: 0.5cm
  )
)
// Title banner
#box(
  fill: rgb(255, 102, 51),
  radius: 4pt,
  inset: 6pt,
  [== *References, Ownership & Borrowing*]
)

#let lr-blocks = state("lr-blocks", 0)
#let block-number() = context text(0.8em, "")

#let lr-columns(a, b) = {
  lr-blocks.update(x => x + 3)
  grid(columns: (2fr, 2fr), column-gutter: 2em,
    place(left, dx: -1.5em, block-number()) + a,
    place(right, dx: 1.5em, block-number()) + b,
  )
}

#counter(page).step()  // start with page 2 (left page)
#lr-columns[
#text(size: 15pt, )[*Ownership rules*]\
1 - Every value in Rust is owned by a single variable, which acts as its "owner."\
2- Ownership is exclusive—only one variable can own a value at a time.\
3 - When the owner variable goes out of scope (is no longer used), the value is automatically removed from memory.\
4- This system ensures efficient memory management without requiring manual cleanup.


#text(size: 15pt, )[*Borrowing rules*]\
1 - At any moment, you can either have a single mutable reference or multiple immutable references to a value.\
2 - References must remain valid and never point to invalid or deallocated memory.


#text(size: 20pt, )[*Creating references*]
```rust 
let s1 = String::from("hello world!");
let s1_ref = &s1; // immutable reference
let mut s2 = String::from("hello");
let s2_ref = &mut s2; // mutable reference
s2_ref.push_str(" world!");
```

#text(size: 20pt,)[*Copy, Move & Clone*]
```rust 
// Simple values which implement the Copy trait are copied by value
let x = 5;
let y = x;
println!("{}", x); // x is still valid
// The string is moved to s2 and s1 is invalidated
let s1 = String::from("Welcometo Workshop");
let s2 = s1; // Shallow copy a.k.a move
println!("{}", s1); // Error: s1 is invalid
let s1 = String::from("Welcometo Workshop");
let s2 = s1.clone(); // Deep copy
// Valid because s1 isn't moved
println!("{}", s1);
```
][
#text(size: 15pt, )[*Ownership & Functions*]
```rust 
fn main() {
    let x = 5;
    takes_copy(x); // x is copied by value
    let s = String::from("Welcome to Workshop");
    // s is moved into the function
    takes_ownership(s);
    // return value is moved into s1
    let s1 = gives_ownership();
    let s2 = String::from("RustMY");
    let s3 = takes_and_gives_back(s2);
  }

  fn takes_copy(some_integer: i32) {
    println!("{}", some_integer);
  }

  fn takes_ownership(some_string: String) {
    println!("{}", some_string);
  } // some_string goes out of scope and drop is called. The backing memory is freed.

  fn gives_ownership() -> String {
    let some_string = String::from("WorkShop");
    some_string
  }

  fn takes_and_gives_back(some_string: String)-> String {
    some_string
  }
```
]