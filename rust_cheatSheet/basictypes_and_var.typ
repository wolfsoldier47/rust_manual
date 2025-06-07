#pagebreak()
#set page(
  margin: (
    top: 2cm,
    bottom: 2cm,
    left: 1.5cm,
    right: 0.5cm
  )
)

#box(
  fill: rgb(255, 102, 51),
  radius: 4pt,
  inset: 6pt,
  [ == *Basic Types & Variables*]
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
    #text(size: 15pt, )[*Types*]\
    #text(fill: blue)[bool] — Boolean

    #text(size: 15pt, )[*Unsigned integers*]
    #block(spacing: 4pt)[
      #text(fill: blue)[u8, u16, u32, u64, u128]]

    #block[]
    #text(size: 15pt, )[*Signed integers*]
    #block(spacing: 4pt)[#text(fill: blue)[i8, i16, i32, i64, i128]]
     
    #block[]
    #text(size: 15pt, )[*Floating point*]
    #block(spacing: 4pt)[#text(fill: blue)[f32, f64]]

    #block[]
    #text(size: 15pt, )[*Platform-specific*]\
    #text(fill: blue)[usize]: Unsinged integer, Same number of bits as the platform's pointer type.

    #text(fill: blue)[isize]: signed Integer. Same number of bits as the platform's pointer type. 

    #text(fill: blue)[char] — #link("https://www.unicode.org/glossary/#unicode_scalar_value")[Unicode Scalar Value]\
    #text(fill: blue)[&str] — String slice \ 
    #text(fill: blue)[String] — Owned string  

    #text(size: 15pt, )[*Tuple*]
    ```rust
    let coordinates = (82, 64);
    let score = ("Team A", 12);
    ```

    #text(size: 15pt, )[*Array & Slice*]
    ```rust
    let array = [1, 2, 3, 4, 5];
    let array2 = [0; 3]; // [0, 0, 0]
    let slice = &array[1..3];
    ```

    #text(size: 15pt, )[*HashMap*]
    ```rust
    use std::collections::HashMap;

    let mut newHash = HashMap::new();
    newHash.insert(String::from("RustMY"), 100000);
    newHash.entry("".to_owned())
        .or_insert(3);
    ```     
    #text(size: 15pt,)[*Mutability*]
    ```rust
    let mut x = 5;
    x = 6 
    
    ```
 
 ][
    #text(size: 15pt, )[*Struct*]
    ```rust
    //Definition
    struct User {
      username: String,
      active: bool,
    }

    //Instantiation
    let user1 = User {
      username: String::from("bogdan"),
      active: true,
    };

    //Tuple Struct
    struct Color(i32, i32, i32);
    let black = Color(0, 0, 0);
    ```


    #text(size: 15pt, )[*Enum*]
      ```rust
      //Definition
      enum Command {
          Quit,
          Move { x: i32, y: i32 },
          Speak(String),
          ChangeBGColor(i32, i32, i32),
      }
      //Instatniation
      let msg1 = Command::Quit;
      let msg2 = Command::Move{ x: 1, y: 2 };
      let msg3 = Command::Speak("Rust".to_owned());
      let msg4 = Command::ChangeBGColor(0, 0, 0);
      ```


    #text(size: 15pt, )[*Constant*]
      ```rust
      const MAX_POINTS: u32 = 100_000;
      ```
    

    #text(size: 15pt, )[*Static Variable*]
      ```rust
      // Unlike constants static variables are
      // stored in a dedicated memory location
      // and can be mutated.
      static MAJOR_VERSION: u32 = 1;
      static mut COUNTER: u32 = 0;
      ```
    #text(size: 15pt,)[*Type alias*]\
    ```rust
    // `NanoSecond` is a new name for `u64`.
    type NanoSecond = u64;
    ```

  ]



