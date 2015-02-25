class Chitter < Sinatra::Base

  post '/peeps/new' do
    if current_user == nil
      flash[:errors] = ['You can not Peep when not logged in']
      redirect to '/'
    else
      Peep.create(message: params[:peep],
                  time: Time.now, 
                  user_id: current_user.id)
      redirect to '/'
    end
  end

end