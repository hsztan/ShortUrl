# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Url, type: :model do
  before do
    @url = FactoryBot.create(:url)
  end
  describe 'validations' do
    it 'validates original URL is a valid URL' do
      skip 'add test'
    end

    it 'validates short URL is present' do
      skip 'add test'
    end

    # add more tests
  end
end
