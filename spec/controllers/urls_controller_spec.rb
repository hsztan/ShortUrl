# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UrlsController, type: :request do
  describe 'GET index' do
    it 'returns a 200' do
      url = FactoryBot.create(:url)
      url2 = FactoryBot.create(:url)
      puts url.inspect
      puts url2.inspect
      get urls_path
      expect(response).to have_http_status(:ok)
    end
  end
end
