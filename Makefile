help:	## Show this help.
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


local-setup:
	pipenv install -d
	pipenv run pre-commit install
	pipenv run pre-commit install --hook-type commit-msg

test:
	pipenv run pytest
