class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :hs_sessions
  validates :uid, presence: true
  validates :uid, uniqueness: true

  before_validation :generate_password, if: :password_needs_to_be_generated?

  ROLES = %w(user admin).freeze

  def hs_session_can_be_created?
    hs_sessions.empty? || hs_sessions.last.timeout?
  end

  private

  def generate_password
    self.password = SecureRandom.hex(10)
  end

  def password_needs_to_be_generated?
    user_exists? && admin_exists?
  end

  def user_exists?
    id.nil?
  end

  def admin_exists?
    User.count > 0
  end
end
