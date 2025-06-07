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
  [== *Pattern Matching*]
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
  #text(size: 15pt, )[*Basics*]
  ```rust 
  let x = 5;
  match x {
  // matching literals
      1 => println!("one"),
      // matching multiple patterns
      2 | 3 => println!("two or three"),
      // matching ranges
      4..=9 => println!("within range"),
      // matching named variables
      x => println!("{}", x),
      // default case (ignores value)
      _ => println!("default Case")
  }
  ```
#text(size: 15pt, )[*Destructing*]
```rust 
  struct Point {
    x: i32,
    y: i32,
  }
  let p = Point { x: 0, y: 7 };
  match p {
  Point { x, y: 0 } => {
      println!("{}" , x);
    },
    Point { x, y } => {
      println!("{} {}" , x, y);
    },
  }

  enum Shape {
    Rectangle { width: i32, height: i32 },
    Circle(i32),
  }
  let shape = Shape::Circle(10);
  match shape {
    Shape::Rectangle { x, y } => //...
    Shape::Circle(radius) => //...
  }

```

 ][
 #text(size: 15pt, )[*Ignoring Values*]
 ```rust
 struct SemVer(i32, i32, i32);
  let version = SemVer(1, 32, 2);
  match version {
    SemVer(major, _, _) => {
      println!("{}", major);
    }
  }
  let numbers = (2, 4, 8, 16, 32);
  match numbers {
    (first, .., last) => {
      println!("{}, {}", first, last);
    }
  }
  ``` 
#text(size: 15pt, )[*Match guards*]
```rust 
let num = Some(4);
match num {
  Some(x) if x < 5 => println!("less than five: {}", x),
  Some(x) => println!("{}", x),
  None => (),
}

```
#text(size: 15pt, )[*Bindings*]
```rust 
struct User {
    id: i32
  }
let user = User { id: 5 };
match user {
User {
  id: id_variable @ 3..=7,
    } => println!("id: {}", id_variable),
  User { id: 10..=12 } => {
    println!("within range");
  },
  User { id } => println!("id: {}", id),
}
```

]