setup:
	bin/setup
	bin/rails db:fixtures:load

install:
	bundle install

test:
	bundle exec rake test

lint:
	bundle exec rubocop .

correct:
	bundle exec rubocop -A

start:
	heroku local -p 3000

deploy:
	git push heroku main

.PHONY: test
