# frozen_string_literal: true

require 'rails_helper'
require 'webdrivers'

RSpec.describe 'Short Urls', type: :system do
  before do
    driven_by :selenium, using: :chrome
  end

  describe 'index' do
    it 'shows a list of short urls' do
      visit root_path
      expect(page).to have_text('HeyURL!')
      # expect page to show 10 urls
    end
  end

  describe 'show' do
    it 'shows a panel of stats for a given short url' do
      visit url_path('ABCDE')
      # expect page to show the short url
    end

    context 'when not found' do
      it 'shows a 404 page' do
        visit url_path('NOTFOUND')
        # expect page to be a 404
      end
    end
  end

  describe 'create' do
    context 'when url is valid' do
      it 'creates the short url' do
        visit '/'
        # add more expections
      end

      it 'redirects to the home page' do
        visit '/'
        # add more expections
      end
    end

    context 'when url is invalid' do
      it 'does not create the short url and shows a message' do
        visit '/'
        # add more expections
      end

      it 'redirects to the home page' do
        visit '/'
        # add more expections
      end
    end
  end

  describe 'visit' do
    it 'redirects the user to the original url' do
      visit visit_path('ABCDE')
      # add more expections
    end

    context 'when not found' do
      it 'shows a 404 page' do
        visit visit_path('NOTFOUND')
        # expect page to be a 404
      end
    end
  end
end
