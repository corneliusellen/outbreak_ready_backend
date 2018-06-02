require 'rails_helper'

describe 'Search API' do
  it 'Sends menus for specified restaurant' do
    params = {venue_id: '4dc2d699d22dd7df9ab25063'}
    get "/api/v1/search/menus", params: params

    result = JSON.parse(response.body)

    expect(result.count).to eq(3)
    expect(result.first["name"]).to eq("Happy Hour")
    expect(result.first["foods"]).to be_an(Array)
  end
end
