class Player < ApplicationRecord
  belongs_to :position
  belongs_to :sport

  def self.populate_age_diff
    self.all.each do |player|
      unless player.age
        player.average_position_age_diff = nil
        player.save!
        next
      end
      player.average_position_age_diff = (player.age - player.position.avg_age).round(2)
      player.save!
    # Could do absolute value, but pos/neg is more descriptive (neg = younger than avg)
    end
  end

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

  def self.create_football_players_from_JSON(player_hash)
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
