# drLL — Recursive Descent LL(1) Parser

**Author:** Maria Romero Martin 
**Emails:** 100472330@alumnos.uc3m.es 
**University:** Universidad Carlos III de Madrid (UC3M)

---

## Overview

`drLL` is a **recursive descent LL(1) parser** written in C. It reads arithmetic and assignment expressions from standard input, validates them against a defined LL(1) grammar, and outputs them in a formatted, human-readable form.

The parser supports:
- Arithmetic operations: `+`, `-`, `*`, `/`
- Ternary conditional expressions: `?`
- Variable assignments: `=`
- Variables (single letter or letter followed by one alphanumeric character)
- Integer numbers

---

## Grammar

The grammar used by the parser is:

```
Axiom ::= P
P     ::= E | V | N
E     ::= ( C )
C     ::= O P P | ? P P P | = V A
A     ::= P X
X     ::= lambda | P P
O     ::= T_OPERATOR        (+, -, *, /)
V     ::= T_VARIABLE        (letter followed by optional letter/digit)
N     ::= T_NUMBER          (one or more digits)
```

---

## Build

Compile with `gcc`:

```bash
gcc drLL.c -o drLL
```

---

## Usage

### Multi-line mode (default)
Reads and parses multiple input lines until an error is encountered or EOF is reached:

```bash
./drLL
```

### Single-line mode
Parses a single input line (useful if the program freezes in multi-line mode):

```bash
./drLL -s
```

### Input from a file

```bash
./drLL < input.txt
```

---

## Input Format

Each input line must be a valid expression according to the grammar above. Expressions are written in **prefix/parenthesized notation**:

| Input        | Meaning                  | Output          |
|--------------|--------------------------|-----------------|
| `(+ 3 4)`    | 3 + 4                    | `(3 + 4)`       |
| `(* x 5)`    | x * 5                    | `(x * 5)`       |
| `(= x 7)`    | x = 7                    | `(x = 7)`       |
| `(? a b c)`  | a ? b : c                | `(a ? b : c)`   |

---

## Error Handling

If the parser encounters an unexpected token, it prints a descriptive error message to `stderr` indicating the line number and the expected vs. received token, then exits:

```
ERROR in line N -- Unexpected Token (Expected:..., Read:...) at end of Parsing
```

---

## File Structure

```
PARSER-RECURSIVO-DESCENDENTE/
├── drLL.c      # Parser source code
├── drLL        # Compiled binary
└── README.md   # This file
```
