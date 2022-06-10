# Collection of *RAW* C code translated to Nim

For wrapping **c libraries** is used [**c2nim**](https://github.com/nim-lang/c2nim) - a tool to translate Ansi C code to Nim. The output is human-readable Nim code that is meant to be tweaked by hand before and after the translation process.

# How to generate Nim FFI bindings for a C library

1. Create a C file that includes the headers you need
    1. Include all the headers that you want **omit** from the final result
    (e.g. the C stdlib headers) in well delimited section. In the example below
    we do that between two variables, but the specifics don't matter as long
    they're not comments (comments are stripped).
    2. After this delimited section include actual library headers
2. Run `gcc -E` on this C file (don't forget to use the `-I` flag to specify the
path to library headers)
3. Filter the result with `sed`. In the example below we delete the whole
section delimeted by the two variables.
4. Finally run c2nim on the final file

``` sh
# Run the GCC preprocessor on someCLib:
gcc -I/nix/store/vcqgb02gvjcyh28d226llq9a671i9al5-someCLib-1.11.0/include -E someCLib_includes.c | sed '/__c_std_lib_include_start/,/__c_std_lib_include_end/d' > someCLib_includes.i

# Run c2nim on the resulting file:
nix run github:nix-community/flake-nimble#c2nim -- --cdecl --importc --dynlib:libsomeCLib.so   --nep1  someCLib_includes.i

```
