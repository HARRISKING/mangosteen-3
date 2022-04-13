require 'rails_helper'

RSpec.describe "Api::V1::Items", type: :request do
  describe "create" do
    it "should create a items" do
      post '/api/v1/items', params: {amount: 1000, note: '测试items-1'}
      expect(response.status).to eq 200  
      json = JSON.parse response.body
      expect(json['resource']['id']).to be_an(Numeric)
      expect(json['resource']['amount']).to eq 1000
    end
  end


  describe "index" do
    it "should find the items" do
      11.times { Item.create amount: 1111 }
      get '/api/v1/items?page'
      expect(response).to have_http_status 200
      json = JSON.parse(response.body)
      expect(json['resources'].size).to eq 10
      get '/api/v1/items?page=2'
      expect(response).to have_http_status 200
      json = JSON.parse(response.body)
      expect(json['resources'].size).to eq 1
    end
  end
end
