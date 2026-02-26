# Bug Report: language3/language3.cr (Crystal)

**File:** `Projects/language3/language3.cr`
**Language:** Crystal
**Compiler:** Crystal 1.11.2
**Compile Command:** `crystal build Projects/language3/language3.cr -o language3`
**Status:** ❌ Compilation Failed

---

## Compiler Output

```
Showing last frame. Use --error-trace for full trace.

In Projects/language3/language3.cr:22:13

 22 | num1 = gets.chomp.to_f
                  ^----
Error: undefined method 'chomp' for Nil (compile-time type is (String | Nil))
```

---

## Bug List

### Bug 1 — Line 22: Calling `chomp` on a potentially `Nil` value returned by `gets`
- **Line:** 22
- **Code:** `num1 = gets.chomp.to_f`
- **Error:** `Error: undefined method 'chomp' for Nil (compile-time type is (String | Nil))`
- **Description:** In Crystal, `gets` returns `String | Nil` (it can return `nil` if there is no input, e.g., at end-of-file). Calling `.chomp` directly on this value fails at compile time because `Nil` does not have a `chomp` method. The `nil` case must be handled before calling string methods.

---

### Bug 2 — Line 25: Same `Nil`-safety issue with `gets` for the operation input
- **Line:** 25
- **Code:** `operation = gets.chomp.chars.first`
- **Error:** Same root cause as Bug 1 — `gets` returns `String | Nil`; `.chomp` is undefined for `Nil`.
- **Description:** This line has the same `Nil`-safety problem as line 22. `gets` can return `nil`, so calling `.chomp` on it without handling the `nil` case is a compile-time type error in Crystal.

---

### Bug 3 — Line 28: Same `Nil`-safety issue with `gets` for the second number input
- **Line:** 28
- **Code:** `num2 = gets.chomp.to_f`
- **Error:** Same root cause as Bug 1 — `gets` returns `String | Nil`; `.chomp` is undefined for `Nil`.
- **Description:** This line has the same `Nil`-safety problem as lines 22 and 25. The compiler halted on line 22, so this error was not directly reported, but it contains the same pattern and would fail for the same reason.
