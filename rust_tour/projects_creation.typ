#pagebreak()
== Working with Projects
create new project : 

#show raw: it => block(
  fill: rgb("#1d2433"),
  inset: 5pt,
  radius: 5pt,
  text(fill: rgb("#a2aabc"), it)
)
```bash
cargo new <name_of_project>
```
After creation add bevy to the project by adding it to the dependency:
#figure(
  image("../images/toml_file.png", width: 80%),
  caption: [
    Adding Dependency to Toml
  ],
)

#set list(marker: ([•], [--]),indent: 2pt)
    - Before you run make sure the following packages are installed in the system as bevy requires them in order to compile bevy:
        - libudev-dev (libudev-devel for fedora/centos)
        - libx11-dev libasound2-dev libudev-dev libxkbcommon-x11-0
        - For Windows Download & install the following: #link("https://visualstudio.microsoft.com/visual-cpp-build-tools/")[#text(weight: "bold")[Microsoft C++ Build Tools]]
    - Adding dependency in .toml file as shown in figure 1 above and run the following command: ```bash cargo build ```
    - You may add /target to your .ignore file as rust builds will be created there and you dont need to add them to your repo(optional)
    - For further information go to the following link: #link("https://github.com/bevyengine/bevy/blob/latest/docs/linux_dependencies.md")[#text(weight: "bold")[Bevy Info]]