
=== Code Editors


#grid(
  columns: 2,
  gutter: -100pt,
  grid.cell(
    colspan: 1,
    image("../images/vscode.png", width: 30%),
  ),
  [
If you are using vscode download here  #link("https://code.visualstudio.com/download") and install the following extensions: rust-analyzer, even better TOML, crates-io
]
)



#grid(
  columns: 2,
  gutter: -100pt,
  grid.cell(
    colspan: 1,
    image("../images/zed-editor.png", width: 30%),
  ),
  [
  If you want to use Zed written in Rust click here 
  #link("https://zed.dev/download")[Download link], 
  you don't have to add any additional plugin. 
  #highlight(stroke: fuchsia)[(However, you might need to build it yourself for Windows systems. 
  Hence, either build it yourself before coming to the workshop or just use VSCode.)]
]
)
