require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:posts).through(:tags) }

  it { should have_many :tags }

  it "should have a current_user" do
      user = FactoryGirl.create(:user)
      expect(user).to_not eq(nil)
    end
end
