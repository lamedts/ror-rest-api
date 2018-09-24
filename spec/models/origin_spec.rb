require 'rails_helper'

RSpec.describe Origin, type: :model do
  it { should belong_to(:order) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longtitude) }
end
