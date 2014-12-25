require 'data_mapper'
require 'sinatra/base'
require 'haml'
require 'rack-flash'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require'./app/models/user.rb'

DataMapper.finalize

DataMapper.auto_upgrade!


class Chitter < Sinatra::Base

  enable :sessions

  use Rack::Flash
  use Rack::MethodOverride


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
      flash.now[:errors] = user.errors.full_messages
      haml :"/users/new"
    end
  end

  get '/sessions/new' do
    haml :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/'
    else 
      flash[:errors] = ["Email or password is incorrect"]
      haml :"sessions/new"
    end
  end

  delete '/sessions' do
    flash[:notice] = "See you again soon"
    session[:user_id] = nil
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
