class Peep
  include DataMapper::Resource

  property :id,      Serial
  property :message, Text, length: 140
  property :time,    Time

  def initialize(message)
    self.message = message
    self.time = Time.now
  end
end