require 'rails_helper'

RSpec.describe Position, type: :model do
  it { should belong_to(:sport) }
  it { should have_many(:players) }
end
