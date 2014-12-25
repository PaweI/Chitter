class Chitter < Sinatra::Base

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

end