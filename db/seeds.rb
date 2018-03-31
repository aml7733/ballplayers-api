# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Sport.create([{title: "baseball"}, {title: "football"}, {title: "basketball"}])

baseball_file = File.read("./db/baseball_players.txt")
baseball_list = JSON.parse(baseball_file)
Player.create_baseball_players_from_JSON(baseball_list['body']['players'])

football_file = File.read("./db/football_players.txt")
football_list = JSON.parse(football_file)
Player.create_football_players_from_JSON(football_list['body']['players'])

basketball_file = File.read("./db/basketball_players.txt")
basketball_list = JSON.parse(basketball_file)
Player.create_basketball_players_from_JSON(basketball_list['body']['players'])

Position.populate_all_avg_ages

Player.populate_age_diff
# Populates player database and
