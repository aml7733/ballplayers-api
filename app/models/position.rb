class Position < ApplicationRecord
  belongs_to :sport
  has_many :players, dependent: :restrict_with_exception

  def calculate_avg_age
    total = 0.0
    count = 0
    self.players.each do |player|
      next unless player.age  # Many of JSON players do not have age param (~3000 of ~9000 are missing or nil)
      
      total += player.age
      count += 1
    end
    self.avg_age = (total/count).round(2)
    self.save!
  end
end
