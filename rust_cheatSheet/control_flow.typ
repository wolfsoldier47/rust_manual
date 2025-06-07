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
  [== *Control Flow*]
)

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
 #text(size: 15pt, )[*if & if let*]\
 ```rust
let num = Some(22);
if num.is_some() {
println!("number is: {}", num.unwrap());
}
// match pattern and assign variable
if let Some(i) = num {
println!("number is: {}", i);
}
 ```
#text(size: 15pt, )[*loop*]
```rust
let mut count = 0;
loop {
count += 1;
if count == 5 {
    break; // Exit loop
  }
}
```
#text(size:15pt,)[*Nested loops & labels*]
```rust 
outer: loop {
  inner: loop {
    // This breaks the inner loop
    break;
  }
  // This breaks the outer loop
  break 'outer;
}

```
#text(size:15pt,)[*Returning from loops*]
```rust 
let mut count = 0;
let result = loop {
  count += 1;
  if count == 10 {
    break count;
  }
};
```



 ][
#text(size:15pt,)[*while & while let*]
  ```rust 
while n < 101 {
  n += 1;
}
let mut optional = Some(0);
while let Some(i) = optional
{
  print!("{}", i);
}
  
```


#text(size:15pt,)[*for loop*]
```rust 
for n in 1..101 {
  println!("{}", n);
}
let nms = vec!["Ivn","Han","Nik","Nix","Jef"];
for name in nms.iter() {
  println!("{}", name);
} 
```

#text(size:15pt,)[*match*]
```rust 
let optional = Some(0);
match optional {
    Some(i) => println!("{}", i),
    None => println!("No value.")
}
```

 ]