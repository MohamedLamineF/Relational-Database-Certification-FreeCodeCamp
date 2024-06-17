# Learn Advanced Bash by Building a Kitty Ipsum Translator

In this we walk  through various bash commands, redirections, and script writing techniques.

# Tutorial Summary
1. [Redirecting Output to a File](#redirecting-output-to-a-file)
2. [Appending vs Overwriting Files](#appending-vs-overwriting-files)
3. [Redirecting stderr Output](#redirecting-stderr-output)
4. [Using stdin for Input](#using-stdin-for-input)
5. [Piping Commands](#piping-commands)
6. [Using `cat` Command](#using-cat-command)
7. [Creating and Running a Script](#creating-and-running-a-script)
8. [Using `wc` Command](#using-wc-command)
9. [Using `grep` Command](#using-grep-command)
11. [Using `sed` Command](#using-sed-command)
12. [Creating a Translation Script](#creating-a-translation-script)
13. [Viewing Differences with `diff`](#viewing-differences-with-diff)

## Redirecting Output to a File

- Redirect output to a file: `<command> > <filename>`.
- Example: `echo hello bash > stdout.txt`.

## Appending vs Overwriting Files

- Append to a file using `>>`.
- Overwrite a file using `>`.
- Example: `echo hello bash >> stdout.txt` (append) vs `echo hello bash > stdout.txt` (overwrite).

## Redirecting stderr Output

- Redirect stderr using `2>`.
- Example: `bad_command 2> stderr.txt`.

## Using stdin for Input

- Use `read` to get input from stdin.
- Example: `read NAME` and `echo $NAME`.

## Piping Commands

- Use pipe (`|`) to pass output of one command as input to another.
- Example: `echo hello | read NAME`.

## Using `cat` Command

- Print contents of a file: `cat <filename>`.
- Use `cat` with stdin: `cat < filename`.

## Creating and Running a Script

- Create a script: `touch script.sh`.
- Make it executable: `chmod +x script.sh`.
- Add shebang: `#!/bin/bash`.
- Use `read` and `echo` in the script.

## Using `wc` Command

- Word count: `wc <filename>`.
- Count lines: `wc -l <filename>`.
- Count words: `wc -w <filename>`.
- Count characters: `wc -c <filename>`.

## Using `grep` Command

- Search for patterns: `grep '<pattern>' <filename>`.
- Use `--color` to highlight matches.
- Use regular expressions: `grep 'meow[a-z]*' <filename>`.

## Using `sed` Command

- Replace text: `sed 's/<pattern>/<replacement>/' <filename>`.
- Use global flag: `sed 's/<pattern>/<replacement>/g'`.
- Example: `sed 's/cat/dog/g' <filename>`.

## Creating a Translation Script

- Create `translate.sh` script.
- Replace text in files using `sed`.
- Example: `sed 's/cat/dog/g' <input_file> > <output_file>`.

## Viewing Differences with `diff`

- View differences: `diff <file_1> <file_2>`.
- Use `--color` for colored output: `diff --color <file_1> <file_2>`.
