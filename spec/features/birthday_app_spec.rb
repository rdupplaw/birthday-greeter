# frozen_string_literal: true

require 'capybara/rspec'
require_relative '../../birthday_app'
require 'date'

Capybara.app = BirthdayApp

feature 'Birthday greeting' do
  context 'when input birthday is today' do
    it 'wishes a happy birthday' do
      today = Date.today.to_s

      visit('/')
      fill_in('name', with: 'John')
      fill_in('birthday', with: today)
      click_button('Go!')

      expect(page).to have_content('Happy Birthday John!')
    end
  end

  context 'when input birthday is not today' do
    it 'says the number of days until next birthday' do
      birthday = '1995-04-17'

      visit('/')
      fill_in('name', with: 'Jen')
      fill_in('birthday', with: birthday)
      click_button('Go!')

      expect(page).to have_content('Your next birthday will be in 339 days, Jen.')
    end
  end
end
