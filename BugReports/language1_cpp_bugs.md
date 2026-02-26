# Bug Report: language1/lanuage1.cxx (C++)

**File:** `Projects/language1/lanuage1.cxx`
**Language:** C++
**Compiler:** g++ (GCC) 13.3.0
**Compile Command:** `g++ Projects/language1/lanuage1.cxx -o language1`
**Status:** ❌ Compilation Failed

---

## Compiler Output

```
lanuage1.cxx:1:1: error: 'C' does not name a type
lanuage1.cxx: In function 'int main()':
lanuage1.cxx:5:15: error: 'lenght' was not declared in this scope
lanuage1.cxx:8:15: error: 'width' was not declared in this scope
lanuage1.cxx:10:3: error: 'area' was not declared in this scope
lanuage1.cxx:10:8: error: 'length' was not declared in this scope
lanuage1.cxx:11:8: error: 'ccout' is not a member of 'std'; did you mean 'wcout'?
lanuage1.cxx:11:62: error: 'end1' is not a member of 'std'; did you mean 'ends'?
lanuage1.cxx:13:3: error: 'return0' was not declared in this scope
```

---

## Bug List

### Bug 1 — Line 1: Invalid language label as code
- **Line:** 1
- **Code:** `C++`
- **Error:** `error: 'C' does not name a type`
- **Description:** The text `C++` on line 1 is a language label, not valid C++ source code. It causes a parse error and cascading errors throughout the file.

---

### Bug 2 — Line 5: Undeclared variable `lenght` (misspelling)
- **Line:** 5
- **Code:** `std::cin >> lenght;`
- **Error:** `error: 'lenght' was not declared in this scope`
- **Description:** The variable `lenght` is used but never declared. This appears to be a misspelling of `length`. Variables must be declared before use in C++.

---

### Bug 3 — Line 8: Undeclared variable `width`
- **Line:** 8
- **Code:** `std::cin >> width;`
- **Error:** `error: 'width' was not declared in this scope`
- **Description:** The variable `width` is used but never declared. It must be declared before use.

---

### Bug 4 — Line 10: Undeclared variables `area` and `length`
- **Line:** 10
- **Code:** `area=length*width;`
- **Error:** `error: 'area' was not declared in this scope` / `error: 'length' was not declared in this scope`
- **Description:** Both `area` and `length` are used but never declared. Additionally, `length` on line 10 is spelled differently from `lenght` on line 5, indicating an inconsistent variable name.

---

### Bug 5 — Line 11: `std::ccout` — typo in `cout`
- **Line:** 11
- **Code:** `std::ccout << "the area of the rectangle is:"<<area <<std::end1;`
- **Error:** `error: 'ccout' is not a member of 'std'`
- **Description:** `std::ccout` is not a valid identifier. This is a typo; the correct name is `std::cout`.

---

### Bug 6 — Line 11: `std::end1` — typo in `endl`
- **Line:** 11
- **Code:** `std::ccout << "the area of the rectangle is:"<<area <<std::end1;`
- **Error:** `error: 'end1' is not a member of 'std'`
- **Description:** `std::end1` is not a valid identifier. The digit `1` was used instead of the letter `l`. The correct name is `std::endl`.

---

### Bug 7 — Line 13: `return0` — missing space in return statement
- **Line:** 13
- **Code:** `return0;`
- **Error:** `error: 'return0' was not declared in this scope`
- **Description:** `return0` is parsed as an identifier name rather than a `return` statement. There must be a space between `return` and `0`: `return 0;`.
