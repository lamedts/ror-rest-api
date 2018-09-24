require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_one(:destination).dependent(:destroy) }
  it { should have_one(:origin).dependent(:destroy) }
  it { should validate_presence_of(:status) }
end
