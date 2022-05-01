install:
	bundle install

linter-code-fix:
	bundle exec rubocop -A

deploy:
	git push heroku main

start:
	heroku local -p 3000

test:
	bundle exec rake test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

correct:
	bundle exec rubocop -a

.PHONY: test
