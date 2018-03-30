class Position < ApplicationRecord
  belongs_to :sport
  has_many :players, dependent: :restrict_with_exception
end
