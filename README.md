# francinot

A test runner for 42 projects regrouping many different testers

Aims to be more maintainable and simpler to contribute to, less abstractions, less complexity.

- Please don't blindly paste commands from this readme without understanding what you are doing.
- Please take a look at the source it's really not all that complex.
- Please write your own tests and contribute them as a new runner to this repository.

## installation

```bash
git clone https://github.com/jukefr/francinot /to/somehwere/you/want

# then add an alias in your .bashrc or .zshrc if you want
```

## usage

```bash
francinot <module> <mandatory/bonus>

francinot libft m
francinot libft b
```