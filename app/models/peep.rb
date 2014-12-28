class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id,      Serial
  property :message, Text
  property :time,    Time

  validates_length_of :message, :within => 1..140

end