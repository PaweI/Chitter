require 'data_mapper'
require 'sinatra/base'
require 'haml'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require'./app/models/user.rb'

DataMapper.finalize

DataMapper.auto_upgrade!


class Chitter < Sinatra::Base

  configure :production do
    set :haml, { :ugly=>true }
  end

  configure :development do
    set :haml, { :ugly=>true }
  end

  get '/' do
    haml :index
  end

  get '/users/new' do
    haml :"users/new"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
