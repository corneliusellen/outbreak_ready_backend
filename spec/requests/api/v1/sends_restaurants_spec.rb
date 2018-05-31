require 'rails_helper'

describe 'Search API' do
  it 'Sends only restaurants matching query' do
    params = {near: 'denver', query: 'linger'}
    get "/api/v1/search/restaurants", params: params

    result = JSON.parse(response.body)

    result.each do |element|
      expect(element["venue_id"]).to eq('4dc2d699d22dd7df9ab25063')
      expect(element["name"]).to eq('Linger')
      expect(element["address"]).to eq('2030 W 30th Ave, Denver, CO 80211')
    end
  end
end
