require 'sinatra/base'

class BirthdayApp < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/greet' do
    erb(:greet)
  end
end
