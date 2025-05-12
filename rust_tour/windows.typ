
== Windows
Go to the following page #link("https://forge.rust-lang.org/infra/other-installation-methods.html") and download the msi package. These installers come with rustc, cargo, rustdoc

#set list(marker: ([•], [--]),indent: 15pt)
For your reference:
  - #highlight[x86_64-pc-windows-msvc] : uses Microsoft Visual C++ (MSVC) ABI, MSVCRT (Microsoft C Runtime Library), Full compatibility with Windows apps ,Optimized for Windows and Native Windows apps, Visual Studio projects
  - aarch64-pc-windows-msvc: for ARM64 CPU's
  - x86_64-pc-windows-gnu: uses GNU (MinGW) ABI, uses libgcc and libstdc++ (GNU libraries) for c runtimes, Requires MinGW installation (separate toolchain) and Portable apps, cross-compiling from Linux
