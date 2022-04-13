class Api::V1::ItemsController < ApplicationController
  def create 
    item = Item.new amount: params[:amount]
		if item.save
			render json: {resource: item}
		else
			render json: {errors: item.errors}
		end
  end
end
