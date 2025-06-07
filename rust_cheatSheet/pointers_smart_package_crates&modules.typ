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
#box(
  fill: rgb(255, 102, 51),
  radius: 4pt,
  inset: 6pt,
  [== *Pointers*]
)\
#text(size: 15pt, )[*References*]
```rust 
let mut num = 5;
let r1 = &num; // immutable reference
let r2 = &mut num; // mutable reference
```

#text(size: 15pt, )[*Raw Pointers*]
```rust 
let mut num = 5;
// immutable raw pointer
let r1 = &num as *const i32;
// mutable raw pointer
let r2 = &mut num as *mut i32;
```

#text(size: 15pt, )[*Smart Pointers*]
```rust 
Box<T> - for allocating values on the heap
let b = Box::new(5);

Rc<T> - multiple ownership with reference counting
let a = Rc : : new(5);
let b = Rc : : clone(&a);

Ref<T>, RefMut<T>, and RefCell<T> - enforce
borrowing rules at runtime instead of compile time.

let num = 5;
let r1 = RefCell::new(5);
// Ref - immutable borrow
let r2 = r1.borrow();
// RefMut - mutable borrow
let r3 = r1.borrow_mut();
// RefMut - second mutable borrow
let r4 = r1.borrow_mut();
```
#text(size: 15pt, )[*Multiple owners of mutable data*]
```rust 
let x = Rc::new(RefCell::new(5));
```
][
#box(
  fill: rgb(255, 102, 51),
  radius: 4pt,
  inset: 6pt,
  [== *PACKAGES, CRATES &
MODULES*]
)
#text(size: 15pt, )[*Definations*]\
• Packages - A Cargo feature that lets you
build,test, and share crates.\
• Crates - A tree of modules that produces a
library or executable.\
• Modules and use - Let you control the
organization, scope, and privacy of paths.\
• Paths - A way of naming an item, such as a
struct, function, or module.



#text(size: 15pt, )[*Creating a new package with
a binary crate*]\
\$ cargo new my-project

#text(size: 15pt, )[*Creating a new package with
a library crate*]\
\$ cargo new my-project --lib

#text(size: 15pt, )[*Defining & using modules*]\
```rust 
fn some_function() {}

mod outer_module {
    // private module by default
    pub mod inner_module {
        // public inner module
        pub fn inner_public_function() {
            super::super::some_function(); // calling a function from the top level
        }
        fn inner_private_function() {}
    }
}

fn main() {
    // Absolute path from crate root
    crate::outer_module::inner_module::inner_public_function();
    // Relative path from current scope
    outer_module::inner_module::inner_public_function();
    // Bringing the module into scope with use
    use_outer(); // helper below
}

// Helper to show use
fn use_outer() {
    use crate::outer_module::inner_module;
    inner_module::inner_public_function();
}


```
]