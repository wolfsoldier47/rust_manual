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
  lr-blocks.update(x => x + 1)
  grid(columns: (2fr, 2fr), column-gutter: 2em,
    place(left, dx: -1.5em, block-number()) + a,
    place(right, dx: 1.5em, block-number()) + b,
  )
}

#counter(page).step()  // start with page 2 (left page)
#lr-columns[

#text(size: 15pt, )[*Lifetimes in function signatures*]
```rust 
fn long<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() {
        x
    } else {
        y
    }
}
```

#text(size: 15pt, )[*Lifetimes in  struct definations*]
```rust
struct email<'a> {
  email_address: &'a str,
}

```

#text(size: 15pt, )[*Static lifetimes*]
```rust
let test: &'static str = "Welcome to RustMY!";
```

#box(
  fill: rgb(255, 102, 51),
  radius: 4pt,
  inset: 6pt,
  [== *Functions, Function Pointers & Closures*]
)
#text(size: 15pt, )[*Static lifetimes*]
```rust
struct Point {
    x: i32,
    y: i32,
}

impl Point {
    // Associated function
    fn new(x: i32, y: i32) -> Point {
        Point { x, y }
    }

    // Method
    fn get_x(&self) -> i32 {
        self.x
    }
}

```
#text(size: 15pt, )[*Function Pointers*]
```rust
fn do_tw(f: fn(i32) -> i32, v: i32) -> i32 {
  f(v) + f(v)
}
```

][


#text(size: 15pt, )[*Creating Closures*]
```rust
let add_one = |num: u32| -> u32 {
  num + 1
};
```
#text(size: 15pt, )[*Returning closures*]
```rust
fn add_one() -> impl Fn(i32) -> i32 {
    |x| x + 1
}

fn add_or_subtract(x: i32) -> Box<dyn Fn(i32) -> i32> {
    if x > 10 {
        Box::new(move |y| y + x)
    } else {
        Box::new(move |y| y - x)
    }
}

```
#text(size: 15pt, )[*Closure traits*]\
• FnOnce - consumes the variables it
captures from its enclosing scope.\
• FnMut - mutably borrows values from its
enclosing scope.\
• Fn - immutably borrows values from its
enclosing scope.

#text(size: 15pt, )[*Closure traits*]
```rust 
struct Cacher<T>
where
  T: Fn(u32) -> u32,
{
  calculation: T,
  value: Option<u32>,
}
```

#text(size: 15pt, )[*Function that accepts closure
or function pointer*]
```rust 
fn do_twice<T>(f: T, x: i32) -> i32
  where T: Fn(i32) -> i32
{
  f(x) + f(x)
}
```
]


