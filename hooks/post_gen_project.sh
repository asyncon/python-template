#!/usr/bin/env bash

(
    if git rev-parse HEAD;then
        true
    elif git rev-parse --show-toplevel;then
        git branch -m main
    else
        git init -b main &&
        git remote add origin git@github.com:{{ cookiecutter.github_username }}/{{ cookiecutter.repo_name }}
    fi
) &&
{%- if '.' in cookiecutter.project_slug %}
{%- set realpath = cookiecutter.project_slug.replace('.','/') %}
mkdir -p src/{{realpath.rsplit('/',1)[0]}} &&
mv src/{{cookiecutter.project_slug}} src/{{realpath}} &&
(
    (
    echo &&
{%- if realpath.count('/') > 1 %}
    echo "# Implicit namespace packaging cannot have *.py in parent's parent folders" &&
{%- endif %}
{%- for p in range(realpath.count('/')) %}
{%- if loop.last %}
    echo "# Implicit namespace packaging cannot have __init__.py in immediate parent folder" &&
    echo "/src/{{realpath.rsplit('/',loop.length - p)[0]}}/__init__.py"
{%- else %}
    echo "/src/{{realpath.rsplit('/',loop.length - p)[0]}}/*.py" &&
{%- endif %}
{%- endfor %}
    ) >> .gitignore
) &&
{%- endif %}
export PIPENV_VENV_IN_PROJECT=1 &&
pipenv update --dev --python={{ cookiecutter.requires_python }} &&
pipenv run pre-commit autoupdate &&
git add . &&
pipenv run pre-commit run -a &&
git commit -m 'Initial commit' &&
pipenv run test --cov-fail-under=100 &&
pipenv --rm &&
git clean -fX .
