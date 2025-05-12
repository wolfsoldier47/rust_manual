#pagebreak()
== A Friend in need is a Friend Indeed

Consider Rust compiler as your friend which can help you and pin point the location of every error in your code.


#figure(
  image("../images/compile_error2.png", width: 70%),
  caption: [
    Rustc pointintg error
  ],
)

- as you can see in figure 2 rustc will point out directly and will explain you where exactly the error lies and what fixes you can do. 

#figure(
  image("../images/compile_error.png", width: 70%),
  caption: [
    Rustc explainations
  ],
)
- However if you need further more understanding of error rust come up with an extra help and exaplination of error by typing in the command as mentioned in the second last line in the shell of figure 3 which is "```bash rustc --explain E0277```" 

#figure(
  image("../images/compile_error_explain.png", width: 70%),
  caption: [
    Rustc explainations
  ],
)
- As shown in Figure 4 this is how the further explaination looks like which can help you debug and understand your problem in a better way.

#figure(
  image("../images/compile_success.png", width: 70%),
  caption: [
    Rustc explainations
  ],
)

- After fixing the error the program was able to compile without any issues as shown in figure 5.