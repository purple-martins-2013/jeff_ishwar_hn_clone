class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    BCrypt::Password.new(User.where(email: email).first.password_hash) == password
  end

end
