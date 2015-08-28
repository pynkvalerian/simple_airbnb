class User < ActiveRecord::Base

  has_many :properties

  def self.authenticate(email, password)
    @user = User.find_by(email: email, password: password)
  end

end
