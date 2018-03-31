class Player < ApplicationRecord
  belongs_to :position
  belongs_to :sport

  def self.create_baseball_players_from_JSON(player_hash)
    player_hash.each do |player|
      data_hash = {}
      next if player['firstname'] == "" # Skips non-player entries
      sport = Sport.find_by(title: "baseball")
      position = Position.find_or_create_by(title: player["position"], sport: sport)

      data_hash["name_brief"] = "#{player["firstname"].first}. #{player["lastname"].first.upcase}." #in case of Jacob deGrom, etc.
      data_hash["first_name"] = player["firstname"]
      data_hash["last_name"] = player["lastname"]
      data_hash["age"] = player["age"]
      data_hash["average_position_age_diff"] = 0

      unless Player.find_by(data_hash)
        new_player = Player.new(data_hash)
        new_player.sport = sport
        new_player.position = position
        new_player.save!
      end
    end
  end

  def self.create_football_players_from_JSON(player_hash) # Looks like 11 football players list "" as a position, and all 11 also list an age of nil.  I've deleted them, so as to not throw errors on age diff calculation.
    player_hash.each do |player|
      next if player['firstname'] == ""  # Skips non-player entries
      data_hash = {}
      sport = Sport.find_by(title: "football")
      position = Position.find_or_create_by(title: player["position"], sport: sport)

      data_hash["name_brief"] = "#{player["firstname"].first}. #{player["lastname"]}"
      data_hash["first_name"] = player["firstname"]
      data_hash["last_name"] = player["lastname"]
      data_hash["age"] = player["age"]
      data_hash["average_position_age_diff"] = 0

      unless Player.find_by(data_hash)
        new_player = Player.new(data_hash)
        new_player.sport = sport
        new_player.position = position
        new_player.save!
      end
    end
  end

  def self.create_basketball_players_from_JSON(player_hash)
    player_hash.each do |player|
      next if player['firstname'] == ""  # Skips non-player entries
      data_hash = {}
      sport = Sport.find_by(title: "basketball")
      position = Position.find_or_create_by(title: player["position"], sport: sport)

      data_hash["name_brief"] = "#{player["firstname"]} #{player["lastname"].first.upcase}."
      data_hash["first_name"] = player["firstname"]
      data_hash["last_name"] = player["lastname"]
      data_hash["age"] = player["age"]
      data_hash["average_position_age_diff"] = 0

      unless Player.find_by(data_hash)
        new_player = Player.new(data_hash)
        new_player.sport = sport
        new_player.position = position
        new_player.save!
      end
    end
  end
end
