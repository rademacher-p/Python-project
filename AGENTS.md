# AGENTS.md - Python Development Guidelines

This repository uses an agentic development workflow powered by the Astral toolchain (`uv`, `ruff`, `ty`) and `pytest`. All autonomous agents and contributors must strictly adhere to the execution loop, typing standards, and documentation conventions defined below.

---

## 1. Environment & Toolchain Execution

**CRITICAL:** Never invoke `python`, `pip`, `pytest`, `ruff`, or `ty` directly from the global environment. Always prefix commands with `uv run` to ensure execution occurs within the managed virtual environment.

| Task                   | Command                     | When to Run                                        |
| ---------------------- | --------------------------- | -------------------------------------------------- |
| **Run Tests**          | `uv run pytest`             | After any code or test modification.               |
| **Format Code**        | `uv run ruff format .`      | Before linting and after writing code.             |
| **Lint & Fix**         | `uv run ruff check --fix .` | Immediately after formatting.                      |
| **Type Check**         | `uv run ty check`           | After linting; all type errors must be resolved.   |
| **Add Dependency**     | `uv add <package>`          | When a new runtime package is required.            |
| **Add Dev Dependency** | `uv add --dev <package>`    | When a new testing or tooling package is required. |

### The Agent Development Loop

Before marking any task as complete, you **must** execute the following verification loop and resolve all surfaced issues:

1. Write or update implementation and corresponding `pytest` tests.
2. Run `uv run ruff format .` to enforce PEP 8 formatting.
3. Run `uv run ruff check --fix .` and manually fix any remaining unfixable lint errors.
4. Run `uv run ty check` and resolve all static type errors.
5. Run `uv run pytest` and ensure 100% of the test suite passes.

---

## 2. Code Style & Modern Typing Conventions

All code must strictly follow **PEP 8** style conventions and incorporate complete static type annotations verified by `ty`.

### Typing Standards (PEPs 484, 585, 695, 696)

Always use modern Python 3.13+ typing syntax. Do **not** use legacy `typing` module imports when built-in equivalents exist.

| Standard    | Requirement                                                    | Do This (Modern)                                                      | Do NOT Do This (Legacy)                          |
| ----------- | -------------------------------------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------ |
| **PEP 484** | Type all function signatures, attributes, and return values.   | `def parse(raw: str) -> int:`                                         | `def parse(raw):`                                |
| **PEP 585** | Use built-in collection types for generics.                    | `list[str]`, `dict[str, int]`, `tuple[int, ...]`                      | `List[str]`, `Dict[str, int]`, `Tuple[int, ...]` |
| **PEP 604** | Use union pipe syntax instead of `Optional` or `Union`.        | `str \| None`, `int \| float`                                         | `Optional[str]`, `Union[int, float]`             |
| **PEP 695** | Use the `type` statement and inline `[T]` syntax for generics. | `type Point[T] = tuple[T, T]`<br>`def first[T](items: list[T]) -> T:` | `T = TypeVar("T")`<br>`Point = Tuple[T, T]`      |
| **PEP 696** | Provide default types for type parameters where appropriate.   | `class Box[T = str]: ...`                                             | Unparameterized fallbacks or redundant overloads |

---

## 3. Documentation & Docstrings

Use **Google-style docstrings** across the entire codebase.

| Scope                          | Requirement                                                                                                                                                                                                 |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Modules**                    | Every `.py` file must begin with a module-level docstring summarizing its purpose.                                                                                                                          |
| **Public Classes & Functions** | Must include a full Google-style docstring with `Args:`, `Returns:`, and `Raises:` sections (where applicable). Do not duplicate type hints inside the docstring text if they are already in the signature. |
| **Small Helper Functions**     | Private or trivial helper functions (e.g., `_normalize_key()`) only require a concise, one-line docstring (`"""Normalize string key to lowercase."""`).                                                     |

### Docstring Example

```python
"""Data processing utilities for sensor telemetry."""


def calculate_moving_average[T: (int, float)](
    values: list[T], window_size: int = 3
) -> list[float]:
    """Compute the simple moving average over a sequence of numeric values.

    Args:
        values: Input sequence of integer or float measurements.
        window_size: Number of consecutive elements to average per window.

    Returns:
        A list of computed moving averages. Returns an empty list if
        `values` contains fewer elements than `window_size`.

    Raises:
        ValueError: If `window_size` is less than or equal to zero.
    """
    if window_size <= 0:
        raise ValueError("window_size must be positive.")
    if len(values) < window_size:
        return []
    return [
        sum(values[i : i + window_size]) / window_size
        for i in range(len(values) - window_size + 1)
    ]


def _is_valid_sample(val: float | None) -> bool:
    """Return True if the sample is non-null and finite."""
    return val is not None
```

---

## 4. Testing Standards (`pytest`)

Every new feature, bug fix, or refactor must include accompanying unit tests executed via `uv run pytest`.

| Rule                | Implementation Details                                                                                  |
| ------------------- | ------------------------------------------------------------------------------------------------------- |
| **Structure**       | Mirror the source directory structure inside `tests/` (e.g., `src/pkg/core.py` → `tests/test_core.py`). |
| **Design**          | Prefer standalone `test_*` functions and `pytest.fixture` over `unittest.TestCase` classes.             |
| **Parametrization** | Use `@pytest.mark.parametrize` to cover edge cases, boundary conditions, and invalid inputs concisely.  |
| **Type Safety**     | Annotate test functions (`-> None`) and fixture return types so `ty` can validate test code as well.    |
