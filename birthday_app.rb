# frozen_string_literal: true

require 'sinatra/base'

# Accepts birthday and responds accordingly
class BirthdayApp < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/greet' do
    @name = params[:name]
    birthday = Date.parse(params[:birthday])
    today = Date.today
    @diff = birthday.yday - today.yday

    if @diff.zero?
      erb(:greet)
    elsif @diff.negative?
      @diff += 365
      erb(:until)
    else
      erb(:until)
    end
  end
end
