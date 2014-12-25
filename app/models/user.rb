require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader   :password
  attr_accessor :password_confirmation

  property :id,              Serial
  property :name,            String
  property :username,        String, :unique => true, :message => "Username already taken"
  property :email,           String, :unique => true, :message => "Email already taken"
  property :password_digest,  Text

  validates_confirmation_of :password, message: "Your passwords don't match"
  validates_presence_of :password_digest, message: "You didn't enter your password"
  validates_length_of :password, within: 8..32, message: "Your password has incorrect length"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end


