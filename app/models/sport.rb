class Sport < ApplicationRecord
  has_many :positions, dependent: :restrict_with_exception
  has_many :players, dependent: :restrict_with_exception
end
