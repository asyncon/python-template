#!/usr/bin/env bash

(
    if git rev-parse --show-toplevel;then
        true
    else
        git init -b main &&
        git remote add origin git@github.com:{{ cookiecutter.github_username }}/{{ cookiecutter.repo_name }}
    fi
) &&
export PIPENV_VENV_IN_PROJECT=1 &&
pipenv update --dev --python={{ cookiecutter.requires_python }} &&
pipenv run pre-commit autoupdate &&
git add . &&
pipenv run pre-commit run -a &&
git commit -m 'Initial commit' &&
pipenv run test --cov-fail-under=100 &&
pipenv --rm &&
git clean -fX .
