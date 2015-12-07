class Api::V1::HsSessionsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    user = User.find_by(uid: hs_sessions_params[:uid])
    user.process_session
    if user.save
      @hs_session = user.hs_sessions.last
      render
    else
      render json: {
        message: "Something went wrong",
        errors: user.errors.full_messages
      }, status: 422
    end
  end

  private

  def hs_sessions_params
    {
      uid: params[:uid]
    }
  end
end
