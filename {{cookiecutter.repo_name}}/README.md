# {{ cookiecutter.project_name }}

{{ cookiecutter.project_short_description }}

[![Test](https://github.com/{{cookiecutter.github_username}}/{{cookiecutter.repo_name}}/actions/workflows/test.yml/badge.svg)](https://github.com/{{cookiecutter.github_username}}/{{cookiecutter.repo_name}}/actions/workflows/test.yml)
[![Docs](https://readthedocs.org/projects/setuptools-pipfile/badge/?version=latest)](https://setuptools-pipfile.readthedocs.io/en/latest/?badge=latest)
[![Coverage](https://coveralls.io/github/{{cookiecutter.github_username}}/{{cookiecutter.repo_name}}/badge.svg?branch=main)](https://coveralls.io/github/{{cookiecutter.github_username}}/{{cookiecutter.repo_name}}?branch=main)
[![PyPI](https://img.shields.io/pypi/v/{{cookiecutter.repo_name}}.svg)](https://pypi.org/project/{{cookiecutter.repo_name}}/)
[![{{cookiecutter.open_source_license}}](https://img.shields.io/pypi/l/{{cookiecutter.repo_name}}.svg)](https://github.com/{{cookiecutter.github_username}}/{{cookiecutter.repo_name}}/blob/master/LICENSE)
[![Python](https://img.shields.io/pypi/pyversions/{{cookiecutter.repo_name}}.svg)](https://pypi.org/project/{{cookiecutter.repo_name}}/)
[![Downloads](https://pepy.tech/badge/{{cookiecutter.repo_name}})](https://pepy.tech/project/{{cookiecutter.repo_name}})
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)

## Installation

```
pip install {{ cookiecutter.repo_name }}
```

## Development Setup

```bash
pipenv run setup
```
