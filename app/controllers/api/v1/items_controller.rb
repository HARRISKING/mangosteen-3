class Api::V1::ItemsController < ApplicationController
  def create 
    item = Item.new amount: params[:amount]
				if item.save
					render json: {resource: item}
				else
					render json: {errors: item.errors}
				end
  end

		def index
			items = Item.page(params[:page]).per 10
			render json: {resources: items, pager: {
				page: params[:page],
				per_page: 10,
				count: Item.count
			}}
		end


		def show
			render_resource Item.find params[:id]
		end

		def destroy
			items = Item.find params[:id]
			head items.destroy ? :ok : :bad_request
		end

		def update
			items = Item.find params[:id]
			items.update amount: params[:amount], note: params[:note]
			render_resource items
		end
end
