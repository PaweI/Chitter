class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id,      Serial
  property :message, Text, length: 140
  property :time,    Time

end