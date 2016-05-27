require 'rails_helper'

RSpec.describe HsSession, type: :model do
  context "associations" do
    it { should belong_to(:user) }
  end

  describe "when the user is not signed in" do
    it "creates a new session" do
      user = create(:user)
      HsSession.process_session(user)

      expect(user.hs_sessions.count).to eq(1)
    end
  end

  describe "when the user is signed in" do
    it "signs_out_the_user" do
      user = create(:user)
      user.hs_sessions.create(timein: Time.now)
      HsSession.process_session(user)

      expect(user.hs_sessions.last.timeout).not_to be_nil
    end
  end

  it "creates a time diff on sign out" do
    user = create(:user)
    time_in = Time.local(2015, 10, 1, 8, 0, 0)

    [4.hours, 0.5.hours, 3.5.hours, 0.25.hours].each do |time|
      uid = SecureRandom.hex

      Timecop.freeze(time_in) do
        HsSession.process_session
      end

      Timecop.freeze(time_in + time) do
        HsSession.process_session
      end

      session = user.hs_sessions.last

      expect(session.diff).to eq((time / 1.hour).round(2))
    end
  end
end
