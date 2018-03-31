class PlayerSerializer
  def self.serialize(player)
    serialized_player = '{'

    serialized_player += '"id": ' + player.id.to_s + ', '
    serialized_player += '"name_brief": "' + player.name_brief + '", '
    serialized_player += '"first_name": "' + player.first_name + '", '
    serialized_player += '"last_name": "' + player.last_name + '", '
    serialized_player += '"position": "' + player.position.title + '", '
    player.age ? (serialized_player += '"age": ' + player.age.to_s + ', ') : (serialized_player += '"age": "null", ')
    player.age ? (serialized_player += '"average_position_age_diff": ' + player.average_position_age_diff.to_s) : (serialized_player += '"average_position_age_diff": "null"')

    serialized_player += '}'
  end

  def self.mass_serialize(players)
    result_string = '['
    players.each do |player|
      serialized_player = PlayerSerializer.serialize(player)
      serialized_player += ', '

      result_string << serialized_player
    end
    result_string.chomp(", ") + ']'
  end
end
