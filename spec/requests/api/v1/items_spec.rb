require 'rails_helper'

RSpec.describe "Api::V1::Items", type: :request do
  describe "新增 items" do
    it "should create a items" do
      post '/api/v1/items', params: {amount: 1000, note: '测试items-1'}
      expect(response.status).to eq 200  
      json = JSON.parse response.body
      expect(json['resource']['id']).to be_an(Numeric)
      expect(json['resource']['amount']).to eq 1000
    end
  end

  describe "查询 items" do
    it "should find all items" do
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

    it "should find the special items" do
      items = Item.create! amount: 1001, note: '测试接口1'
      get "/api/v1/items/#{items.id}" 
      expect(response).to have_http_status 200  
      body = JSON.parse(response.body)
      expect(body["resource"]["amount"]).to eq 1001  
    end

    
 end

  describe "删除" do
    it "should delete the item" do
      items = Item.create! amount: 1001, note: '测试接口1'
      delete "/api/v1/items/#{items.id}"
      expect(response).to have_http_status 200
    end
  end
  
  describe "修改" do
    it "should update the item" do
      items = Item.create! amount: 1001, note: '测试接口1'
      patch "/api/v1/items/#{items.id}", params: {amount: 1002, note: '测试接口2'}
      expect(response).to have_http_status 200
    end
    
  end
  
end
