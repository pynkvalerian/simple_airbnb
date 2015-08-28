class User < ActiveRecord::Base

  has_many :properties
  has_many :bookings

  def self.authenticate(email, password)
    @user = User.find_by(email: email, password: password)
  end

end
