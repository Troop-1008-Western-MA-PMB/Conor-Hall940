# Bug Report: language2/language2.cob (COBOL)

**File:** `Projects/language2/language2.cob`
**Language:** COBOL
**Compiler:** GnuCOBOL (cobc) 3.1.2.0
**Compile Command:** `cobc -x Projects/language2/language2.cob -o language2`
**Status:** ❌ Compilation Failed

---

## Compiler Output

```
language2.cob:1: error: invalid indicator 'F' at column 7
language2.cob:2: error: invalid indicator 'M' at column 7
language2.cob:4: error: invalid indicator 'I' at column 7
language2.cob:5: error: invalid indicator 'G' at column 7
language2.cob:6: error: invalid indicator 'U' at column 7
language2.cob:7: error: invalid indicator 'U' at column 7
language2.cob:8: error: invalid indicator 'E' at column 7
language2.cob:10: error: invalid indicator 'U' at column 7
language2.cob:11: error: invalid indicator 'P' at column 7
language2.cob:13: error: invalid indicator 'L' at column 7
language2.cob:14: error: invalid indicator 'L' at column 7
language2.cob:16: error: invalid indicator 'r' at column 7
language2.cob:17: error: invalid indicator 'N' at column 7
language2.cob:18: error: invalid indicator 'L' at column 7
language2.cob:20: error: invalid indicator 'r' at column 7
language2.cob:21: error: invalid indicator 'R' at column 7
language2.cob:22: error: invalid indicator 'L' at column 7
language2.cob:24: error: invalid indicator 'f' at column 7
language2.cob:25: error: invalid indicator 'L' at column 7
language2.cob:26: error: invalid indicator 'S' at column 7
language2.cob:28: error: invalid indicator 'f' at column 7
language2.cob:32: error: invalid indicator 'S' at column 7
language2.cob:33: error: PROGRAM-ID header missing
```

---

## Bug List

### Bug 1 — All lines: Line numbers included in source file
- **Lines:** 1, 2, 4–8, 10–11, 13–14, 16–18, 20–22, 24–26, 28, 32
- **Code:** e.g. `1. IDENTIFICATION DIVISION.`, `2. PROGRAM-ID. ARITH-CALC.`
- **Error:** `error: invalid indicator '<letter>' at column 7`
- **Description:** Each line in the file begins with a number and a period (e.g., `1. `, `2. `). In COBOL's fixed-format layout, column 7 is the indicator area. The letters from the line-number prefix land in that position and are treated as illegal indicator characters. These line-number labels are not valid COBOL syntax and must be removed.

---

### Bug 2 — Line 7: Invalid data name `NUM 2` (space in name)
- **Line:** 7
- **Code:** `01 NUM 2 PIC 9(3) VALUE 50.`
- **Error:** Cascades from Bug 1; underlying issue is an invalid data name containing a space.
- **Description:** `NUM 2` contains a space, which is not allowed in a COBOL data name. The name must be a single token with no embedded spaces (e.g., `NUM2`).

---

### Bug 3 — Line 11: Invalid paragraph name `MAIN- PROSECUDER`
- **Line:** 11
- **Code:** `MAIN- PROSECUDER.`
- **Error:** Cascades from Bug 1; underlying issue is an invalid paragraph name with a space and a spelling error.
- **Description:** `MAIN- PROSECUDER` contains a space after the hyphen and is misspelled. COBOL paragraph names cannot contain embedded spaces after a hyphen (the hyphen must directly connect the two parts). The intended name appears to be `MAIN-PROCEDURE`.

---

### Bug 4 — Line 33: PROGRAM-ID header missing
- **Line:** 33 (end of file)
- **Error:** `error: PROGRAM-ID header missing`
- **Description:** This error is a cascading result of Bug 1: because all line content is shifted out of its expected COBOL columns by the line-number prefix, the compiler never successfully parses the `PROGRAM-ID` declaration. Fixing Bug 1 should resolve this error.
