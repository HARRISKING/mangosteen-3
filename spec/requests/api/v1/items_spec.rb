require 'rails_helper'

RSpec.describe "Api::V1::Items", type: :request do
  describe "create" do
    it "should create a items" do
      post '/api/v1/items', params: {amount: 1000, note: '测试items-1'}
      expect(response.status).to eq 200  
    end

  end
end
