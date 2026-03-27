# miniruby-interpreter

This repository is for building `miniruby`, a Ruby-like interpreter written in OCaml for my Ruby learning.

The goal is to create a small language for studying basic Ruby syntax, so it only supports a limited subset of Ruby syntax such as:

- variables
- integer, string, boolean, and `nil` values
- binary operations
- `if`
- `while`
- `puts`

## Compile

Build the module files with `ocamlc`:

```sh
ocamlc -c syntax.ml
```

## Run

If `syntax.cmi` and `syntax.cmo` already exist in the same directory, you can run:

```sh
ocaml syntax_check_step1.ml
```

Or compile and run it as an executable:

```sh
ocamlc -o syntax_check_step1 syntax.ml syntax_check_step1.ml
./syntax_check_step1
```
