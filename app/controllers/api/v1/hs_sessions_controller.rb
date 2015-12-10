class Api::V1::HsSessionsController < ApplicationController
  protect_from_forgery with: :null_session
  rescue_from Exception, with: :oh_no_no_no

  def create
    user = User.find_by(uid: hs_sessions_params[:uid])
    user.process_session
    if user.save
      @hs_session = user.hs_sessions.last
      render json: {
        message: "OK"
      }
    else
      oh_no_no_no
    end
  end

  private

  def hs_sessions_params
    {
      uid: params[:uid]
    }
  end

  def oh_no_no_no
    render json: {
      message: "That is not happening"
    }, status: 404
  end
end
