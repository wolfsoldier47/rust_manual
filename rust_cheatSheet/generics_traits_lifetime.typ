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
  [== *Generics, Traits & Lifetimes*]
)
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
#text(size: 15pt, )[*Using generics*]
```rust 
struct Point<T, U> {
    x: T,
    y: U,
}

impl<T, U> Point<T, U> {
  fn mixup<V, W>(self, other: Point<V, W>) -> Point<T, W> {
      Point {
          x: self.x,
          y: other.y,
      }
  }
}


```

#text(size: 15pt, )[*Defining traits*]
```rust 
trait Animal {
    fn new(name: &'static str) -> Self;
    fn noise(&self) -> &'static str {
        ""
    }
}

struct Dog {
    name: &'static str,
}

impl Dog {
    fn fetch() {
        // ... implementation
    }
}

impl Animal for Dog {
    fn new(name: &'static str) -> Dog {
        Dog { name }
    }
    fn noise(&self) -> &'static str {
        "woof!"
    }
}

```

#text(size: 15pt, )[*Default Implementations with Derive*]
```rust 
// A tuple struct that can be printed
#[derive(Debug)]
struct Inches(i32);
```






][
#text(size: 15pt, )[*Trait Bounds*]
```rust 
fn largest<T: PartialOrd + Copy>(list: &[T]) -> T {
    let mut largest = list[0];
    for &item in list {
        if item > largest {
            largest = item;
        }
    }
    largest
}

```
#text(size: 15pt, )[*impl trait*]
```rust 
fn m_function(y: i32) -> impl Fn(i32) -> i32 {
  let closure = move |x: i32| { x + y };
  closure
}

```
#text(size: 15pt, )[*Trait Objects*]
```rust 
pub struct Screen {
  pub components: Vec<Box<dyn Draw>>,
}

```
#text(size: 15pt, )[*Opertor Overloading*]
```rust
use std::ops::Add;

#[derive(Debug, Copy, Clone, PartialEq)]
struct Point {
    x: i32,
    y: i32,
}
impl Add for Point {
    type Output = Point;
    fn add(self, other: Point) -> Point {
        Point {
            x: self.x + other.x,
            y: self.y + other.y,
        }
    }
}

```
#text(size: 15pt, )[*SuperTraits*]
```rust
use std::fmt;
trait Log: fmt::Display {
    fn log(&self) {
        let output = self.to_string();
        println!("Logging: {}", output);
    }
}
```

]