class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :hs_sessions
  validates :uid, presence: true
  validates :uid, uniqueness: true

  before_validation :generate_temp_password

  def process_session
    if hs_sessions.empty? || hs_sessions.last.timeout?
      create_new_session
    else
      sign_out_user
    end
  end

  def work_out_diff
    HsSession.session_length(self)
  end

  private

  def generate_temp_password
    if self.password.nil?
      self.password = SecureRandom.hex(10)
    end
  end

  def create_new_session
    hs_sessions.create(timein: Time.now)
    puts "Signed in"
  end

  def sign_out_user
    hs_sessions.last.update_attribute(:timeout, Time.now)
    puts "Signed out"
    self.work_out_diff
  end
end
