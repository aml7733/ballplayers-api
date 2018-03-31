# Player API README

Rails API to fetch player statistic JSON data from database.  Our data comes from http://api.cbssports.com/fantasy/players/list?version=3.0

## API endpoints

  GET /players  returns JSON list of all players in the database.
    It also takes a sport parameter, namely one of the following:
    "/players?sport=football", "/players?sport=baseball", and "/players?sport=basketball"
    to list only players from the specified sport.

  GET /players/:id    returns a single JSON entry for the player requested


## Getting Started

Change to your target parent directory, and clone the repository there.  Running
```
bundle install
```
will load all necessary gems for development/testing.  Running
```
rails db:seed
```
will populate the database with all players from the CBS Sports list (curl'd into files in ./db for ease).
Note: this will take several minutes.  After that, boot up a rails server and get your JSON on.



## Running the tests

RSpec is the testing framework used.  Options are configured for verbose passes/failures.
Once in the parent directory for the project, run
```
rspec
```
to begin the testing suite.
I've used FactoryBot and Faker to simulate sports, positions, and players.
My basic model tests check for valid ActiveRecord relationships.
Request testing sends mock requests to API endpoints.  The http response is tested as well as the content.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
