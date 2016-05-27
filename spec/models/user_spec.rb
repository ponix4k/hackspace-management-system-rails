require "rails_helper"

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:hs_sessions) }
  end

  describe "validations" do
    it { should validate_presence_of(:uid) }
  end
end
