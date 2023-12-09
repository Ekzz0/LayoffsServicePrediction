import pathlib

from pkg_resources import parse_requirements
from setuptools import find_packages, setup


def requirements(filepath: str):
    with pathlib.Path(filepath).open() as requirements_txt:
        return [
            str(requirement)
            for requirement in parse_requirements(requirements_txt)
        ]


setup(
    name="ml_app",
    version="0.1.0",
    packages=find_packages(exclude=["tests"]),
    python_requires=">=3.11",
    install_requires=requirements("requirements.txt"),
)
