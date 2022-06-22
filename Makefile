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

brake:
	bundle exec brakeman -q -w2

check: lint test brake

test-coverage:
	open coverage/index.html

webpack:
	bin/webpack-dev-server

clean:
	rake assets:clobber

dbm:
	bin/rails db:migrate

console:
	bin/rails console

seed:
	bin/rails db:fixtures:load

push:
	git push -u origin master

heroku-start:
	heroku local

heroku-dbm:
	heroku run rake db:migrate

heroku-console:
	heroku run rails console

heroku-seed:
	heroku run rake db:seed

heroku-logs:
	heroku logs --tail

routes:
	bin/rails routes -g 'root|landing|devise|post|comment|like'
.PHONY: test
