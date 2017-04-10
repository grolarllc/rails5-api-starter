# How to Install

I have included a step by step guide in this README on how I set this up. But if you just want to get up and running, here are the steps:

1. Clone this repository
2. Rename the repo `mv rails5-api-guide/ api`
3. Inside your database.yml rename the database to whatever you want, otherwise it will just be named `generic_api_development`, `generic_api_test`, `generic_api_production` for each environment respectively.
4. Rename the top level module inside `application.rb` to whatever you want otherwise it will be named `GenericApi`
5. Run `bundle install`
6. Run `bundle exec rake db:create`
7. Run `bundle exec rake db:migrate; RAILS_ENV=test bundle exec rake db:migrate`
8. Boot up the server with `rails s` and navigate to localhost:3000 to see your new rails application

If you are interested in how this app was setup and what is included read on.