
# README

# minesweeper-API

* Ruby Backend API for the CodingChallengeRubyBackend.

* This application uses Ruby version 2.7.2 To install, use rvm or rbenv.

* RVM

`rvm install 2.7.2`

`rvm use 2.7.2`

* Rbenv

`rbenv install 2.7.2`

* Bundler provides a consistent environment for Ruby projects by tracking and installing the exact gems and versions that are needed. I recommend bundler version 2.0.2. To install:


* You need Rails. The rails version being used is rails version 6

* To install:

`gem install rails -v '~> 6'` 

* Installation To get up and running with the project locally, follow the following steps.

* Clone the app

* With SSH

`git@github.com:Mutuba/minesweeper-graphql-ruby-API.git`

* With HTTPS

`https://github.com/Mutuba/minesweeper-graphql-ruby-API.git`


* Move into the directory and install all the requirements.

* cd CodingChallengeRubyBackend

* check out to master branch

* run `bundle install` to install application packages

* Run `rails db:create` to create a database for the application

* Run `rails db:migrate` to run database migrations and create database tables

* The application can be run by running the below command:-

`rails s` or `rails server`

* The application has tests as it was implemented using TDD.

* To run tests, run the following command:-

` bundle exec rspec`

* This will show test coverage when all tests have run.

* Example:

`Coverage report generated for RSpec to /Users/mutuba/Desktop/minesweeper-API/public/coverage. 527 / 543 LOC (97.05%) covered.`

* The API has been hosted on heroku and can be found on this url: `https://minesweeper-rails-graphql-api.herokuapp.com/graphql`

* The API can be tested using my favourite tool `Firecamp` for graphql APIs that can be downloaded and installed just like postman



* To create a game, make a POST request with the payload below to `https://minesweeper-rails-graphql-api.herokuapp.com/graphql` 

```
mutation {
  createGame(input: {player: "", board: {rows: 10, cols: 10, minesPercentage: 10}}) {
    game {
      over
      id
      player
      won
    }
  }
}

```


* To play a game, make a POST request with the payload below to `https://minesweeper-rails-graphql-api.herokuapp.com/graphql` 

```
mutation {
  playGame(input: {move: {x: 10, y: 10}, gameId: 10}) {
    id
    x
    y
    game {
      id
      over
      player
      won
    }
  }
}

```
 
## Deliverables we expect:
* URL where the game can be accessed and played (use any platform of your preference: heroku.com, aws.amazon.com, etc)
* Code in a public Github repo
* README file with the decisions taken and important notes

## Decisions and Time taken

* The mines are calculated by a percentage of user choice
* Save the name of a player on the game
* The choice of a service pattern was key to support model be slim (help in implementing business login)
* Mutations, queries and inputs are modular. All mutations for games are in games module so are for plays.

* Specs are organized in a similar fashion.


## Todos

* Ensure authentication and track plays and time

* Ability to start a new game and preserve/resume the old ones

* Ability to 'flag' a cell with a question mark or red flag
