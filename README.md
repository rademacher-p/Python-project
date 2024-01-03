# Python project

[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/charliermarsh/ruff/main/assets/badge/v2.json)](https://github.com/charliermarsh/ruff)
[![types - Mypy](https://img.shields.io/badge/types-Mypy-blue.svg)](https://github.com/python/mypy)
[![Hatch project](https://img.shields.io/badge/%F0%9F%A5%9A-Hatch-4051b5.svg)](https://github.com/pypa/hatch)
![CI](https://github.com/rademacher-p/Python-project/actions/workflows/ci.yml/badge.svg)
[![codecov](https://codecov.io/github/rademacher-p/Python-project/graph/badge.svg?token=OKPQ9m3mQT)](https://codecov.io/github/rademacher-p/Python-project)
<!-- [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6886844.svg)](https://doi.org/10.5281/zenodo.6886844) -->

> **Note**: This project is under active development. :construction:

A template for Python project layout and configuration.

## Installation
This package is developed for [Python](https://www.python.org/downloads/) 3.11+. Best practice is to first create a [virtual environment](https://docs.python.org/3/tutorial/venv.html). The package can be installed locally using `pip install <path>`, where `<path>` is the top-level directory containing `pyproject.toml`. Note that the [editable option](https://pip.pypa.io/en/stable/topics/local-project-installs/#editable-installs) should be included during development to track any package modifications. To install optional packages, specify the `extras` and/or `dev` [extras](https://peps.python.org/pep-0508/#extras), as exemplified [here](https://pip.pypa.io/en/stable/cli/pip_install/#examples).

The project management tool [hatch](https://hatch.pypa.io/) is recommended to simplify local installation. Simply execute `hatch shell` to create and enter a virtual environment with the package installed in development mode (editable install plus extras).
