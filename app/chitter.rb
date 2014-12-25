require 'data_mapper'
require 'sinatra/base'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require'./app/models/user.rb'

DataMapper.finalize

DataMapper.auto_upgrade!


class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
