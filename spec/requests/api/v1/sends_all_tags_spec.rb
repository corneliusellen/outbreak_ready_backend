require 'rails_helper'

describe 'Intake API' do
  it "sends categories with tags" do
    get '/api/v1/tags'

    result = JSON.parse(response.body)

    expect(result.first["name"]).to eq('Etiology')
    expect(result.first["tags"].count).to eq(6)
    expect(result[1]["name"]).to eq('Transmission')
    expect(result[1]["tags"].count).to eq(6)
    expect(result.last["name"]).to eq('Setting')
    expect(result.last["tags"].count).to eq(12)
  end
end
