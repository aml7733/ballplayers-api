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

  def self.create_from_data_and_sport(players, sport)
    this_sport = Sport.find_by!(title: sport)

    players.each do |player|
      next if player["firstname"] == "" # Skips non-player entries
      position = Position.find_or_create_by(title: player["position"], sport: this_sport)
      data_hash = begin_data_hash(player)

      case this_sport.title
      when 'baseball'
        data_hash["name_brief"] = "#{player["firstname"].first}. #{player["lastname"].first.upcase}." #in case of Jacob deGrom, etc.
      when 'football'
        data_hash["name_brief"] = "#{player["firstname"].first}. #{player["lastname"]}"
      when 'basketball'
        data_hash["name_brief"] = "#{player["firstname"]} #{player["lastname"].first.upcase}."
      end

      assign_and_save_player(data_hash, this_sport, position) unless Player.find_by(data_hash)
    end
  end

  private

    def self.begin_data_hash(player)
      data_hash = {}
      data_hash["first_name"] = player["firstname"]
      data_hash["last_name"] = player["lastname"]
      data_hash["age"] = player["age"]
      data_hash["average_position_age_diff"] = 0
      data_hash
    end

    def self.assign_and_save_player(data_hash, sport, position)
      new_player = Player.new(data_hash)
      new_player.sport = sport
      new_player.position = position
      new_player.save!
    end
end
