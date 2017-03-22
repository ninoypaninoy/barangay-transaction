class User < ActiveRecord::Base
  validates :username, presence: true, format: {with: /[0-9a-zA-Z]/}, length: {minimum: 4, maximum: 12}
  validates_uniqueness_of :username
  validates_presence_of :password, :on => :create
  validates :password, format: {with: /[0-9a-zA-Z]/}, length: {minimum: 4, maximum: 12}
  validates_confirmation_of :password



  attr_accessor :password
  before_save :encrypt_password



  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
