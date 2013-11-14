class User < ActiveRecord::Base
  require 'bcrypt'

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true

  def userdef
    @email = email
    @salt = salt
    @hashed_password = hashed_password
  end


  attr_accessor :password, :password_confirmation

  has_many :scraps

  before_save :hash_password

  def authenticate(password)
    self.hashed_password ==
     BCrypt::Engine.hash_secret(password, self.salt)
  end

  private
  def hash_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password =
       BCrypt::Engine.hash_secret(password, self.salt)
      password = password_confirmation = nil
    end
  end
end



