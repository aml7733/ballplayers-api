require 'rails_helper'

RSpec.describe Sport, type: :model do
  it { should have_many(:positions) }
  it { should have_many(:players) }
end
