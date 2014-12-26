env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './app/models/user.rb'
require './app/models/peep.rb'

DataMapper.finalize
