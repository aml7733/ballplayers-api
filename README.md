# Player API README

Rails API to fetch player statistic JSON data from database.  Our data comes from http://api.cbssports.com/fantasy/players/list?version=3.0
Note on the data: about 1/3 of player entries didn't have an age listed, and there were a few non-player entries
{firstname: "", lastname: "A's Staff", position: "", ...} etc.  

The database uses models for Sport, Position, and Player such that a Sport has_many Positions and Players, and a Position has_many players.
This relationship allows storage of the positional average age outside the player model, since the player already has two age-related attributes.
My original code returns players with a position object-> ..., position: { title: "C", avg_age: 22.6 }, but then I thought the the JSON would be easier to consume (and more conventional) if it read the same as the other attributes; ..., position: "C". I wrote my own serializer (ugly but works), but left the old 'to_json' rendering right underneath if you want to do a quick nip/tuck in the controller. The tests pass with either serializing method.

## API endpoints

  GET /players  returns JSON list of all players in the database.
    It takes a sport parameter, namely one of the following:
    "/players?sport=football", "/players?sport=baseball", and "/players?sport=basketball"
    to list only players from the specified sport.

  GET /players/:id    returns a single JSON entry for the player by id.


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
