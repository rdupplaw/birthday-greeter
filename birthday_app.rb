# frozen_string_literal: true

require 'sinatra/base'
require_relative './lib/birthday'

# Accepts birthday and responds accordingly
class BirthdayApp < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/greet' do
    @name = params[:name]
    birthday = Birthday.parse(params[:birthday])

    if birthday.anniversary?
      erb(:greet)
    else
      @diff = birthday.days_until
      erb(:until)
    end
  end
end
