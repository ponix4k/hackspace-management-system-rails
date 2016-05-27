require 'rails_helper'

RSpec.describe HsSession, type: :model do
  context "associations" do
    it { should belong_to(:user) }
  end

  describe "when the user is not signed in" do
    it "creates a new session" do
      user = create(:user)
      hs_session = HsSession.new(user: user)
      hs_session.process_session

      expect(user.hs_sessions.count).to eq(1)
      expect(hs_session.status).to eq("IN")
    end
  end

  describe "when the user is signed in" do
    it "signs_out_the_user" do
      user = create(:user)
      hs_session = user.hs_sessions.create(
        timein: no_delay,
        status: "IN",
        updated_at: no_delay
      )
      hs_session.process_session

      expect(user.hs_sessions.last.timeout).not_to be_nil
    end
  end

  it "creates a time diff on sign out" do
    user = create(:user)
    time_in = Time.local(2015, 10, 1, 8, 0, 0)
    hs_session = HsSession.create(user: user)
    time = 4.hours

    Timecop.freeze(time_in) do
      hs_session.process_session
    end

    Timecop.freeze(time_in + time) do
      hs_session.process_session
    end

    expect(hs_session.diff).to eq(4.0)
  end

  def no_delay
    31.seconds.ago
  end
end
