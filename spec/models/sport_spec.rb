require 'rails_helper'

RSpec.describe Sport, type: :model do
  it { should have_many(:positions).dependent(:restrict_with_exception) }
  it { should have_many(:players).dependent(:restrict_with_exception) }
end
