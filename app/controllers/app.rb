class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    haml :index
  end

end