# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Setup
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# pyenv manages the python version
# pipenv manages all the dependency libraries
install-dev-deps:
    brew install pyenv
    pyenv install 3.11.5 # or w/ever latest stable is 
    pip3 install pipenv

# for projects that require any secrets locally
# Note: this requires having 1Password8 (not 7!) installed & configured
install-1pwd-cli:
    brew install --cask 1password/tap/1password-cli


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Run
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

run:
    pipenv run python main.py

shell:
    echo 'To get an interactive shell with all deps loaded, run `pipenv shell`'
    echo 'Run `exit` to exit the shell'

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Run your tests often / don't let them go stale
# Rejoice when they pass / and rejoice when they fail
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Run the tests
test:
    pipenv run pytest

# Run the tests with coverage
test-coverage:
    pipenv run pytest --cov=src --cov-report=html

# Run the tests with coverage and open the coverage report in the browser
test-coverage-open:
    pipenv run pytest --cov=src --cov-report=html && open htmlcov/index.html


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Housekeeping
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# If you change any dependencies in the Pipfile, you'll need to run this to regenerate the Pipfile.lock
update-pipfile-lock:
    pipenv lock

typecheck:
    pipenv run mypy --config-file pyproject.toml src/*

lint:
    pipenv run pylint --rcfile pylint.rc src/*

format:
    pipenv run isort --settings-path=pyproject.toml src/*
    pipenv run black --config=pyproject.toml src/*
    pipenv run docformatter --config=pyproject.toml --in-place --recursive src/*

# Run the formatters in dry-run mode to see what would change
format-dry-run:
    pipenv run isort --settings-path=pyproject.toml --check-only --diff src/*
    pipenv run black --config=pyproject.toml --check --diff src/*
    pipenv run docformatter --config=pyproject.toml --in-place --recursive --check src/*

tidy: typecheck format lint
    echo 'done ✨'

    