require 'rails_helper'

RSpec.describe "Api::V1::Tags", type: :request do
  describe "创建tag" do
    it "should create a tag" do
      post "/api/v1/tags", params: {tag_name: '公交', tag_icon:'imageSrc'}
      expect(response).to have_http_status 200 
      body = JSON.parse(response.body)
      expect(body["resource"]["tag_name"]).to eq "公交"
      expect(body['resource']["tag_icon"]).to eq "imageSrc"  
    end
  end

  describe "查询所有（分页）的tag" do
    it "should find all tag" do
      11.times { Tag.create tag_name: '公交', tag_icon:'imageSrc'  }
      get '/api/v1/tags'
      expect(response).to have_http_status 200  
      body = JSON.parse(response.body)
      expect(body["resources"].size).to eq 10  
      get '/api/v1/tags?page=2'
      expect(response).to have_http_status 200  
      body = JSON.parse(response.body)
      expect(body["resources"].size).to eq 1
    end
  end

  describe "查询单个的tag" do
    it "should find the tag" do
      tag = Tag.create! tag_name: "公交", tag_icon: 'imageSrc'
      get "/api/v1/tags?tag_id=#{tag.id}"
      expect(response).to have_http_status 200  
    end

    it "could not find the wrong tag" do
      get "/api/v1/tags?tag_id=9999999999999999999"
      body = JSON.parse(response.body)
      expect(response).to have_http_status 200  
      expect(body["resources"].size).to eq 0  
    end
  end
end
