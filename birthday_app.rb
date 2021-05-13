require 'sinatra/base'

class BirthdayApp < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/greet' do
    @name = params[:name]
    birthday = params[:birthday]
    data = birthday.split('-').map(&:to_i)
    birthday = Date.civil(Date.today.year, data[1], data[2])
    if birthday == Date.today 
      erb(:greet)
    else
      birthday = Date.civil(Date.today.year + 1, data[1], data[2])
      @days_until_birthday = (birthday - Date.today).to_i
      @days_until_birthday = @days_until_birthday > 364 ? @days_until_birthday - 365 : @days_until_birthday
      erb(:until)
    end
  end
end
