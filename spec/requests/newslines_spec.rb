require 'rails_helper'

RSpec.describe 'Newslines', type: :request do
  describe 'GET /newslines' do
    it 'works! (now write some real specs)' do
      get newslines_index_path
      expect(response.status).to be(200)
    end
  end
end
