
This is a python project base template, set up the way I like my projects organized 👾✨


### Installation

1. Install [just](https://github.com/casey/just)

On mac you can run:
```
brew install just
```

For why/how to use Just see `[a loveletter to workflow automation](https://anniecherkaev.com/workflow-automation)`.


2. Install the dev deps `pyenv` & `pipenv`:

```
just install-dev-deps
```

### Set up & install package dependencies

Dependencies are encoded in the Pipfile & sorted into dev dependencies (needed to work on the project) and packages (necessary to run the project).

Install w/:

```
just install-runtime-deps
```

To add a new dependency run:
```
just add-new-dep <my-dependency-here>
```

# Run

`just run`

# Test

`just test`

# Typecheck, lint & format

`just tidy`