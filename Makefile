setup:
	bin/setup
	bin/rails db:fixtures:load

install:
	bundle install

test:
	bundle exec rake test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

correct:
	bundle exec rubocop -A

start:
	heroku local -p 3000

deploy:
	git push heroku main

.PHONY: test
