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
  lr-blocks.update(x => x + 3)
  grid(columns: (2fr, 2fr), column-gutter: 2em,
    place(left, dx: -1.5em, block-number()) + a,
    place(right, dx: 1.5em, block-number()) + b,
  )
}

#counter(page).step()  // start with page 2 (left page)
#lr-columns[
  #text(size: 15pt, )[*Renaming with as keyword*]
```rust 
use std::fmt::Result;
use std::io::Result as IoResult;
```

  #text(size: 15pt, )[*Re-exporting with pub use*]
```rust
mod outer_module {
  pub mod inner_module {
    pub fn inner_public_function() {}
  }
}
pub use crate::outer_module::inner_module; 

```
][
#text(size: 15pt, )[*Defining modules in separate files*]
```rust
// src/lib.rs
mod my_module;
pub fn some_function() {
  my_module::my_function();
}

// src/my_module.rs
pub fn my_function() {}

```

]