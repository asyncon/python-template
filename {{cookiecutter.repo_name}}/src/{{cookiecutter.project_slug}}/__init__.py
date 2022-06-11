from importlib.metadata import PackageNotFoundError, version

try:
{%- if cookiecutter.project_slug.replace('.','-').replace('_','-') == cookiecutter.repo_name.replace('.','-').replace('_','-') %}
    __version__ = version(__name__)
{%- else %}
    __version__ = version("{{cookiecutter.repo_name}}")
{%- endif %}
except PackageNotFoundError:  # pragma: no cover
    # package is not installed
    __version__ = "0.0.0.dev0"
