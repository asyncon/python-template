import pytest

from {{cookiecutter.project_slug}} import __version__


@pytest.fixture
def version():
    return __version__
