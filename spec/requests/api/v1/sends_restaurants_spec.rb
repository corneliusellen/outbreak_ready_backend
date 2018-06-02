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

  it 'Edge case: Sends message if no restaurants found' do
    params = {near: 'chicago', query: 'linger'}
    get "/api/v1/search/restaurants", params: params

    result = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(result["message"]).to eq("No restaurants found for your search")
  end

  it 'Edge case: Sends all restaurants in area for chains' do
    params = {near: 'denver', query: 'pandaexpress'}
    get "/api/v1/search/restaurants", params: params

    result = JSON.parse(response.body)

    expect(result.count).to eq(29)
    result.each do |element|
      expect(element["name"].downcase).to include('panda express')
    end
  end
end
