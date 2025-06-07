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
  [== *Iterators*]
)
][
  #box(
  fill: rgb(255, 102, 51),
  radius: 4pt,
  inset: 6pt,
  [== *Error Handling*]
)
]
#lr-columns[
#text(size: 15pt, )[*Usage*]
```rust 
// Methods that consume iterators
let v1 = vec![1, 2, 3];
let v1_iter = v1.iter();
let total: i32 = v1_iter.sum();
// Methods that produce new iterators
let v1: Vec<i32> = vec![1, 2, 3];
let iter = v1.iter().map(|x| x + 1);
// Turning iterators into a collection
let v1: Vec<i32> = vec![1, 2, 3];
let v2: Vec<_> = v1.iter().map(|x| x + 1).collect();
```

#text(size: 15pt, )[*Implementing the Iterator trait*]
```rust 
struct Counter {
  count: u32,
}
impl Counter {
  fn new() -> Counter {
    Counter { count: 0 }
    }
}
impl Iterator for Counter {
  type Item = u32;
}
fn next(&mut self) -> Option<Self::Item> {
  if self.count < 5 {
    self.count += 1;
    Some(self.count)
  } else {
    None
  }
}
```
][

#text(size: 15pt, )[*Throw unrecoverable error*]
```rust 
panic!("Critical error! Exiting!");
```

#text(size: 15pt, )[*Option enum*]
```rust 
fn get_user_id(name: &str) -> Option<u32> {
  if database.user_exists(name) {
    return Some(database.get_id(name))
  }
  None
}

```

#text(size: 15pt, )[*Result enum*]
```rust 
fn get_user(id: u32) -> Result<User, Error> {
  if is_logged_in_as(id) {
   return Ok(get_user_object(id))
  }
  Err(Error { msg: "not logged in" })
}
```
#text(size: 15pt, )[* ? Operator*]
```rust 
fn get_salary(db: Database, id: i32) -> Option<u32> {
  Some(db.get_user(id)?.get_job()?.salary)
}

fn connect(db: Database) -> Result<Connection, Error> {
  // ? works if the return type is Result
  let conn = db.get_active_instance()?.connect()?;
  Ok(conn)
}
```

]