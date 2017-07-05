# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
validates :email, :password_digest, presence:true
validates :password, length: {minimum: 6, allow_nil:true}
after_initialize :ensure_session_token

attr_reader :password

  def self.find_by_credentials(email, pw)
    user = User.find_by(email: email)
    if user && user.valid_password?(pw)
      return user
    else
      nil
    end
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end


  def valid_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end


  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end


end
