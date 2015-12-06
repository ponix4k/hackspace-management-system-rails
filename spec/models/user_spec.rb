require "rails_helper"

RSpec.describe User, type: :model do
  describe "when the user is not signed in" do
    it "creates a new session" do
      user = create(:user)
      user.process_session

      expect(user.hs_sessions.count).to eq(1)
    end
  end

  describe "when the user is signed in" do
    it "signs_out_the_user" do
      user = create(:user)
      user.hs_sessions.create(timein: Time.now)
      user.process_session

      expect(user.hs_sessions.last.timeout).not_to be_nil
    end
  end
end
