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
#let block-number() = context text(0.8em, numbering("1", lr-blocks.get()))

#let lr-columns(a, b) = {
  lr-blocks.update(x => x + 1)
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
  [== *Combinators*]
)

#text(size: 15pt, )[*.map*]
```rust 
let some_string = Some("RustMy".to_owned());
let some_len = some_string.map(|s| s.len());

struct Error { msg: String }
struct User { name: String }

let string_result: Result<String, Error> =
Ok("Bogdan".to_owned());

let user_result: Result<User, Error> =
string_result.map(|name| {
  User { name }
});
```

#text(size: 15pt, )[*.and_then*]
```rust 
let vec = Some(vec![1, 2, 3]);
let first_element = vec.and_then(
  |vec| vec.into_iter().next()
);
let string_result: Result<&'static str, _>
= Ok("5");
let number_result =
  string_result
  and_then(|s| s.parse::<u32>());

```
#box(
  fill: rgb(255, 102, 51),
  radius: 4pt,
  inset: 6pt,
  [== *Multiple Error Types*]
)

#text(size: 15pt, )[*Define custom error type*]
```rust 
type Result<T> = std::result::Result<T, CustomError>;

#[derive(Debug, Clone)]
struct CustomError;

impl fmt::Display for CustomError {
  fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
    write!(f, "custom error message")
  }
}
```
#text(size: 15pt, )[*Boxing errors*]
```rust 
use std::error;
type Result<T> =
  std::result::Result<T, Box<dyn error::Error>>; 
```
][
#box(
  fill: rgb(255, 102, 51),
  radius: 4pt,
  inset: 6pt,
  [== *Iterating Over Errors*]
)

#text(size: 15pt, )[*Ignore failed items with filter_map()*]
```rust 
let strings = vec!["RustMY", "22", "7"];
let numbers: Vec<_> = strings
  .into_iter()
  .filter_map(|s| s.parse::<i32>().ok())
  .collect();
```

#text(size: 15pt, )[*Failed the entire operation with collect()*]
```rust 
let strings = vec!["RustMY", "22", "7"];
let numbers: Result<Vec<_>, _> = strings
  .into_iter()
  .map(|s| s.parse::<i32>())
  .collect();

```
#text(size: 15pt, )[*Collect all valid values & failures
with partition()*]
```rust 
let strings = vec!["RustMY", "22", "7"];
let (numbers, errors): (Vec<_>, Vec<_>) = strings
  .into_iter()
  .map(|s| s.parse::<i32>())
  .partition(Result::is_ok);

let numbers: Vec<_> = numbers
  .into_iter()
  .map(Result::unwrap)
  .collect();

let errors: Vec<_> = errors
  .into_iter()
  .map(Result::unwrap_err)
  .collect();
```
]