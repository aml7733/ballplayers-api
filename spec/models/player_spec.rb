require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should belong_to(:sport) }
  it { should belong_to(:position) }
end
