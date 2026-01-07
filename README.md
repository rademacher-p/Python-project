# Python project

[![uv](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/uv/main/assets/badge/v0.json)](https://github.com/astral-sh/uv)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/charliermarsh/ruff/main/assets/badge/v2.json)](https://github.com/charliermarsh/ruff)
[![ty](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ty/main/assets/badge/v0.json)](https://github.com/astral-sh/ty)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit)
![CI](https://github.com/rademacher-p/Python-project/actions/workflows/ci.yml/badge.svg)
[![codecov](https://codecov.io/github/rademacher-p/Python-project/graph/badge.svg?token=OKPQ9m3mQT)](https://codecov.io/github/rademacher-p/Python-project)
<!-- [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6886844.svg)](https://doi.org/10.5281/zenodo.6886844) -->

> **Note**: This project is under active development. :construction:

A template for Python project layout and configuration.

## Installation
> The project management tool [uv](https://docs.astral.sh/uv/) is recommended! Simply use `uv run <path>` to run code with fast, automatic virtual environment synchronization :rocket:

This package is developed for [Python](https://www.python.org/downloads/) 3.13+. Best practice is to first create a [virtual environment](https://docs.python.org/3/tutorial/venv.html). The package can be installed locally using `pip install <path>`, where `<path>` is the top-level directory containing `pyproject.toml`. To install optional packages, specify [extras](https://peps.python.org/pep-0508/#extras), as exemplified [here](https://pip.pypa.io/en/stable/cli/pip_install/#examples).

### Developers
Developers should install the package with the [editable option](https://pip.pypa.io/en/stable/topics/local-project-installs/#editable-installs) to track any modifications. Additionally, commands should be run to activate formatting/linting [git hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks). The following setup is recommended for new environments:
```shell
pip install --upgrade pip
pip install -e <path>[dev]
pre-commit install
```


<!-- The package can then be installed directly from GitHub using
```
pip install git+https://github.com/rademacher-p/Python-project
```
To install a specific version or branch, [specify a ref](https://pip.pypa.io/en/stable/topics/vcs-support/). -->
