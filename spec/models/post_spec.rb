require 'rails_helper'

describe Post do
  it { should have_many :tags }
  it { should have_many(:users).through(:tags) }
  it { should validate_presence_of :owner_id }
end
