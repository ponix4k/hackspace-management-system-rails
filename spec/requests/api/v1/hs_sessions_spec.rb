require 'rails_helper'

describe 'POST /v1/hs_sessions' do
  it 'creates a new HS Session' do
    user = create(:user)
    post '/v1/hs_sessions', {
      uid: user.uid
    }

    @hs_session = user.hs_sessions.last
    expect(response.status).to eq(200)
    expect(@hs_session.user.uid).to eq(user.uid)
  end
end
