require 'data_mapper'
require 'sinatra/base'
require 'haml'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require'./app/models/user.rb'

DataMapper.finalize

DataMapper.auto_upgrade!


class Chitter < Sinatra::Base

  enable :sessions

  configure :production do
    set :haml, { :ugly=>true }
  end

  configure :development do
    set :haml, { :ugly=>true }
  end

  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end

  get '/' do
    haml :index
  end

  get '/users/new' do
    haml :"users/new"
  end

  post '/users' do
    user = User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect to '/'
    else
      haml :"/users/new"
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
